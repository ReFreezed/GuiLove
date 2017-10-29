--[[============================================================
--=
--=  InputField class v1.0
--=  - Written by Marcus 'ReFreezed' Thunström
--=  - MIT License (See the bottom of this file)
--=
--=  Dependencies:
--=  - LÖVE 0.10.2
--=  - refreezed.class
--=
--==============================================================

	update

	getBlinkPhase, resetBlinking
	getCursor, setCursor, moveCursor, getCursorSelectionSide, getAnchorSelectionSide
	getFont, setFont
	getScroll, setScroll
	getSelection, setSelection, selectAll, getSelectedText
	getText, setText, getVisibleText
	getTextLength
	getTextOffset, getCursorOffset, getSelectionOffset
	getWidth, setWidth
	insert, replace
	isFontFilteringActive, setFontFilteringActive
	isPasswordActive, setPasswordActive

	mousepressed, mousemoved, mousereleased
	keypressed, textinput

----------------------------------------------------------------

	Enums:

	SelectionSide
	- start: The start (left side) of the text selection
	- end: The end (right side) of the text selection

	TextCursorAlignment
	- left: Align cursor to the left
	- right: Align cursor to the right

--============================================================]]



-- Modules
local moduleFolder = ('.'..(...)) :gsub('%.%w+$', '')
local utf8  = require'utf8'
local class = require((moduleFolder..'.class'):sub(2))

local LS = love.system
local LT = love.timer

local InputField = class('InputField', {

	DOUBLE_CLICK_MAX_DELAY = 0.4,

	_blinkTimer = 0,
	_cursorPosition = 0, _selectionStart = 0, _selectionEnd = 0,
	_doubleClickExpirationTime = 0.0,
	_doubleClickLastX = 0.0, _doubleClickLastY = 0.0,
	_editHistory = nil, _editHistoryIndex = 1, _editHistoryGroup = nil,
	_font = love.graphics.getFont(),
	_fontFilteringIsActive = false,
	_mouseScrollX = nil,
	_mouseTextSelectionStart = nil,
	_passwordIsActive = false,
	_scroll = 0,
	_text = '',
	_width = math.huge,

})



--==============================================================
--==============================================================
--==============================================================

local clamp
local cleanString
local getNextWordBound
local getPositionInText
local isModKeyState
local isNumber, isInteger, isFiniteNumber
local limitScroll



function clamp(n, min, max)
	return math.min(math.max(n, min), max)
end



-- string = cleanString( string [, field ] )
function cleanString(s, self)
	s = s:gsub('[%z\1-\31]+', '')
	if (self and self._fontFilteringIsActive) then
		local font = self._font
		s = s:gsub(utf8.charpattern, function(c)
			if (not font:hasGlyphs(c)) then
				return ''
			end
		end)
	end
	return s
end



-- boundPosition = getNextWordBound( string, startPosition, direction:int )
-- Cursor behavior examples:
--   a|a bb  ->  aa| bb
--   aa| bb  ->  aa bb|
--   aa |bb  ->  aa bb|
--   cc| = dd+ee  ->  cc =| dd+ee
--   cc =| dd+ee  ->  cc = dd|+ee
--   cc = dd|+ee  ->  cc = dd+|ee
--   f|f(-88  ->  ff|(-88
--   ff|(-88  ->  ff(-|88
--   ff(|-88  ->  ff(-|88
do
	local function newSet(values)
		local set = {}
		for _, v in ipairs(values) do
			set[v] = true
		end
		return set
	end

	local punctuation = '!"#$%&\'()*+,-./:;<=>?@[\\]^`{|}~'; punctuation = newSet{punctuation:byte(1, #punctuation)};
	local whitespace = newSet{9,10,11,12,13,32} -- horizontal tab, LF, vertical tab, form-feed, CR, space

	local typeWord = 1
	local typePunctuation = 2
	local typeWhitespace = 3

	local function getCodepointCharType(c)
		if (punctuation[c]) then
			return typePunctuation
		elseif (whitespace[c]) then
			return typeWhitespace
		end
		return typeWord
	end

	function getNextWordBound(s, pos, dirNum)
		assert(type(s) == 'string')
		assert(dirNum == 1 or dirNum == -1)
		assert(isInteger(pos))
		if (dirNum < 0) then
			pos = pos+1
		end
		local codepoints = {utf8.codepoint(s, 1, #s)}
		pos = clamp(pos, 0, #codepoints)
		while true do
			pos = pos+dirNum
			-- Check for end of string
			local prevC, nextC = codepoints[pos], codepoints[pos+dirNum]
			if not (prevC and nextC) then
				if (dirNum < 0) then
					pos = pos-1
				else
					pos = pos+1
				end
				break
			end
			-- Check for word bound
			local prevType, nextType = getCodepointCharType(prevC), getCodepointCharType(nextC)
			if (nextType ~= prevType and not (nextType ~= typeWhitespace and prevType == typeWhitespace)) then
				if (dirNum < 0) then
					pos = pos-1
				end
				break
			end
		end
		return clamp(pos, 0, #codepoints)
	end

end



-- position = getPositionInText( font, string, x )
function getPositionInText(font, s, x)
	x = math.floor(x)
	if (x <= 0) then
		return 0
	end
	local lastW, len = 0, utf8.len(s)
	for pos = 1, len do
		local w = font:getWidth(s:sub(1, utf8.offset(s, pos+1)-1))
		if (w > x and lastW <= x) then
			return pos+(x < lastW+(w-lastW)/2-1 and -1 or 0)
		end
		lastW = w
	end
	return len
end



-- result:boolean = isModKeyState( state:string )
-- Example: isModKeyState("cs") -- returns true if the ctrl and alt keys are pressed and other modifier keys are not
do
	local isDown = love.keyboard.isDown
	if (LS.getOS() == 'OS X') then
		function isModKeyState(stateStr)
			return (stateStr:find('a', 1, true) ~= nil) == isDown('lalt', 'ralt')
			   and (stateStr:find('c', 1, true) ~= nil) == isDown('lgui', 'rgui')
			   and (stateStr:find('s', 1, true) ~= nil) == isDown('lshift', 'rshift')
		end
	else
		function isModKeyState(stateStr)
			return (stateStr:find('a', 1, true) ~= nil) == isDown('lalt', 'ralt')
			   and (stateStr:find('c', 1, true) ~= nil) == isDown('lctrl', 'rctrl')
			   and (stateStr:find('s', 1, true) ~= nil) == isDown('lshift', 'rshift')
		end
	end
end



-- reslut = isNumber( value )
function isNumber(v)
	return (v == v and type(v) == 'number')
end

-- reslut = isInteger( value )
function isInteger(v)
	return (isNumber(v) and v == math.floor(v))
end

-- reslut = isFiniteNumber( value )
function isFiniteNumber(v)
	return (isNumber(v) and v ~= math.huge and v ~= -math.huge)
end



-- limitScroll( input )
function limitScroll(self)
	local limit = self._font:getWidth(self:getVisibleText())-self._width
	self._scroll = math.max(math.min(self._scroll, limit), 0)
end



--==============================================================
--==============================================================
--==============================================================

local pushHistory
local finilizeHistoryGroup
local clearHistory
local undoEdit, redoEdit



-- pushHistory( input, group )
function pushHistory(self, group)
	local i, state
	if (group and group == self._editHistoryGroup) then
		i = self._editHistoryIndex
		state = self._editHistory[i]
	else
		i = self._editHistoryIndex+1
		state = {}
		self._editHistoryIndex = i
		self._editHistory[i] = state
	end
	for i = i+1, #self._editHistory do
		self._editHistory[i] = nil
	end
	state.text           = self._text
	state.cursorPosition = self._cursorPosition
	state.selectionStart = self._selectionStart
	state.selectionEnd   = self._selectionEnd
	self._editHistoryGroup = group
end



-- finilizeHistoryGroup( input )
function finilizeHistoryGroup(self)
	self._editHistoryGroup = nil
end



-- clearHistory( input )
function clearHistory(self)
	for i = 2, #self._editHistory do
		self._editHistory[i] = nil
	end
	self._editHistoryGroup = nil
	self._editHistoryIndex = 1
end



do

	local function applyHistoryState(self, offset)
		self._editHistoryIndex = self._editHistoryIndex+offset
		local state = self._editHistory[self._editHistoryIndex] or error()
		self._text           = state.text
		self._cursorPosition = state.cursorPosition
		self._selectionStart = state.selectionStart
		self._selectionEnd   = state.selectionEnd
	end

	-- undoEdit( input )
	-- TODO: Improve how the cursor and selection are restored on undo [LOW]
	function undoEdit(self)
		if (self._editHistoryIndex == 1) then
			return
		end
		finilizeHistoryGroup(self)
		applyHistoryState(self, -1)
	end

	-- redoEdit( input )
	function redoEdit(self)
		if (self._editHistoryIndex == #self._editHistory) then
			return
		end
		finilizeHistoryGroup(self)
		applyHistoryState(self, 1)
	end

end



--==============================================================
--==============================================================
--==============================================================



-- InputField( [ initialText="" ] )
function InputField:init(text)
	text = cleanString(tostring(text == nil and '' or text))
	local len = utf8.len(text)
	self._text = text
	self._editHistory = {{
		text           = text,
		cursorPosition = len,
		selectionStart = 0,
		selectionEnd   = len,
	}}
end



-- update( deltaTime )
local speed = 5
function InputField:update(dt)

	-- Update scrolling
	local mx = self._mouseScrollX
	local scroll, w = self._scroll, self._width
	if (mx) then
		scroll = (mx < 0 and scroll+speed*mx*dt) or (mx > w and scroll+speed*(mx-w)*dt) or (scroll)
	else
		local visibleText = self:getVisibleText()
		local preText = visibleText:sub(1, utf8.offset(visibleText, self._cursorPosition+1)-1)
		local x = self._font:getWidth(preText)
		scroll = clamp(scroll, x-w, x)
	end
	self._scroll = scroll
	limitScroll(self)

end



--==============================================================



-- phase = getBlinkPhase( )
function InputField:getBlinkPhase()
	return LT.getTime()-self._blinkTimer
end

-- resetBlinking( )
function InputField:resetBlinking()
	self._blinkTimer = LT.getTime()
end



-- position = getCursor( )
function InputField:getCursor()
	return self._cursorPosition
end

-- setCursor( position [, selectionSideToAnchor:SelectionSide ] )
function InputField:setCursor(pos, selSideAnchor)
	finilizeHistoryGroup(self)
	pos = clamp(pos, 0, self:getTextLength())
	self._cursorPosition = pos
	local selStart = (selSideAnchor == 'start' and self._selectionStart or pos)
	local selEnd = (selSideAnchor == 'end' and self._selectionEnd or pos)
	self._selectionStart = math.min(selStart, selEnd)
	self._selectionEnd = math.max(selStart, selEnd)
	self:resetBlinking()
end

-- moveCursor( amount [, selectionSideToAnchor:SelectionSide ] )
function InputField:moveCursor(amount, selSideAnchor)
	self:setCursor(self._cursorPosition+amount, selSideAnchor)
end

-- side:SelectionSide = getCursorSelectionSide( )
function InputField:getCursorSelectionSide()
	return (self._cursorPosition < self._selectionEnd and 'start' or 'end')
end

-- side:SelectionSide = getAnchorSelectionSide( )
function InputField:getAnchorSelectionSide()
	return (self._cursorPosition < self._selectionEnd and 'end' or 'start')
end



-- getFont, setFont
InputField:def'_font'



-- getScroll
InputField:defget'_scroll'

-- setScroll( scroll )
function InputField:setScroll(scroll)
	self._scroll = scroll
	limitScroll(self)
end



-- from, to = getSelection( )
function InputField:getSelection()
	return self._selectionStart, self._selectionEnd
end

-- setSelection( from, to [, cursorAlign:TextCursorAlignment="right" ] )
function InputField:setSelection(from, to, cursorAlign)
	finilizeHistoryGroup(self)
	local len = self:getTextLength()
	from, to = clamp(from, 0, len), clamp(to, 0, len)
	from, to = math.min(from, to), math.max(from, to)
	self._selectionStart, self._selectionEnd = from, to
	self._cursorPosition = (cursorAlign == 'left' and from or to)
	self:resetBlinking()
end

-- selectAll( )
function InputField:selectAll()
	self:setSelection(0, self:getTextLength())
end

-- text = getSelectedText( )
function InputField:getSelectedText()
	local text = self._text
	local i1 = utf8.offset(text, self._selectionStart+1)
	local i2 = utf8.offset(text, self._selectionEnd+1)-1
	return text:sub(i1, i2)
end



-- getText
InputField:defget'_text'

-- setText( text )
function InputField:setText(text)
	self._text = cleanString(tostring(text), self)
	self._cursorPosition = 0
	self._selectionStart = 0
	self._selectionEnd = 0
	pushHistory(self)
end

-- text = getVisibleText( )
function InputField:getVisibleText()
	return (self._passwordIsActive and ('*'):rep(self:getTextLength()) or self._text)
end



-- length = getTextLength( )
-- Length is number of characters in the UTF-8 text string.
function InputField:getTextLength()
	return utf8.len(self._text)
end



-- offset = getTextOffset( )
function InputField:getTextOffset()
	return -math.floor(self._scroll)
end

-- offset = getCursorOffset( )
function InputField:getCursorOffset()
	local visibleText = self:getVisibleText()
	local preText = visibleText:sub(1, utf8.offset(visibleText, self._cursorPosition+1)-1)
	return self._font:getWidth(preText)-math.floor(self._scroll)
end

-- left, right = getSelectionOffset( )
function InputField:getSelectionOffset()
	-- @Incomplete: Handle kerning on the right end of the selection.
	local font, visibleText = self._font, self:getVisibleText()
	local preText1 = visibleText:sub(1, utf8.offset(visibleText, self._selectionStart+1)-1)
	local preText2 = visibleText:sub(1, utf8.offset(visibleText, self._selectionEnd+1)-1)
	local scroll = math.floor(self._scroll)
	return font:getWidth(preText1)-scroll,
	       font:getWidth(preText2)-scroll
end



-- getWidth, setWidth
InputField:def'_width'



do

	local function insertText(self, newText)
		local text, pos = self._text, self._cursorPosition
		local i = utf8.offset(text, pos+1)
		self._text = text:sub(1, i-1)..newText..text:sub(i)
		self._cursorPosition = pos+utf8.len(newText)
		self._selectionStart = self._cursorPosition
		self._selectionEnd = self._cursorPosition
		pushHistory(self, 'insert')
		self:resetBlinking()
	end

	-- Insert text at cursor position
	-- insert( text )
	function InputField:insert(newText)
		insertText(self, cleanString(tostring(newText), self))
	end

	-- Replace text selection with another text
	-- replace( text )
	function InputField:replace(newText)
		newText = cleanString(tostring(newText), self)
		local text, selStart = self._text, self._selectionStart
		local i1 = utf8.offset(text, selStart+1)
		local i2 = utf8.offset(text, self._selectionEnd+1)
		self._text = text:sub(1, i1-1)..text:sub(i2)
		self._selectionEnd = selStart
		self._cursorPosition = selStart
		if (newText == '') then
			pushHistory(self, 'remove')
		else
			insertText(self, newText)
		end
	end

end



-- state = isFontFilteringActive( )
function InputField:isFontFilteringActive()
	return self._fontFilteringIsActive
end

-- setFontFilteringActive( state )
function InputField:setFontFilteringActive(state)
	self._fontFilteringIsActive = state
end



-- state = isPasswordActive( )
function InputField:isPasswordActive()
	return self._passwordIsActive
end

-- setPasswordActive( state )
function InputField:setPasswordActive(state)
	self._passwordIsActive = state
end



----------------------------------------------------------------



-- wasHandled = mousepressed( x, y, button )
function InputField:mousepressed(x, y, buttonN)
	if (buttonN ~= 1) then
		return false
	end
	local visibleText = self:getVisibleText()

	-- Check double click
	local isDoubleClick = false
	if (buttonN == 1) then
		local time = LT.getTime()
		isDoubleClick = (math.abs(self._doubleClickLastX-x) <= 1 and math.abs(self._doubleClickLastY-y) <= 1
			and time < self._doubleClickExpirationTime)
		self._doubleClickExpirationTime = (isDoubleClick and 0 or time+self.DOUBLE_CLICK_MAX_DELAY)
		self._doubleClickLastX, self._doubleClickLastY = x, y
	else
		self._doubleClickExpirationTime = 0.0
	end

	-- Handle mouse press
	local pos = getPositionInText(self._font, visibleText, x+self._scroll)
	if isDoubleClick then
		pos = getNextWordBound(visibleText, pos+1, -1)
		self:setSelection(pos, getNextWordBound(visibleText, pos, 1))
	elseif isModKeyState('s') then
		local anchorPos = (self:getAnchorSelectionSide() == 'start' and self._selectionStart or self._selectionEnd)
		self:setSelection(pos, anchorPos, (pos < anchorPos and 'left' or 'right'))
		self._mouseTextSelectionStart = anchorPos
		self._mouseScrollX = x
	else
		self:setCursor(pos)
		self._mouseTextSelectionStart = pos
		self._mouseScrollX = x
	end
	return true
end

-- wasHandled = mousemoved( x, y )
function InputField:mousemoved(x, y)
	if (not self._mouseTextSelectionStart) then
		return false
	end
	local pos = getPositionInText(self._font, self:getVisibleText(), x+self._scroll)
	self:setSelection(self._mouseTextSelectionStart, pos,
		(pos < self._mouseTextSelectionStart and 'left' or 'right'))
	self._mouseScrollX = x
	return true
end

-- wasHandled = mousereleased( x, y, button )
function InputField:mousereleased(x, y, buttonN)
	if (not self._mouseTextSelectionStart) then
		return false
	end
	self._mouseTextSelectionStart = nil
	self._mouseScrollX = nil
	return true
end



-- wasHandled = keypressed( key, scancode, isRepeat )
function InputField:keypressed(key, scancode, isRepeat)
	if nil then

	-- Left: Move cursor to the left
	elseif (key == 'left' and isModKeyState('')) then
		if (self._selectionStart ~= self._selectionEnd) then
			self:setCursor(self._selectionStart)
		else
			self:moveCursor(-1)
		end
		return true
	-- Shift+Left: Move cursor to the left and preserve selection
	elseif (key == 'left' and isModKeyState('s')) then
		self:moveCursor(-1, self:getAnchorSelectionSide())
		return true
	-- Ctrl+Left: Move cursor to the previous word
	elseif (key == 'left' and isModKeyState('c')) then
		self:setCursor(getNextWordBound(self:getVisibleText(), self._cursorPosition, -1))
		return true
	-- Ctrl+Shift+Left: Move cursor to the previous word and preserve selection
	elseif (key == 'left' and isModKeyState('cs')) then
		self:setCursor(getNextWordBound(self:getVisibleText(), self._cursorPosition, -1), self:getAnchorSelectionSide())
		return true

	-- Right: Move cursor to the right
	elseif (key == 'right' and isModKeyState('')) then
		if (self._selectionStart ~= self._selectionEnd) then
			self:setCursor(self._selectionEnd)
		else
			self:moveCursor(1)
		end
		return true
	-- Shift+Right: Move cursor to the right and preserve selection
	elseif (key == 'right' and isModKeyState('s')) then
		self:moveCursor(1, self:getAnchorSelectionSide())
		return true
	-- Ctrl+Right: Move cursor to the next word
	elseif (key == 'right' and isModKeyState('c')) then
		self:setCursor(getNextWordBound(self:getVisibleText(), self._cursorPosition, 1))
		return true
	-- Ctrl+Shift+Right: Move cursor to the next word and preserve selection
	elseif (key == 'right' and isModKeyState('cs')) then
		self:setCursor(getNextWordBound(self:getVisibleText(), self._cursorPosition, 1), self:getAnchorSelectionSide())
		return true

	-- Home: Move cursor to start
	elseif (key == 'home' and isModKeyState('')) then
		self:setCursor(0)
		return true
	-- Shift+Home: Move cursor to start and preserve selection
	elseif (key == 'home' and isModKeyState('s')) then
		self:setCursor(0, self:getAnchorSelectionSide())
		return true

	-- End: Move cursor to end
	elseif (key == 'end' and isModKeyState('')) then
		self:setCursor(self:getTextLength())
		return true
	-- Shift+End: Move cursor to end and preserve selection
	elseif (key == 'end' and isModKeyState('s')) then
		self:setCursor(self:getTextLength(), self:getAnchorSelectionSide())
		return true

	-- Backspace: Remove selection, previous character, or previous word
	elseif (key == 'backspace') then
		if (self._selectionStart ~= self._selectionEnd) then
			-- void
		elseif (isModKeyState('c')) then
			self._cursorPosition = getNextWordBound(self:getVisibleText(), self._cursorPosition, -1)
			self._selectionStart = self._cursorPosition
		elseif (self._cursorPosition == 0) then
			self:resetBlinking()
			return true
		else
			self._selectionStart = self._cursorPosition-1
			self._selectionEnd = self._cursorPosition
		end
		self:replace('')
		return true

	-- Delete: Remove selection, next character, or next word
	elseif (key == 'delete') then
		if self._selectionStart ~= self._selectionEnd then
			-- void
		elseif isModKeyState('c') then
			self._cursorPosition = getNextWordBound(self:getVisibleText(), self._cursorPosition, 1)
			self._selectionEnd = self._cursorPosition
		elseif self._cursorPosition == self:getTextLength() then
			self:resetBlinking()
			return true
		else
			self._selectionStart = self._cursorPosition
			self._selectionEnd = self._cursorPosition+1
		end
		self:replace('')
		return true

	-- Ctrl+A: Select all text
	elseif (key == 'a' and isModKeyState('c')) then
		self:selectAll()
		return true

	-- Ctrl+C or Ctrl+Insert: Copy selected text
	elseif (key == 'c' and isModKeyState('c')) or (key == 'insert' and isModKeyState('c')) then
		local text = self:getSelectedText()
		if (text ~= '') then
			LS.setClipboardText(text)
			self:resetBlinking()
		end
		return true

	-- Ctrl+X: Cut selected text
	elseif (key == 'x' and isModKeyState('c')) then
		local text = self:getSelectedText()
		if (text ~= '') then
			LS.setClipboardText(text)
			self:replace('')
		end
		return true

	-- Ctrl+V or Shift+Insert: Paste copied text
	elseif (key == 'v' and isModKeyState('c')) or (key == 'insert' and isModKeyState('s')) then
		local text = cleanString(LS.getClipboardText(), self)
		if (text ~= '') then
			self:replace(text)
		end
		self:resetBlinking()
		return true

	-- Ctrl+Z: Undo text edit
	elseif (key == 'z' and isModKeyState('c')) then
		undoEdit(self)
		return true

	-- Ctrl+Shift+Z or Ctrl+Y: Redo text edit
	elseif (key == 'z' and isModKeyState('cs')) or (key == 'y' and isModKeyState('c')) then
		redoEdit(self)
		return true

	end
	return false
end

-- wasHandled = textinput( text )
function InputField:textinput(text)
	if (self._selectionStart ~= self._selectionEnd) then
		self:replace(text)
	else
		self:insert(text)
	end
	return true
end



--==============================================================
--==============================================================
--==============================================================

return InputField

--==============================================================
--=
--=  MIT License
--=
--=  Copyright © 2017 Marcus 'ReFreezed' Thunström
--=
--=  Permission is hereby granted, free of charge, to any person obtaining a copy
--=  of this software and associated documentation files (the "Software"), to deal
--=  in the Software without restriction, including without limitation the rights
--=  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
--=  copies of the Software, and to permit persons to whom the Software is
--=  furnished to do so, subject to the following conditions:
--=
--=  The above copyright notice and this permission notice shall be included in all
--=  copies or substantial portions of the Software.
--=
--=  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--=  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--=  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--=  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--=  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
--=  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
--=  SOFTWARE.
--=
--==============================================================
