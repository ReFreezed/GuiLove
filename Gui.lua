--[[============================================================
--=
--=  GuiLove v0.1 beta
--=  - Written by Marcus 'ReFreezed' Thunström
--=  - MIT License (See the bottom of this file)
--=
--=  Dependencies:
--=  - LÖVE 0.10.2
--=  - refreezed.class
--=  - refreezed.love.InputField
--=
--=  TODO:
--=  - Make pageup/pagedown/home/end work in scrollables.
--=  - Don't draw things that are outside the visible area in scrollables.
--=  - Percentage sizes for elements.
--=  - Remove class module dependance?
--=
--==============================================================



	Basic usage
	----------------------------------------------------------------

	function love.load()
		local Gui = require("Gui")
		gui = Gui()

		local tree = {"root",
			{"vbar", id="myContainer", width=200,
				{"text", text="I'm just a text."},
				{"button", id="myButton", text="Press Me!"},
			},
		}
		gui:load(tree)

		local myButton = gui:find("myButton")
		local pressCount = 0
		myButton:on("press", function(myButton, event)

			pressCount = pressCount+1

			local myContainer = gui:find("myContainer")
			myContainer:insert{ "text", text="Pressed button "..pressCount.." time(s)!" }

		end)

		gui:getRoot():setDimensions(love.graphics.getDimensions())

	end

	function love.mousepressed(x, y, mouseButton)
		gui:mousepressed(x, y, mouseButton)
	end
	function love.mousemoved(x, y)
		gui:mousemoved(x, y)
	end
	function love.mousereleased(x, y, mouseButton)
		gui:mousereleased(x, y, mouseButton)
	end

	function love.update(dt)
		gui:update(dt)
	end

	function love.draw()
		gui:draw()
	end



	Gui methods
	----------------------------------------------------------------

	STATIC  create9PartQuads
	STATIC  draw9PartScaled
	STATIC  newMonochromeImage, newImageUsingPalette

	update
	draw

	keypressed, keyreleased, textinput
	mousepressed, mousemoved, mousereleased, wheelmoved

	areStandardKeysActive, setStandardKeysActive
	blur
	defineStyle
	find, findAll, findActive, findToggled, match, matchAll
	getDefaultSound, setDefaultSound
	getElementAt
	getFont, setFont, getBoldFont, setBoldFont, getSmallFont, setSmallFont, getLargeFont, setLargeFont, getTooltipFont, setTooltipFont
	getHoveredElement
	getNavigationTarget, navigateTo, navigateToNext, navigateToPrevious, navigateToFirst, navigate, canNavigateTo
	getRoot
	getScissorCoordsConverter, setScissorCoordsConverter
	getScrollSpeed, setScrollSpeed
	getSoundPlayer, setSoundPlayer
	getSpriteLoader, setSpriteLoader
	getTarget, parseTargetAndEvent, getTargetCallback, setTargetCallback
	getTextPreprocessor, setTextPreprocessor, reprocessTexts
	getTheme, setTheme
	getTime, getTimeSinceNavigation
	isBusy, isKeyboardBusy, isMouseBusy
	isIgnoringKeyboardInput
	isInputCaptured
	isInteractionLocked
	isMouseGrabbed, setMouseIsGrabbed
	load
	ok, back
	updateLayout



	Element types, methods and events
	----------------------------------------------------------------

	(element)
	- animate
	- close, canClose
	- exists
	- getAnchor, setAnchor, getAnchorX, setAnchorX, getAnchorY, setAnchorY
	- getCallback, setCallback, on, off, trigger, triggerBubbling
	- getClosest
	- getClosestInDirection, getNext, getPrevious
	- getData, setData, swapData
	- getDimensions, setDimensions, getWidth, setWidth, getHeight, setHeight
	- getGui
	- getGuiTime
	- getId, hasId
	- getIndex, getDepth
	- getLayout
	- getLayoutDimensions, getLayoutWidth, getLayoutHeight
	- getLayoutPosition, getLayoutX, getLayoutY, getLayoutCenterPosition
	- getMinDimensions, getMinWidth, getMinHeight
	- getMouseCursor, getResultingMouseCursor, setMouseCursor
	- getMousePosition, getMouseX, getMouseY
	- getOrigin, setOrigin, getOriginX, setOriginX, getOriginY, setOriginY
	- getParent, getParents, hasParent, getParentWithId, hasParentWithId, parents, parentsr, lineageUp
	- getPathDescription
	- getPosition, setPosition, getX, setX, getY, setY
	- getPositionOnScreen, getXOnScreen, getYOnScreen
	- getRoot, getNavigationRoot
	- getSound, getResultingSound, setSound
	- getStyle
	- getTimeSinceBecomingVisible
	- getTooltip, setTooltip, drawTooltip
	- getTooltipFont, useTooltipFont
	- hasTag, addTag, removeTag, removeAllTags, setTag
	- isAt
	- isDisplayed, getClosestHiddenElement, getFarthestHiddenElement
	- isFirst, isLast
	- isHidden, isVisible, setHidden, setVisible, show, hide, toggleHidden
	- isHovered
	- isMouseFocus, isKeyboardFocus
	- isNavigationTarget
	- isScrollbarXHovered, isScrollbarYHovered, isScrollbarXHandleHovered, isScrollbarYHandleHovered
	- isScrollingX, isScrollingY
	- isSolid
	- isType
	- playSound
	- refresh
	- remove
	- reprocessTexts
	- scrollIntoView
	- setScissor, unsetScissor
	- showMenu
	- updateLayout
	- Event: beforedraw, afterdraw
	- Event: close, closed
	- Event: focused, blurred
	- Event: init
	- Event: keypressed
	- Event: layout
	- Event: mousepressed, mousemoved, mousereleased
	- Event: navigated
	- Event: pressed
	- Event: refresh
	- Event: show, hide
	- Event: textinput
	- Event: update
	- Event: wheelmoved

	container
	- find, findAll, findType, findActive, findToggled, match, matchAll
	- get, children
	- getChildAreaDimensions, getChildAreaWidth, getChildAreaHeight
	- getChildWithData
	- getElementAt
	- getInnerSpace, getInnerSpaceX, getInnerSpaceY
	- getMaxWidth, setMaxWidth, getMaxHeight, setMaxHeight
	- getPadding, setPadding
	- getScroll, getScrollX, getScrollY, setScroll, setScrollX, setScrollY, scroll, updateScroll
	- getScrollHandleX, getScrollHandleY
	- getScrollLimit, getScrollLimitX, getScrollLimitY
	- getToggledChild, setToggledChild
	- getVisibleChild, getVisibleChildNumber, getVisibleChildCount, setVisibleChild
	- getVisualScroll, getVisualScrollX, getVisualScrollY
	- hasScrollbars, hasScrollbarOnRight, hasScrollbarOnBottom
	- indexOf
	- insert, removeAt, empty
	- setChildrenActive
	- setChildrenHidden
	- sort
	- traverse, traverseType, traverseVisible

		(bar)

			hbar

			vbar

		root
		- setDimensions

	(leaf)
	- getAlign, setAlign
	- getFont, useFont
	- getMnemonicPosition
	- getText, getUnprocessedText, setText, drawText, drawAlignedText
	- getTextColor, setTextColor, hasTextColor, useTextColor
	- isBold, setBold
	- isLarge, setLarge
	- isSmall, setSmall

		canvas
		- getCanvasBackgroundColor, setCanvasBackgroundColor
		- Event: draw

		image
		- Includes: imageMixin

		text

		(widget)
		- getPriority, setPriority
		- isActive, setActive
		- Event: navigate
		- Event: navupdate

			button
			- Includes: imageMixin
			- getArrow
			- getText2, getUnprocessedText2, setText2, drawText2, drawAlignedText2
			- isPressable, setPressable
			- isToggled, setToggled
			- press, isPressed
			- Event: press
			- Event: toggle

			input
			- focus, blur, isFocused
			- getField
			- getValue, setValue, getVisibleValue, drawValue
			- isPasswordActive, setPasswordActive
			- Event: change
			- Event: submit



	Includes
	----------------------------------------------------------------

	imageMixin
	- drawImage
	- getImageBackgroundColor, setImageBackgroundColor, hasImageBackgroundColor, useImageBackgroundColor
	- getImageColor, setImageColor, hasImageColor, useImageColor
	- getImageDimensions, setImageSize, maximizeImageSize
	- getImageScale, getImageScaleX, getImageScaleY, setImageScale, setImageScaleX, setImageScaleY
	- getSprite, setSprite, hasSprite



--============================================================]]



-- Modules
local modulePath   = ...
local moduleFolder = ('.'..modulePath) :gsub('%.%w+$', '')
local class      = require((moduleFolder..'.class'):sub(2))
local InputField = require((moduleFolder..'.InputField'):sub(2))

local LG = love.graphics
local LM = love.mouse

local COLOR_TRANSPARENT = {255,255,255,0}
local COLOR_WHITE       = {255,255,255,255}
local DEFAULT_FONT = LG.newFont(12)
local tau = 2*math.pi

local Gui = class('Gui', {

	TOOLTIP_DELAY = 0.15,

	VALUE_MASK_INT    =  '^%-?%d+$',       -- Integer number.
	VALUE_MASK_UINT   =  '^%d+$',          -- Unsigned integer number.
	VALUE_MASK_FLOAT  =  '^%-?%d+%.?%d*$', -- Floating point number.
	VALUE_MASK_UFLOAT =  '^%d+%.?%d*$',    -- Unsigned floating point number.

	_allAnimations = nil, _animationLockCount = 0,
	_currentMouseCursor = nil,
	_defaultSounds = nil,
	_elementScissorIsSet = false,
	_font = nil, _fontBold = nil, _fontSmall = nil, _fontLarge = nil, _fontTooltip = nil,
	_hoveredElement = nil,
	_ignoreKeyboardInputThisFrame = false,
	_keyboardFocus = nil,
	_lastAutomaticId = 0,
	_layoutNeedsUpdate = false,
	_lockNavigation = false,
	_mouseFocus = nil, _mouseFocusSet = nil,
	_mouseIsGrabbed = false,
	_mouseX = nil, _mouseY = nil,
	_navigationTarget = nil, _timeSinceNavigation = 0.0,
	_root = nil,
	_scissorCoordsConverter = nil,
	_scrollSpeedX = 1.0, _scrollSpeedY = 1.0,
	_soundPlayer = nil,
	_spriteLoader = nil,
	_standardKeysAreActive = true,
	_styles = nil,
	_textPreprocessor = nil,
	_theme = nil,
	_time = 0.0,
	_tooltipTime = 0.0,

	debug = false,

})

local defaultTheme -- Is set at the bottom of the file.

local Cs = {} -- gui element Classes.
local Ms = {} -- gui element Mixins.

local validSoundKeys = {

	-- Generic
	['close']  = true, -- Usually containers, but any element can be a closable.
	['focus']  = true, -- Only used by Inputs so far.
	['press']  = true, -- Buttons.
	['scroll'] = true, -- Containers.

	-- Element specific
	['inputsubmit'] = true, ['inputrevert'] = true,

}



--==============================================================
--= Local functions ============================================
--==============================================================

local applyMixin
local applyStyle
local checkValidSoundKey
local copyTable
local coroutineIterator, newIteratorCoroutine
local drawImage
local drawLayoutBackground
local errorf
local F
local getTextDimensions
local getTypeFromData
local indexOf
local ipairsr
local lerp
local matchAll
local newSprite, cloneSprite, getCurrentViewOfSprite, updateSprite
local parseSelector, isElementMatchingSelectorPath
local prepareSound
local preprocessText
local printf, printerror, assertarg
local registerEvents
local requireElementClass
local retrieve
local reverseArray
local round
local setMouseFocus, setKeyboardFocus
local setScissor, intersectScissor
local setVisualScroll
local themeCallBack, themeGet, themeRender, themeRenderArea, themeRenderOnScreen, themeGetSize
local trigger, triggerIncludingAnimations
local updateHoveredElement, validateNavigationTarget
local updateLayout, updateLayoutIfNeeded, scheduleLayoutUpdateIfDisplayed
local useColor
local xywh

local updateContainerChildLayoutSizes
local getContainerLayoutSizeValues
local updateContainerLayoutSize
local expandContainer
local updateFloatingElementPosition

--==============================================================



-- applyMixin( class, mixin )
function applyMixin(C, mixin)
	for fName, f in pairs(mixin) do

		-- A mixin should only add new methods to classes, not override anything.
		assert(C[fName] == nil)

		C[fName] = f

	end
end



-- applyStyle( data, styleData )
function applyStyle(data, styleData)
	for i, childStyleData in ipairs(styleData) do
		if data[i] == nil then
			error('cannot apply style (missing children)')
		end
		applyStyle(data[i], childStyleData)
	end
	for k, v in pairs(styleData) do
		if data[k] == nil then
			data[k] = v
		end
	end
end



-- checkValidSoundKey( soundKey )
function checkValidSoundKey(soundK)
	if (soundK == nil or validSoundKeys[soundK]) then
		return
	end
	local keys = {}
	for soundK in pairs(validSoundKeys) do
		table.insert(keys, soundK)
	end
	table.sort(keys)
	errorf(2, 'Bad sound key %q. (Must be any of "%s".)', soundK, table.concat(keys, '", "'))
end



-- copy = copyTable( table )
function copyTable(t)
	local copy = {}
	for k, v in pairs(t) do
		copy[k] = v
	end
	return copy
end



-- ... = coroutineIterator( coroutine )
function coroutineIterator(co)
	return select(2, assert(coroutine.resume(co)))
end

-- iterator, coroutine = newIteratorCoroutine( callback, arguments... )
do
	local function initiator(cb, ...)
		coroutine.yield()
		return cb(...)
	end
	function newIteratorCoroutine(cb, ...)
		local co = coroutine.create(initiator)
		coroutine.resume(co, cb, ...)
		return coroutineIterator, co
	end
end



-- drawImage( image, quad, ... )
-- drawImage( image, nil, ... )
-- drawImage( nil, image, ... )
function drawImage(image, quadOrImage, ...)
	if image and quadOrImage then
		LG.draw(image, quadOrImage, ...)
	else
		LG.draw((image or quadOrImage), ...)
	end
end



-- drawLayoutBackground( element )
function drawLayoutBackground(el)
	local bg = el._background
	if bg then
		if el._gui.debug then
			LG.setColor(70, 70, 70, 220)
			LG.rectangle('fill', xywh(el))
		else
			themeRender(el, 'background', bg)
		end
	end

end



-- errorf( [ level=1, ] formatString, ... )
function errorf(i, s, ...)
	if type(i) == 'number' then
		error(s:format(...), i+1)
	else
		error(i:format(s, ...), 2)
	end
end



-- string = F"formatString"( ... )
-- ...: Values for string.format
do
	local string_format = string.format
	local formatString
	local function format(...)
		return string_format(formatString, ...)
	end
	function F(s)
		formatString = s
		return format
	end
end



-- width, height = getTextDimensions( font, text [, wrapLimit=none ] )
function getTextDimensions(font, text, wrapLimit)
	local w, lines = font:getWrap(text, (wrapLimit or math.huge))
	local h = font:getHeight()
	return w, h + math.floor(h*font:getLineHeight()) * (math.max(#lines, 1)-1)
end



-- elementType = getTypeFromData( data )
function getTypeFromData(data)
	if not data.type and type(data[1]) == 'string' then
		data.type = table.remove(data, 1)
	end
	return data.type
end



-- index = indexOf( table, value )
-- index = indexOf( container, element )
function indexOf(t, v)
	for i, item in ipairs(t) do
		if item == v then return i end
	end
	return nil
end



-- for index, item in ipairsr( table ) do
do
	local function iprev(t, i)
		i = i-1
		local v = t[i]
		if v ~= nil then return i, v end
	end
	function ipairsr(t)
		return iprev, t, #t+1
	end
end



-- value = lerp( v1, v2, t )
function lerp(v1, v2, t)
	return v1+t*(v2-v1)
end



-- matches = matchAll( string, pattern )
function matchAll(s, pat)
	local matches, i = {}, 0
	for match in s:gmatch(pat) do
		i = i+1
		matches[i] = match
	end
	return matches
end



-- sprite = newSprite( image [, quad ] )
-- sprite = newSprite( image, frames )
-- frames = { frame... }
-- frame = { duration=duration, quad=quad }
function newSprite(image, framesOrQuad)
	assertarg(1, image, 'userdata')
	assertarg(2, framesOrQuad, 'userdata','table','nil')

	local frames

	if not framesOrQuad then
		local iw, ih = image:getDimensions()
		frames = {{duration=math.huge, quad=LG.newQuad(0, 0, iw, ih, iw, ih)}}

	elseif type(framesOrQuad) == 'userdata' then
		frames = {{duration=math.huge, quad=framesOrQuad}}

	else
		frames = framesOrQuad
		if not frames[1] then
			error('The frames table is empty. We need at least one frame!', 2)
		end
		for i, frame in ipairs(frames) do
			if not frame.duration then errorf(2, 'Frame %d is missing a duration.', i) end
			if not frame.quad     then errorf(2, 'Frame %d is missing a quad.',     i) end
		end
	end

	local duration = 0
	for _, frame in ipairs(frames) do
		duration = duration+frame.duration
	end

	local _, _, iw, ih = frames[1].quad:getViewport()
	local sprite = {

		image = image,

		frames = frames,

		width = iw,
		height = ih,

		length = #frames,
		duration = duration,

		currentFrame = 1,
		currentTime = 0.0,

	}

	return sprite
end

-- clone = cloneSprite( sprite )
function cloneSprite(sprite)
	return newSprite(sprite.image, sprite.frames)
end

-- image, quad, width, height = getCurrentViewOfSprite( sprite )
function getCurrentViewOfSprite(sprite)
	local quad = sprite.frames[sprite.currentFrame].quad
	local _, _, w, h = quad:getViewport()
	return sprite.image, quad, w, h
end

-- updateSprite( sprite, deltaTime )
function updateSprite(sprite, dt)

	local frames = sprite.frames

	local i = sprite.currentFrame
	local time = sprite.currentTime+dt

	while time >= frames[i].duration do
		time = time-frames[i].duration
		i = i%sprite.length+1
	end

	sprite.currentFrame = i
	sprite.currentTime = time

end



-- selectorPath = parseSelector( selector )
-- selector = "elementtype #id .tag"
-- Returns nil if the selector is empty or invalid.
do
	local selPathCache = {}

	function parseSelector(selector)

		local selPath = selPathCache[selector]
		if selPath then
			return selPath
		end

		selPath = {}

		for section in selector:gmatch'[^ ]+' do
			local selPathSection = {}
			local i = 1
			while true do

				local c = section:sub(i, i)
				if c == '' then
					break
				end

				local selPathSegment

				-- ID
				if c == '#' then
					local id
					id, i = section:match('^([^#.]+)()', i+1)
					if not id then
						printf('ERROR: Bad format in selector at %q.', section:sub(i))
						return nil
					end
					selPathSegment = {type='id', value=id}

				-- Tag
				elseif c == '.' then
					local tag
					tag, i = section:match('^([^#.]+)()', i+1)
					if not tag then
						printf('ERROR: Bad format in selector at %q.', section:sub(i))
						return nil
					end
					selPathSegment = {type='tag', value=tag}

				-- Element type
				else
					local elType
					elType, i = section:match('^([^#.]+)()', i)
					if not elType then
						printf('ERROR: Bad format in selector at %q.', section:sub(i))
						return nil
					elseif not Cs[elType] then
						printf('ERROR: Unknown element type %q in selector.', elType)
						return nil
					end
					selPathSegment = {type='type', value=elType}

				end
				table.insert(selPathSection, selPathSegment)
			end
			table.insert(selPath, selPathSection)
		end

		if not selPath[1] then
			return nil -- The selector was either empty or filled with just spaces.
		end

		selPathCache[selector] = selPath

		return selPath
	end

end

-- result = isElementMatchingSelectorPath( element, selectorPath [, breakElement ] )
-- The path match checking loop breaks before reaching 'breakElement'.
do
	local function isMatchingSection(el, selPathSection)
		for _, selPathSegment in ipairs(selPathSection) do

			-- ID
			if selPathSegment.type == 'id' then
				if not el:hasId(selPathSegment.value) then
					return false
				end

			-- Tag
			elseif selPathSegment.type == 'tag' then
				if not el:hasTag(selPathSegment.value) then
					return false
				end

			-- Element type
			else--if selPathSegment.type == 'type' then
				if not el:isType(selPathSegment.value) then
					return false
				end

			end
		end
		return true
	end

	function isElementMatchingSelectorPath(el, selPath, breakElement)
		local i = #selPath

		local selPathSection = selPath[i]
		if not selPathSection then
			return false -- An empty path means nothing can match!
		end

		if el == breakElement then
			return false -- We got to the break point before matching the whole path.
		end
		if isMatchingSection(el, selPathSection) then
			i = i-1
			selPathSection = selPath[i]
			if not selPathSection then
				return true -- The whole path (with only one section) matched.
			end
		else
			return false -- The last section must match the specified element, but didn't.
		end

		for _, parent in el:parents() do
			if parent == breakElement then
				return false -- We got to the break point before matching the whole path.
			end
			if isMatchingSection(parent, selPathSection) then
				i = i-1
				selPathSection = selPath[i]
				if not selPathSection then
					return true -- The whole path matched.
				end
			end
		end

		return false -- We went through all parents without matching the whole path.
	end

end



-- Prepare a sound for being played (Useful if it's possible the element will be removed in an event)
-- playSound:function = prepareSound( element, soundKey )
function prepareSound(el, soundK)
	local gui = el._gui
	local soundPlayer = (gui and gui._soundPlayer)
	local sound = (soundPlayer and el:getResultingSound(soundK))
	return function()
		if sound ~= nil then
			soundPlayer(sound)
		end
	end
end



-- text = preprocessText( gui, text, el, hasMnemonics )
function preprocessText(gui, unprocessedText, el, hasMnemonics)
	if unprocessedText == '' then return '' end

	local preprocessor = gui._textPreprocessor
	if not preprocessor then return unprocessedText end

	local text = preprocessor(unprocessedText, el, hasMnemonics)
	if text == nil then return unprocessedText end

	return tostring(text)
end



-- printf( formatString, ... )
function printf(s, ...)
	print(s:format(...))
end

-- printerror( depth, formatString, ... )
function printerror(depth, s, ...)

	local time = require'socket'.gettime()
	local timeStr = os.date('%H:%M:%S', time)
	local msStr = F'%.3f'(time%1):sub(2)
	printf('[%s%s] ERROR: '..s, timeStr, msStr, ...)

	-- Traceback.
	for line in debug.traceback('', 1+depth):gmatch'[^\n]+' do
		local fileAndLine, inside = line:match'\t(%w.-): in (.+)'
		if fileAndLine then
			inside = inside:gsub('^function ', ''):gsub("^['<](.+)['>]$", '%1')
			printf('\t%s  (%s)', fileAndLine, inside)
		end
	end

	print()
end

-- value = assertarg( [ functionName=auto, ] argumentNumber, value, expectedValueType... [, depth=1 ] )
do
	local function assertArgTypes(fName, n, v, ...)
		local vType = type(v)
		local varargCount = select('#', ...)
		local lastArg = select(varargCount, ...)
		local hasDepthArg = (type(lastArg) == 'number')
		local typeCount = varargCount+(hasDepthArg and -1 or 0)
		for i = 1, typeCount do
			if vType == select(i, ...) then
				return v
			end
		end
		local depth = 2+(hasDepthArg and lastArg or 1)
		if not fName then
			fName = debug.traceback('', depth-2):match(": in function '(.-)'") or '?'
		end
		local expects = table.concat({...}, ' or ', 1, typeCount)
		error(("bad argument #%d to '%s' (%s expected, got %s)"):format(n, fName, expects, vType), depth)
	end

	function assertarg(fNameOrArgNum, ...)
		if type(fNameOrArgNum) == 'string' then
			return assertArgTypes(fNameOrArgNum, ...)
		else
			return assertArgTypes(nil, fNameOrArgNum, ...)
		end
	end

end



-- registerEvents( class, events )
function registerEvents(C, events)
	for i, event in ipairs(C._events) do
		table.insert(events, i, event)
	end
	for i, event in ipairs(events) do
		events[event] = true
	end
	C._events = events
end



-- class = requireElementClass( elType )
function requireElementClass(elType)
	return Cs[elType] or errorf(2, 'Unknown element type %q.', elType)
end



-- retrieve( element, data, property1... )
function retrieve(el, data, _k, ...)
	local v = data[_k:sub(2)]
	if v ~= nil then
		el[_k] = v
	end
	if ... then
		return retrieve(el, data, ...)
	end
end



-- array = reverseArray( array )
function reverseArray(arr)
	local lenPlusOne, i2 = #arr+1
	for i = 1, #arr/2 do
		i2 = lenPlusOne-i
		arr[i], arr[i2] = arr[i2], arr[i]
	end
	return arr
end



-- integer = round( number )
function round(n)
	return math.floor(n+0.5)
end



-- setMouseFocus( gui, element, button )
function setMouseFocus(gui, el, buttonN)
	if el then
		if next(gui._mouseFocusSet) then
			error('mouseFocusSet must be empty for mouse focus to change')
		end
		gui._mouseFocus = el
		gui._mouseFocusSet[buttonN] = true
		LM.setGrabbed(true)
	else
		gui._mouseFocus = nil
		gui._mouseFocusSet = {}
		LM.setGrabbed(gui._mouseIsGrabbed)
	end
end

-- setKeyboardFocus( gui, element )
function setKeyboardFocus(gui, el)
	gui._keyboardFocus = el
end



-- setScissor( gui, x, y, width, height ) -- Push scissor.
-- setScissor( gui, nil ) -- Pop scissor.
-- Must be called twice - first with arguments, then without!
function setScissor(gui, x, y, w, h)

	if not x then
		LG.pop()
		return
	end

	local convert = gui._scissorCoordsConverter
	if convert then
		x, y, w, h = convert(x, y, w, h)
	end

	LG.push('all')
	LG.intersectScissor(x, y, math.max(w, 0), math.max(h, 0))

end

-- intersectScissor( gui, x, y, width, height )
-- Note: Does not push or pop state like setScissor()!
function intersectScissor(gui, x, y, w, h)

	local convert = gui._scissorCoordsConverter
	if convert then
		x, y, w, h = convert(x, y, w, h)
	end

	LG.intersectScissor(x, y, w, h)

end



-- setVisualScroll( container, scrollX, scrollY )
function setVisualScroll(container, scrollX, scrollY)

	local dx = scrollX-container._visualScrollX
	local dy = scrollY-container._visualScrollY

	local didScroll = false

	if dx ~= 0 then
		container._visualScrollX = container._visualScrollX+dx
		didScroll = true
	end

	if dy ~= 0 then
		container._visualScrollY = container._visualScrollY+dy
		didScroll = true
	end

	if not didScroll then return end

	for el in container:traverse() do
		el._layoutOffsetX = el._layoutOffsetX+dx
		el._layoutOffsetY = el._layoutOffsetY+dy
	end

	updateHoveredElement(container._gui)

end



-- value... = themeCallBack( gui, sectionKey, what, argument... )
function themeCallBack(gui, k, what, ...)
	local theme = gui._theme
	local section = (theme and theme[k])
	local cb = (section and section[what] or defaultTheme[k][what])
		or errorf(2, 'Missing default theme callback for "%s.%s".', k, what)
	return cb(...)
end

-- value = themeGet( gui, key )
function themeGet(gui, k)
	local theme = gui._theme
	local v = (theme and theme[k])
	if v == nil then
		return defaultTheme[k]
	end
	return v
end

-- themeRender( element, what, extraArgument... )
function themeRender(el, what, ...)
	return themeRenderArea(el, what, 0, 0, el._layoutWidth, el._layoutHeight, ...)
end

-- themeRenderArea( element, what, areaX, areaY, areaWidth, areaHeight, extraArgument... )
function themeRenderArea(el, what, areaX, areaY, areaW, areaH, ...)
	local x = round(el:getXOnScreen()+areaX)
	local y = round(el:getYOnScreen()+areaY)
	return themeRenderOnScreen(el, what, x, y, areaW, areaH, ...)
end

-- themeRenderOnScreen( element, what, x, y, w, h, extraArgument... )
function themeRenderOnScreen(el, what, x, y, w, h, ...)

	local gui = el._gui

	if (x+w < 0 or y+h < 0) then return end
	local rootW, rootH = gui._root:getDimensions()
	if (x >= rootW or y >= rootH) then return end

	LG.push('all')
	LG.translate(x, y)

	themeCallBack(gui, 'draw', what, el, w, h, ...)
	el:unsetScissor()

	LG.pop()
end

-- width, height = themeGetSize( element, what, extraArgument... )
function themeGetSize(el, what, ...)
	local w, h = themeCallBack(el._gui, 'size', what, el, ...)
	if not (type(w) == 'number' and type(h) == 'number') then
		errorf(2, 'Theme (or default theme) did not return width and height for %q, instead we got: %s, %s', what, w, h)
	end
	return w, h
end



-- value = trigger( element, event, ... )
function trigger(el, event, ...)

	local cb = el._callbacks[event]
	if not cb then return nil end

	return cb(el, event, ...)
end

-- value = triggerIncludingAnimations( element, event, ... )
function triggerIncludingAnimations(el, event, ...)

	local time = el._gui._time
	for _, anim in ipairs(el._animations) do
		local cb = anim.callbacks[event]
		if cb then cb(el, event, (time-anim.startTime)/anim.duration, ...) end
	end

	local cb = el._callbacks[event]
	if not cb then return nil end

	return cb(el, event, ...)
end



-- updateHoveredElement( gui )
function updateHoveredElement(gui)
	local el = (gui._mouseX and gui:getElementAt(gui._mouseX, gui._mouseY))
	if gui._hoveredElement == el then
		return
	end
	local oldEl = gui._hoveredElement
	gui._hoveredElement = el
	if not (el and el._tooltip ~= '' and oldEl and oldEl._tooltip ~= '' and gui._tooltipTime >= gui.TOOLTIP_DELAY) then
		-- @Incomplete: Don't reset tooltip time instantly - add a delay.
		gui._tooltipTime = 0
	end
end

-- Removes current navigation target if it isn't a valid target anymore
-- validateNavigationTarget( gui )
function validateNavigationTarget(gui)
	local nav = gui._navigationTarget
	if (nav and not gui:canNavigateTo(nav)) then
		gui:navigateTo(nil)
	end
end



-- didUpdate = updateLayout( element )
function updateLayout(el)

	local gui = el._gui
	if gui.debug then
		print('Gui: Updating layout')
	end

	local container = el:getRoot() -- @Incomplete: Make any element able to update it's layout.
	if container._hidden then return false end

	container:_updateLayoutSize()
	container:_expandLayout(nil, nil) -- (Currently, most likely only works correctly if 'container' is the root.)
	container:_updateLayoutPosition()

	gui._layoutNeedsUpdate = false

	for innerEl in container:traverseVisible() do
		triggerIncludingAnimations(innerEl, 'layout')
	end

	updateHoveredElement(gui)

	return true
end

-- didUpdate = updateLayoutIfNeeded( gui )
function updateLayoutIfNeeded(gui)
	if not gui._layoutNeedsUpdate then
		return false
	end
	gui._layoutNeedsUpdate = false
	local root = gui._root
	if not root then
		return false
	end
	return updateLayout(root)
end

-- scheduleLayoutUpdateIfDisplayed( element )
function scheduleLayoutUpdateIfDisplayed(el)
	local gui = el._gui
	if gui._layoutNeedsUpdate then
		return
	end
	gui._layoutNeedsUpdate = el:isDisplayed()
	if (gui.debug and gui._layoutNeedsUpdate) then
		print('Gui: Scheduling layout update')
	end
end



-- useColor( color [, opacity=1 ] )
function useColor(color, opacity)
	if not opacity then
		LG.setColor(color)
	else
		local r, g, b, a = unpack(color)
		LG.setColor(r, g, b, (a or 255)*opacity)
	end
end



-- x, y, width, height = xywh( element )
function xywh(el)
	return el:getXOnScreen(), el:getYOnScreen(), el._layoutWidth, el._layoutHeight
end



--==============================================================



-- updateContainerChildLayoutSizes( container )
function updateContainerChildLayoutSizes(container)
	for _, child in ipairs(container) do
		if not child._hidden then
			child:_updateLayoutSize()
		end
	end
end



-- <see_return_statement> = getContainerLayoutSizeValues( bar )
function getContainerLayoutSizeValues(bar)
	local staticW, dynamicW, highestW, highestDynamicW, expandablesX = 0, 0, 0, 0, 0
	local staticH, dynamicH, highestH, highestDynamicH, expandablesY = 0, 0, 0, 0, 0
	local currentSx, currentSy, sumSx, sumSy, first = 0, 0, 0, 0, true
	for _, child in ipairs(bar) do
		if not (child._hidden or child._floating) then

			-- Dimensions
			highestW = math.max(highestW, child._layoutWidth)
			highestH = math.max(highestH, child._layoutHeight)
			if child._width then
				staticW = staticW+child._width
			else
				dynamicW = dynamicW+child._layoutWidth
				highestDynamicW = math.max(highestDynamicW, child._layoutWidth)
				expandablesX = expandablesX+1
			end
			if child._height then
				staticH = staticH+child._height
			else
				dynamicH = dynamicH+child._layoutHeight
				highestDynamicH = math.max(highestDynamicH, child._layoutHeight)
				expandablesY = expandablesY+1
			end

			-- Spacing
			if not first then
				currentSx = math.max(currentSx, (child._spacingLeft or child._spacingHorizontal or child._spacing))
				currentSy = math.max(currentSy, (child._spacingTop  or child._spacingVertical   or child._spacing))
			end
			sumSx, sumSy = sumSx+currentSx, sumSy+currentSy
			currentSx = (child._spacingRight  or child._spacingHorizontal or child._spacing)
			currentSy = (child._spacingBottom or child._spacingVertical   or child._spacing)
			first = false

		end
	end
	return staticW, dynamicW, highestW, highestDynamicW, expandablesX, currentSx, sumSx,
	       staticH, dynamicH, highestH, highestDynamicH, expandablesY, currentSy, sumSy
end



-- updateContainerLayoutSize( container )
function updateContainerLayoutSize(self)

	local maxW, maxH = self._maxWidth, self._maxHeight

	local w = self._width
	if not w then
		w = math.max(self._layoutInnerWidth+self:getInnerSpaceX(), self._minWidth)
		if maxW then  w = math.min(w, maxW)  end
	end
	self._layoutWidth = w
	-- self._layoutInnerWidth = w-self:getInnerSpaceX() -- Wrong! (But why?)

	local h = self._height
	if not h then
		h = math.max(self._layoutInnerHeight+self:getInnerSpaceY(), self._minHeight)
		if maxH then  h = math.min(h, maxH)  end
	end
	self._layoutHeight = h
	-- self._layoutInnerHeight = h-self:getInnerSpaceY() -- Wrong! (But why?)

end



-- expandContainer( container [, expandWidth, expandHeight ] )
function expandContainer(self, expandW, expandH)

	local maxW, maxH = self._maxWidth, self._maxHeight
	local parent = self._parent

	if (expandW or self._expandX) and (not self._width) then
		self._layoutWidth = math.min((expandW or parent._layoutInnerWidth), (maxW or math.huge))
		self._layoutInnerWidth = self._layoutWidth-self:getInnerSpaceX()
	end

	if (expandH or self._expandY) and (not self._height) then
		self._layoutHeight = math.min((expandH or parent._layoutInnerHeight), (maxH or math.huge))
		self._layoutInnerHeight = self._layoutHeight-self:getInnerSpaceY()
	end

end



-- updateFloatingElementPosition( element )
function updateFloatingElementPosition(child)

	local parent = child._parent

	child._layoutX = round(0
		+ parent._layoutX
		+ parent._padding
		+ child._originX*parent._layoutInnerWidth
		+ child._x
		- child._anchorX*child._layoutWidth
	)

	child._layoutY = round(0
		+ parent._layoutY
		+ parent._padding
		+ child._originY*parent._layoutInnerHeight
		+ child._y
		- child._anchorY*child._layoutHeight
	)

	child:_updateLayoutPosition()

end



--==============================================================
--= Utilities / Static GUI Methods =============================
--==============================================================



-- quads = create9PartQuads( image, leftMargin, topMargin [, rightMargin=leftMargin, bottomMargin=rightMargin ] )
-- quads = {
--    topLeftQuad,    topCenterQuad,    topRightQuad,
--    middleLeftQuad, middleCenterQuad, middleRightQuad,
--    bottomLeftQuad, bottomCenterQuad, bottomRightQuad }
function Gui.create9PartQuads(image, l, t, r, b)
	r = (r or l)
	b = (b or t)
	local iw, ih = image:getDimensions()
	return {
		LG.newQuad(  0,    0,     l,      t,       iw, ih ),
		LG.newQuad(  l,    0,     iw-l-r, t,       iw, ih ),
		LG.newQuad(  iw-r, 0,     r,      t,       iw, ih ),
		LG.newQuad(  0,    t,     l,      ih-t-b,  iw, ih ),
		LG.newQuad(  l,    t,     iw-l-r, ih-t-b,  iw, ih ),
		LG.newQuad(  iw-r, t,     r,      ih-t-b,  iw, ih ),
		LG.newQuad(  0,    ih-b,  l,      b,       iw, ih ),
		LG.newQuad(  l,    ih-b,  iw-l-r, b,       iw, ih ),
		LG.newQuad(  iw-r, ih-b,  r,      b,       iw, ih ),
	}
end



-- draw9PartScaled(
--    x, y, width, height,
--    topLeftImage,    topCenterImage,    topRightImage,
--    middleLeftImage, middleCenterImage, middleRightImage,
--    bottomLeftImage, bottomCenterImage, bottomRightImage )
-- draw9PartScaled(
--    x, y, width, height, image,
--    topLeftQuad,    topCenterQuad,    topRightQuad,
--    middleLeftQuad, middleCenterQuad, middleRightQuad,
--    bottomLeftQuad, bottomCenterQuad, bottomRightQuad )
function Gui.draw9PartScaled(x, y, w, h, image, tlObj, tcObj, trObj, clObj, ccObj, crObj, blObj, bcObj, brObj)
	if not brObj then
		image, tlObj, tcObj, trObj, clObj, ccObj, crObj, blObj, bcObj, brObj
			= nil, image, tlObj, tcObj, trObj, clObj, ccObj, crObj, blObj, bcObj
	end

	local t = image and select(4, tcObj:getViewport()) or tcObj:getHeight()
	local l = image and select(3, clObj:getViewport()) or clObj:getWidth()
	local r = image and select(3, crObj:getViewport()) or crObj:getWidth()
	local b = image and select(4, bcObj:getViewport()) or bcObj:getHeight()
	local sx = (w-l-r)/(image and select(3, tcObj:getViewport()) or tcObj:getWidth())
	local sy = (h-t-b)/(image and select(4, clObj:getViewport()) or clObj:getHeight())

	LG.push('all')
	LG.translate(x, y)

	-- Fill
	drawImage(image, ccObj, l, t, 0, sx, sy)

	-- Sides
	drawImage(image, tcObj, l,   0,   0, sx, 1)
	drawImage(image, crObj, w-r, t,   0, 1,  sy)
	drawImage(image, bcObj, l,   h-b, 0, sx, 1)
	drawImage(image, clObj, 0,   t,   0, 1,  sy)

	-- Corners
	drawImage(image, tlObj, 0,   0)
	drawImage(image, trObj, w-r, 0)
	drawImage(image, blObj, 0,   h-b)
	drawImage(image, brObj, w-r, h-b)

	LG.pop()
end



--[[
	STATIC  image = newMonochromeImage( pixelRows [, red=255, green=255, blue=255 ] )
	pixelRows = { pixelRow... }
	pixelRow: String with single-digit hexadecimal numbers. Invalid characters counts as 0.
	Example:
		antialiasedDiagonalLine = Gui.newMonochromeImage{
			" 5F",
			"5F5",
			"F5 ",
		}
]]
function Gui.newMonochromeImage(pixelRows, r, g, b)
	r, g, b = (r or 255), (g or 255), (b or 255)
	local imageData = love.image.newImageData(#pixelRows[1], #pixelRows)
	for row, pixelRow in ipairs(pixelRows) do
		for col = 1, #pixelRow do
			local pixel = (tonumber(pixelRow:sub(col, col), 16) or 0)
			imageData:setPixel(col-1, row-1, r, g, b, 17*pixel)
		end
	end
	return LG.newImage(imageData)
end

--[[
	STATIC  image = newImageUsingPalette( pixelRows, palette )
	pixelRows = { pixelRow... }
	pixelRow: String with single-character palette indices. Invalid indices counts as transparent pixels.
	palette = { ["index"]=color... }
	color = { red, green, blue [, alpha=255 ] }
	Example:
		doubleWideRainbow = Gui.newImageUsingPalette(
			{
				"rygcbp",
				"rygcbp",
			}, {
				["r"] = {255,  0,  0}, -- Red
				["y"] = {255,255,  0}, -- Yellow
				["g"] = {0,  255,  0}, -- Green
				["c"] = {0,  255,255}, -- Cyan
				["b"] = {0,  0,  255}, -- Blue
				["p"] = {255,0,  255}, -- Purple
			}
		)
]]
function Gui.newImageUsingPalette(pixelRows, palette)
	local imageData = love.image.newImageData(#pixelRows[1], #pixelRows)
	for row, pixelRow in ipairs(pixelRows) do
		for col = 1, #pixelRow do
			local pixel = (palette[pixelRow:sub(col, col)] or COLOR_TRANSPARENT)
			local r, g, b, a = unpack(pixel)
			imageData:setPixel(col-1, row-1, r, g, b, (a or 255))
		end
	end
	return LG.newImage(imageData)
end



--==============================================================
--= GUI ========================================================
--==============================================================



-- Gui( )
function Gui:init()

	self._allAnimations = {}
	self._defaultSounds = {}
	self._mouseFocusSet = {}

	self._styles = {
		['_MENU'] = {},
	}

end



-- update( deltaTime )
function Gui:update(dt)

	local time = self._time+dt
	self._time = time
	self._tooltipTime = self._tooltipTime+dt
	self._timeSinceNavigation = self._timeSinceNavigation+dt

	local allAnims = self._allAnimations
	if allAnims[1] then

		for i, anim in ipairsr(allAnims) do
			local el = anim.element

			if time >= anim.endTime then
				local cb = anim.callbacks['update']
				if cb then cb(el, 'update', 1) end -- Make sure 'update' gets progress=1

				cb = anim.callbacks['done']
				if cb then cb(el, 'done') end

				local anims = el._animations
				table.remove(allAnims, i)
				table.remove(anims, assert(indexOf(anims, anim)))

				if anim.lockInteraction then
					self._animationLockCount = self._animationLockCount-1
				end

			else
				local cb = anim.callbacks['update']
				if cb then
					cb(el, 'update', (time-anim.startTime)/anim.duration)
				end
			end

		end

		if self._animationLockCount == 0 then
			updateHoveredElement(self)
		end

	end

	local root = self._root
	if root then
		root:_update(dt)
		if root:isVisible() then
			trigger(root, 'update', dt)
			for el in root:traverseVisible() do
				trigger(el, 'update', dt)
			end
		end
	end

	-- The navigation target has a special additional update event.
	local nav = self._navigationTarget
	if nav then trigger(nav, 'navupdate', dt) end

	-- Check if mouse is inside window
	if (self._mouseX and not love.window.hasMouseFocus()) then
		self:mousemoved(nil, nil)
	end



	-- Update mouse cursor.

	local lastCursor = self._currentMouseCursor
	self._currentMouseCursor = nil

	local el = self._mouseFocus or self._hoveredElement
	if el
		and not (el:isType'widget'   and not el:isActive())
		and not (self._keyboardFocus and not el:isKeyboardFocus())
		and not (self._mouseFocus    and not el:isMouseFocus())
		and (el:isHovered() or self._mouseFocusSet[1] or self._mouseFocusSet[2] or self._mouseFocusSet[3])
	then
		self._currentMouseCursor = el:getResultingMouseCursor()
	end

	if self._currentMouseCursor ~= lastCursor then
		if self._currentMouseCursor then
			LM.setCursor(self._currentMouseCursor)
		else
			LM.setCursor()
		end
	end



	self._ignoreKeyboardInputThisFrame = false

end



-- draw( )
function Gui:draw()
	local root = self._root
	if (root and not root._hidden) then
		updateLayoutIfNeeded(self)

		-- Elements
		root:_draw()

		-- Navigation target
		if not self.debug then
			local nav = self._navigationTarget
			if nav then  themeRender(nav, 'navigation', self._timeSinceNavigation)  end
		end

		-- Tooltip
		local el = self._hoveredElement
		if (el and not self._mouseFocus) then
			el:_drawTooltip()
		end

	end
end



--==============================================================



-- handled = keypressed( key, scancode, isRepeat )
function Gui:keypressed(key, scancode, isRepeat)
	assertarg(1, key,      'string')
	assertarg(2, scancode, 'string')
	assertarg(3, isRepeat, 'boolean')

	if self._animationLockCount > 0 then return true end

	local focus = (self._keyboardFocus or self._mouseFocus)
	local el = (focus or self._hoveredElement)

	if self._ignoreKeyboardInputThisFrame then
		return (el ~= nil)
	end

	el = (el or self._navigationTarget) -- Can this be on the 'el' declaration line?

	if el then
		if (not focus and el:triggerBubbling('keypressed', key, scancode, isRepeat)) then
			return true
		end
		local handled, grabFocus = el:_keypressed(key, scancode, isRepeat)
		if handled then
			if grabFocus then
				setKeyboardFocus(self, el)
			end
			return true
		end
	end

	if focus then return true end

	local root = self._root
	if (root and not root._hidden) then
		for el in root:traverseVisible() do
			if (key == 'escape' and el:canClose()) then
				el:close()
				return true
			elseif el._captureInput then
				return true
			elseif el._captureGuiInput then
				break
			end
		end
	end

	return false
end

-- handled = keyreleased( key, scancode )
function Gui:keyreleased(key, scancode)
	assertarg(1, key,      'string')
	assertarg(2, scancode, 'string')

	local focus = self._keyboardFocus
	if focus then
		focus:_keyreleased(key, scancode)
		return true
	end

	return false
end

-- handled = textinput( text )
function Gui:textinput(text)
	assertarg(1, text, 'string')

	if self._animationLockCount > 0 then return true end

	local focus = self._keyboardFocus or self._mouseFocus
	local el    = focus or self._hoveredElement

	if self._ignoreKeyboardInputThisFrame then
		return (el ~= nil)
	end

	el = (el or self._navigationTarget) -- Can this be on the 'el' declaration line?

	if el then
		if not focus and el:triggerBubbling('textinput', text) then  return true  end

		if el:_textinput(text) then  return true  end
	end

	if focus then return true end

	local root = self._root
	if root and not root._hidden then
		for el in root:traverseVisible() do
			if el._captureInput    then return true end
			if el._captureGuiInput then break       end
		end
	end

	return false
end



-- handled = mousepressed( x, y, button )
function Gui:mousepressed(x, y, buttonN)
	assertarg(1, x,       'number')
	assertarg(2, y,       'number')
	assertarg(3, buttonN, 'number')

	self._mouseX, self._mouseY = x, y

	if self._animationLockCount > 0 then return true end

	if self._mouseFocusSet[buttonN] then
		-- The mouse button got pressed twice or more with no release inbetween.
		-- Should be an error, but it's not really an issue.
		return true
	end

	local focus = self._mouseFocus
	if focus then  self._mouseFocusSet[buttonN] = true  end

	updateLayoutIfNeeded(self) -- Updates hovered element.

	local el = (focus or self._hoveredElement)
	while el do

		-- Trigger any custom mousepressed event handler.
		-- Returning true from the handler suppresses the default built-in behavior.
		local screenX, screenY = el:getPositionOnScreen()
		if el:trigger('mousepressed', x-screenX, y-screenY, buttonN) then
			return true
		end

		-- Trigger the internal mousepressed event handler.
		local handled, grabFocus = el:_mousepressed(x, y, buttonN)
		if handled then
			if grabFocus and not next(self._mouseFocusSet) then
				setMouseFocus(self, el, buttonN)
			end
			return true
		end

		if focus or el._captureInput or el._captureGuiInput or el:isSolid() then
			return true
		end

		el = el._parent
	end

	return false
end

-- handled = mousemoved( x, y )
function Gui:mousemoved(x, y)
	assertarg(1, x, 'number','nil')
	assertarg(2, y, 'number','nil')

	self._mouseX, self._mouseY = x, y

	if self._animationLockCount > 0 then return true end

	if not updateLayoutIfNeeded(self) then
		updateHoveredElement(self) -- Make sure hovered element updates whenever mouse moves.
	end

	local focus = self._mouseFocus
	if not focus then
		return false
	end

	local el = (x and focus or self._hoveredElement)
	if el then
		el:_mousemoved(x, y)
		trigger(el, 'mousemoved', x-el:getXOnScreen(), y-el:getYOnScreen())
	end

	return true
end

-- handled = mousereleased( x, y, button )
function Gui:mousereleased(x, y, buttonN)
	assertarg(1, x,       'number')
	assertarg(2, y,       'number')
	assertarg(3, buttonN, 'number')

	self._mouseX, self._mouseY = x, y

	local focus = self._mouseFocus
	if not (focus and self._mouseFocusSet[buttonN]) then
		return false
	end

	self._mouseFocusSet[buttonN] = nil

	updateLayoutIfNeeded(self) -- Updates hovered element.

	local el = (focus or self._hoveredElement)
	if el then
		el:_mousereleased(x, y, buttonN)
	end

	if not next(self._mouseFocusSet) then
		setMouseFocus(self, nil)
	end

	if el then
		trigger(el, 'mousereleased', x-el:getXOnScreen(), y-el:getYOnScreen(), buttonN)
	end

	return true
end

-- handled = wheelmoved( dx, dy )
function Gui:wheelmoved(dx, dy)
	assertarg(1, dx, 'number')
	assertarg(2, dy, 'number')

	if self._animationLockCount > 0 then return true end

	local isScroll = (dx ~= 0 or dy ~= 0)

	-- Shift key swaps X and Y scrolling.
	if love.keyboard.isDown('lshift','rshift') then
		dx, dy = dy, dx
	end

	local focus = self._mouseFocus
	if not focus then
		updateLayoutIfNeeded(self) -- Updates hovered element.
	end

	-- Focus (non-bubbling event)
	-- OR hovered element (bubbling event).
	local el         = focus or self._hoveredElement
	local anyIsSolid = false
	while el do
		if isScroll then

			-- Trigger any custom wheelmoved event handler.
			-- Returning true from the handler suppresses the default built-in behavior.
			if el:trigger('wheelmoved', dx, dy) then return true end

			if el:_wheelmoved(dx, dy) then return true end
		end

		if focus then return focus:isSolid() end

		anyIsSolid = anyIsSolid or el:isSolid()
		el = el._parent
	end
	return anyIsSolid
end



--==============================================================



-- state = areStandardKeysActive( )
function Gui:areStandardKeysActive()
	return self._standardKeysAreActive
end

-- setStandardKeysActive( state )
function Gui:setStandardKeysActive(state)
	self._standardKeysAreActive = state
end



-- blur( )
function Gui:blur()
	if self._mouseFocus then
		for buttonN in pairs(self._mouseFocusSet) do
			self:mousereleased(-1, -1, buttonN)
		end
	end
	setMouseFocus(self, nil)
	self._hoveredElement = nil
	self._mouseX, self._mouseY = nil, nil
end



-- defineStyle( styleName, styleData )
function Gui:defineStyle(styleName, styleData)
	assertarg(1, styleName, 'string')
	assertarg(2, styleData, 'table')
	self._styles[styleName] = styleData
end



-- element = find( id )
function Gui:find(id)
	local root = self._root
	if root then
		return (root._id == id and root or root:find(id))
	end
	return nil
end

-- elements = findAll( id )
function Gui:findAll(id)
	local root = self._root
	if not root then  return {}  end
	local els = root:findAll(id)
	if root._id == id then
		table.insert(els, 1, root)
	end
	return els
end

-- element = findActive( )
function Gui:findActive()
	local root = self._root
	return (root and root:findActive())
end

-- element = findToggled( )
function Gui:findToggled()
	local root = self._root
	return (root and root:findToggled())
end

-- Match an element using a CSS-like selector.
-- element = match( selector )
-- selector = "elementtype #id .tag"
-- Note: Element types include subtypes (e.g. 'bar' includes both 'vbar' and 'hbar').
function Gui:match(selector)
	local root = self._root
	if not root then  return nil  end
	return root:match(selector, true)
end

-- Match elements using a CSS-like selector.
-- elements = matchAll( selector )
-- selector = "elementtype #id .tag"
-- Note: Element types include subtypes (e.g. 'bar' includes both 'vbar' and 'hbar').
function Gui:matchAll(selector)
	local root = self._root
	if not root then  return {}  end
	return root:matchAll(selector, true)
end



-- sound = getDefaultSound( soundKey )
function Gui:getDefaultSound(soundK)
	assertarg(1, soundK, 'string')
	checkValidSoundKey(soundK)
	return self._defaultSounds[soundK]
end

-- setDefaultSound( soundKey, sound )
-- setDefaultSound( soundKey, nil ) -- remove sound
-- Note: 'sound' is the value sent to the GUI sound player callback
function Gui:setDefaultSound(soundK, sound)
	assertarg(1, soundK, 'string')
	checkValidSoundKey(soundK)
	self._defaultSounds[soundK] = sound
end



-- element = getElementAt( x, y [, includeNonSolid=false ] )
function Gui:getElementAt(x, y, nonSolid)
	local root = self._root
	if (root and not root._hidden) then
		return root:getElementAt(x, y, nonSolid)
	end
	return nil
end



-- getFont
Gui:defget'_font'

-- setFont( font )
function Gui:setFont(font)
	if self._font == font then return end
	self._font = font
	self._layoutNeedsUpdate = true
end

-- font = getBoldFont( )
function Gui:getBoldFont()
	return self._fontBold
end

-- setBoldFont( font )
function Gui:setBoldFont(font)
	if self._fontBold == font then return end
	self._fontBold = font
	self._layoutNeedsUpdate = true
end

-- font = getSmallFont( )
function Gui:getSmallFont()
	return self._fontSmall
end

-- setSmallFont( font )
function Gui:setSmallFont(font)
	if self._fontSmall == font then return end
	self._fontSmall = font
	self._layoutNeedsUpdate = true
end

-- font = getLargeFont( )
function Gui:getLargeFont()
	return self._fontLarge
end

-- setLargeFont( font )
function Gui:setLargeFont(font)
	if self._fontLarge == font then return end
	self._fontLarge = font
	self._layoutNeedsUpdate = true
end

-- font = getTooltipFont( )
function Gui:getTooltipFont()
	return self._fontTooltip
end

-- setTooltipFont( font )
function Gui:setTooltipFont(font)
	self._fontTooltip = font
end



-- element = getHoveredElement( )
Gui:defget'_hoveredElement'



do
	local function setNavigationTarget(self, widget)
		if self._navigationTarget == widget then
			return false -- no change
		end
		self._navigationTarget = widget
		self._timeSinceNavigation = 0
		if widget then
			widget:scrollIntoView()
		end
		;(widget or self._root):triggerBubbling('navigated', widget)
		return true -- change happened!
	end

	-- getNavigationTarget
	Gui:defget'_navigationTarget'

	-- success = navigateTo( widget )
	function Gui:navigateTo(widget)
		if self._navigationTarget == widget then
			return true
		end
		if (self._lockNavigation or not self:canNavigateTo(widget)) then
			return false
		end
		setNavigationTarget(self, widget)
		return true
	end

	do
		local function navigateToNextOrPrevious(self, id, allowNone, usePrev)

			local root = self._root
			if not root or root._hidden then return nil end

			local nav = self._navigationTarget
			if (not nav and not usePrev) then return self:navigateToFirst() end

			local foundNav, lastWidget = false, nil
			for el in (nav and nav:getNavigationRoot() or root):traverseVisible() do
				-- Note: Remember that we're traversing backwards.

				local elIsValid = (el:is(Cs.widget) and (not id or el._id == id))
				if elIsValid and usePrev and foundNav then
					setNavigationTarget(self, el)
					return el
				end

				foundNav = (foundNav or el == nav)
				if not usePrev and foundNav then
					if lastWidget or allowNone then
						setNavigationTarget(self, lastWidget)
						return lastWidget
					end
					return nav
				end

				if elIsValid then lastWidget = el end

				if el._captureInput or el._captureGuiInput then break end

			end

			if not allowNone then return nav end

			setNavigationTarget(self, nil)
			return nil
		end

		-- element = navigateToNext( [ id=any, allowNone=false ] )
		-- Note: Calls navigateToFirst() if there's no current navigation target.
		function Gui:navigateToNext(id, allowNone)
			return navigateToNextOrPrevious(self, id, allowNone, false)
		end

		-- element = navigateToPrevious( [ id=any, allowNone=false ] )
		function Gui:navigateToPrevious(id, allowNone)
			return navigateToNextOrPrevious(self, id, allowNone, true)
		end

	end

	-- element = navigateToFirst( )
	function Gui:navigateToFirst()
		if self._lockNavigation then
			return nil
		end
		local root = self._root
		if (not root or root._hidden) then
			return nil
		end
		local first = nil
		for el in root:traverseVisible() do
			if (el:is(Cs.widget) and not (first and first._priority > el._priority)) then
				first = el
			end
			if (el._captureInput or el._captureGuiInput) then
				break
			end
		end
		setNavigationTarget(self, first)
		return first
	end

	-- landingElement = navigate( angle )
	function Gui:navigate(ang)
		if self._lockNavigation then return nil end

		local root = self._root
		if not root or root._hidden then return nil end

		local nav = self._navigationTarget
		if not nav then return self:navigateToFirst() end

		if trigger(nav, 'navigate', ang) then
			return self._navigationTarget -- Suppress default behavior.
		end

		local closestEl = nav:getClosestInDirection(ang)
		if closestEl then
			setNavigationTarget(self, closestEl)
		end

		return (closestEl or nav)
	end

	-- state = canNavigateTo( element )
	-- Note: Does not check if navigation is locked
	function Gui:canNavigateTo(widget)
		if widget == nil then
			return true -- navigation target can always be nothing
		elseif not (widget:is(Cs.widget) and widget:isDisplayed()) then
			return false
		end
		local root = self._root
		if (not root or root._hidden) then
			return false
		end
		for el in root:traverseVisible() do
			if el == widget then
				return true
			elseif (el._captureInput or el._captureGuiInput) then
				return false
			end
		end
		error('somehow the element is a displayed active widget but not among the visible elements under the root')
	end

end



-- element = getRoot( )
Gui:defget'_root'



-- getScissorCoordsConverter, setScissorCoordsConverter
Gui:def'_scissorCoordsConverter'



-- speedX, speedY = getScrollSpeed( )
function Gui:getScrollSpeed()
	return self._scrollSpeedX, self._scrollSpeedY
end

-- setScrollSpeed( speedX [, speedY=speedX ] )
function Gui:setScrollSpeed(speedX, speedY)
	assertarg(1, speedX, 'number')
	assertarg(2, speedY, 'number','nil')
	self._scrollSpeedX = speedX
	self._scrollSpeedY = speedY or speedX
end



-- getSoundPlayer, setSoundPlayer
-- soundPlayer( sound )
Gui:def'_soundPlayer'



-- spriteLoader = getSpriteLoader( )
-- setSpriteLoader( spriteLoader )
-- image, frames = spriteLoader( spriteName )
Gui:def'_spriteLoader'



-- callback, errorMessage = getTarget( target )
-- target: "ID.subID.anotherSubID"
function Gui:getTarget(target)
	local el = self._root
	if not el then
		return nil, 'there is no root element'
	end
	local ids = matchAll(target, '[^.]+')
	for i = 1, #ids do
		if not el:is(Cs.container) then
			return false, F'%q is not a container'(el._id)
		end
		el = el:find(ids[i])
		if not el then
			return nil, F'%q does not exist in %q'(ids[i], (ids[i-1] or 'root'))
		end
	end
	return el
end

-- target, event     = parseTargetAndEvent( targetAndEvent )
-- nil, errorMessage = parseTargetAndEvent( targetAndEvent )
-- targetAndEvent: "ID.subID.anotherSubID.event"
function Gui:parseTargetAndEvent(targetAndEvent)

	local target, event = targetAndEvent:match'^(.-)%.?([^.]+)$'
	if not target then
		return nil, F'Bad targetAndEvent format %q.'(targetAndEvent)
	end

	return target, event
end

-- callback, errorMessage = getTargetCallback( targetAndEvent )
-- targetAndEvent: "ID.subID.anotherSubID.event"
function Gui:getTargetCallback(targetAndEvent)

	local target, event = self:parseTargetAndEvent(targetAndEvent)
	if not target then
		return nil, event
	end

	local el, err = self:getTarget(target)
	if not el then return nil, err end

	return el:getCallback(event)
end

-- element, errorMessage = setTargetCallback( targetAndEvent, callback )
-- targetAndEvent: "ID.subID.anotherSubID.event"
function Gui:setTargetCallback(targetAndEvent, cb)

	local target, event = self:parseTargetAndEvent(targetAndEvent)
	if not target then
		return nil, event
	end

	local el, err = self:getTarget(target)
	if not el then return nil, err end

	el:on(event, cb)

	return el
end



-- getTextPreprocessor
Gui:defget'_textPreprocessor'

-- setTextPreprocessor( textPreprocessor )
-- text = textPreprocessor( text, element, mnemonicsAreEnabled )
function Gui:setTextPreprocessor(f)
	assertarg(1, f, 'function','nil')
	self._textPreprocessor = f
end

-- Manually re-preprocess texts. Useful if e.g. the program's language changed.
-- reprocessTexts( )
function Gui:reprocessTexts()
	local root = self._root
	if root then
		root:reprocessTexts()
	end
end



-- getTheme
Gui:defget'_theme'

-- setTheme( theme )
function Gui:setTheme(theme)
	assertarg(1, theme, 'table','nil')
	if self._theme == theme then  return  end
	self._theme = theme
	self._layoutNeedsUpdate = true
end



-- getTime
Gui:defget'_time'

-- getTimeSinceNavigation
Gui:defget'_timeSinceNavigation'



-- state = isBusy( )
function Gui:isBusy()
	return (self:isKeyboardBusy() or self:isMouseBusy())
end

-- state = isKeyboardBusy( )
function Gui:isKeyboardBusy()
	return (self._keyboardFocus ~= nil)
end

-- state = isMouseBusy( )
function Gui:isMouseBusy()
	return (self._mouseFocus ~= nil)
end



-- state = isIgnoringKeyboardInput( )
function Gui:isIgnoringKeyboardInput()
	return self._ignoreKeyboardInputThisFrame
end



-- state = isInputCaptured( [ includeGuiInput=false ] )
function Gui:isInputCaptured(includeGuiInput)

	local root = self._root
	if not root or root._hidden then return false end

	for el in root:traverseVisible() do
		if el._captureInput or (includeGuiInput and el._captureGuiInput) then
			return true
		end
	end

	return false
end



-- state = isInteractionLocked( )
function Gui:isInteractionLocked()
	return (self._animationLockCount > 0)
end



-- state = isMouseGrabbed( )
function Gui:isMouseGrabbed()
	return self._mouseIsGrabbed
end

-- setMouseIsGrabbed( state )
function Gui:setMouseIsGrabbed(state)
	self._mouseIsGrabbed = state
end



-- load( data )
function Gui:load(data)

	if getTypeFromData(data) ~= 'root' then
		errorf('gui root element must be of type "root"')
	end

	local root = Cs.root(self, data, nil)
	self._root = root

	local themeInit = themeGet(self, 'init')
	themeInit(root)
	for el in root:traverse() do
		themeInit(el)
	end

	self._layoutNeedsUpdate = true

end



-- handled = ok( )
function Gui:ok()
	local nav = self._navigationTarget
	if nav and nav._active then return nav:_ok() end
	return false
end

-- handled = back( )
function Gui:back()
	local root = self._root
	if (not root or root._hidden) then
		return false
	end

	-- Close closable (like Escape does)
	for el in root:traverseVisible() do
		if el:canClose() then
			el:close()
			return true
		elseif (el._captureInput or el._captureGuiInput) then
			break
		end
	end

	return false
end



-- Force a layout update (should never be needed as it's done automatically)
-- updateLayout( )
function Gui:updateLayout()
	local root = self._root
	if (root and not root._hidden) then
		return updateLayout(root)
	end
end



--==============================================================
--= Image Mixin ================================================
--==============================================================



Ms.imageMixin = {
	--[[
	spriteName = '',

	_imageBackgroundColor = nil,
	_imageColor = nil,
	_imageScaleX = 1.0, _imageScaleY = 1.0,
	_sprite = nil,
	]]
}



-- drawImage( x, y )
function Ms.imageMixin:drawImage(x, y)
	if not self._sprite then return end
	local image, quad = getCurrentViewOfSprite(self._sprite)
	local padding = (self:is(Cs.button) and self._imagePadding or 0)
	LG.draw(image, quad, x+padding, y+padding, 0, self._imageScaleX, self._imageScaleY)
end



-- getImageBackgroundColor, setImageBackgroundColor
class.def(Ms.imageMixin, '_imageBackgroundColor')

-- state = hasImageBackgroundColor( )
function Ms.imageMixin:hasImageBackgroundColor()
	return (self._imageBackgroundColor ~= nil)
end

-- Tell LÖVE to use the image background color.
-- hasImageBackgroundColor = useImageBackgroundColor( [ opacity=1.0 ] )
function Ms.imageMixin:useImageBackgroundColor(opacity)
	local color = self._imageBackgroundColor
	useColor((color or COLOR_TRANSPARENT), opacity)
	return (color ~= nil)
end



-- getImageColor, setImageColor
class.def(Ms.imageMixin, '_imageColor')

-- state = hasImageColor( )
function Ms.imageMixin:hasImageColor()
	return (self._imageColor ~= nil)
end

-- Tell LÖVE to use the image color.
-- hasImageColor = useImageColor( [ opacity=1.0 ] )
function Ms.imageMixin:useImageColor(opacity)
	local color = self._imageColor
	useColor((color or COLOR_WHITE), opacity)
	return (color ~= nil)
end



-- width, height = getImageDimensions( )
function Ms.imageMixin:getImageDimensions()
	local sprite = self._sprite
	if not sprite then return 0, 0 end
	return sprite.width, sprite.height
end

-- Sets the scale of the image by specifying a size. Does nothing if there's no image.
-- setImageSize( width, height )
function Ms.imageMixin:setImageSize(w, h)
	local sprite = self._sprite
	if not sprite then return end
	self:setImageScale(w/sprite.width, h/sprite.height)
end

-- Scales the image so it fills the element. Does nothing if there's no image or if no dimensions are set.
-- maximizeImageSize( [ extraWidth=0, extraHeight=0 ] )
function Ms.imageMixin:maximizeImageSize(extraWidth, extraHeight)

	local sprite = self._sprite
	if not sprite then return end

	local paddingSum = (self:is(Cs.button) and 2*self._imagePadding or 0)

	local scaleX = (self._width  and (self._width -paddingSum+(extraHeight or 0))/sprite.width  or self._imageScaleX)
	local scaleY = (self._height and (self._height-paddingSum+(extraWidth  or 0))/sprite.height or self._imageScaleY)
	self:setImageScale(scaleX, scaleY)

end



-- scaleX, scaleY = getImageScale( )
function Ms.imageMixin:getImageScale()
	return self._imageScaleX, self._imageScaleY
end

-- getImageScaleX
class.defget(Ms.imageMixin, '_imageScaleX')

-- getImageScaleY
class.defget(Ms.imageMixin, '_imageScaleY')

-- setImageScale( scaleX [, scaleY=scaleX ] )
function Ms.imageMixin:setImageScale(sx, sy)
	assertarg(1, sx, 'number')
	assertarg(2, sy, 'number','nil')
	sy = (sy or sx)
	if (self._imageScaleX == sx and self._imageScaleY == sy) then
		return
	end
	self._imageScaleX = sx
	self._imageScaleY = sy
	if self._sprite then  scheduleLayoutUpdateIfDisplayed(self)  end
end

-- setImageScaleX( scaleX )
function Ms.imageMixin:setImageScaleX(sx)
	assertarg(1, sx, 'number')
	if self._imageScaleX == sx then  return  end
	self:setImageScale(sx, self._imageScaleY)
	if self._sprite then  scheduleLayoutUpdateIfDisplayed(self)  end
end

-- setImageScaleY( scaleY )
function Ms.imageMixin:setImageScaleY(sy)
	assertarg(1, sy, 'number')
	if self._imageScaleY == sy then  return  end
	self:setImageScale(self._imageScaleY, sy)
	if self._sprite then  scheduleLayoutUpdateIfDisplayed(self)  end
end



-- spriteName = getSprite( )
function Ms.imageMixin:getSprite()
	return self._spriteName
end

-- setSprite( image [, quad ] )
-- setSprite( image, frames )
-- setSprite( spriteName )
function Ms.imageMixin:setSprite(imageOrName, framesOrQuad)
	assertarg(1, imageOrName, 'userdata','string','nil')

	local image = nil
	local spriteName = ''

	if type(imageOrName) == 'string' then
		spriteName = imageOrName
		if spriteName ~= '' and spriteName == self._spriteName then return end

		local spriteLoader = self._gui._spriteLoader
		if not spriteLoader then
			printerror(2, 'There is no sprite loader to convert the sprite name %q to a sprite.', spriteName)
			return
		end

		image, framesOrQuad = spriteLoader(spriteName)
		if not image then
			printerror(2, 'The sprite loader did not return a required image for sprite name %q.', spriteName)
			return
		end

	elseif imageOrName then
		assertarg(2, framesOrQuad, 'userdata','table','nil')
		image = imageOrName

	end

	local oldIw, oldIh = 0, 0
	if self._sprite then
		oldIw, oldIh = self._sprite.width, self._sprite.height
	end

	self._sprite     = (image and newSprite(image, framesOrQuad))
	self._spriteName = spriteName

	local iw, ih = 0, 0
	if self._sprite then
		iw, ih = self._sprite.width, self._sprite.height
	end

	if not (iw == oldIw and ih == oldIh) then
		scheduleLayoutUpdateIfDisplayed(self)
	end

end

-- state = hasSprite( )
function Ms.imageMixin:hasSprite()
	return (self._sprite ~= nil)
end



--==============================================================
--= Element ====================================================
--==============================================================



Cs.element = class('GuiElement', {

	--[[STATIC]] _events = {},

	_animations = nil,
	_callbacks = nil,
	_gui = nil,
	_layoutExpandablesX = 0, _layoutExpandablesY = 0,
	_layoutImmediateOffsetX = 0, _layoutImmediateOffsetY = 0, -- Sum of parents' scrolling, excluding smooth scrolling.
	_layoutInnerSpacingsX = 0, _layoutInnerSpacingsY = 0,
	_layoutInnerStaticWidth = 0, _layoutInnerStaticHeight = 0,
	_layoutInnerWidth = 0, _layoutInnerHeight = 0,
	_layoutOffsetX = 0.0, _layoutOffsetY = 0.0, -- Sum of parents' scrolling.
	_layoutWidth = 0, _layoutHeight = 0,
	_layoutX = 0, _layoutY = 0,
	_parent = nil,
	_timeBecomingVisible = 0.00,

	_anchorX = 0.0, _anchorY = 0.0, -- where in self to base off x and y
	_background = nil,
	_captureInput = false, --[[all input]] _captureGuiInput = false, --[[all input affecting GUI]]
	_closable = false,
	_data = nil,
	_floating = false, -- disables natural positioning in certain parents (e.g. bars)
	_hidden = false,
	_id = '',
	_minWidth = 0, _minHeight = 0,
	_mouseCursor = nil,
	_originX = 0.0, _originY = 0.0, -- where in the parent to base x and y off
	_sounds = nil,
	_spacing = 0, _spacingVertical = nil, _spacingHorizontal = nil,
	_spacingTop = nil, _spacingRight = nil, _spacingBottom = nil, _spacingLeft = nil,
	_style = '',
	_tags = nil,
	_tooltip = '', _unprocessedTooltip = '',
	_width = nil, _height = nil,
	_x = 0, _y = 0, -- offset from origin

	data = nil,

})
registerEvents(Cs.element, {
	'beforedraw','afterdraw',
	'close','closed',
	'focused','blurred',
	'init',
	'keypressed',
	'layout',
	'mousepressed','mousemoved','mousereleased',
	'navigated',
	'pressed',
	'refresh',
	'show','hide',
	'textinput',
	'update',
	'wheelmoved',
})

function Cs.element:init(gui, data, parent)

	self._gui = assert(gui)
	self._parent = parent

	self._animations = {}
	self._callbacks  = {}

	local styleName = data.style
	if styleName then

		local styleData = gui._styles[styleName]
			or errorf('No style with name %q exists.', styleName)

		applyStyle(data, styleData)

		self._style = styleName
	end

	retrieve(self, data, '_anchorX', '_anchorY')
	retrieve(self, data, '_background')
	retrieve(self, data, '_captureInput', '_captureGuiInput')
	retrieve(self, data, '_closable')
	-- retrieve(self, data, '_data')
	retrieve(self, data, '_floating')
	retrieve(self, data, '_hidden')
	retrieve(self, data, '_id')
	retrieve(self, data, '_minWidth', '_minHeight')
	-- retrieve(self, data, '_mouseCursor')
	retrieve(self, data, '_originX', '_originY')
	-- retrieve(self, data, '_sounds')
	retrieve(self, data, '_spacing', '_spacingVertical', '_spacingHorizontal')
	retrieve(self, data, '_spacingTop', '_spacingRight', '_spacingBottom', '_spacingLeft')
	-- retrieve(self, data, '_style')
	-- retrieve(self, data, '_tags')
	-- retrieve(self, data, '_tooltip')
	retrieve(self, data, '_width', '_height')
	retrieve(self, data, '_x', '_y')

	self._timeBecomingVisible = gui._time

	-- Set data table
	assert(data.data == nil or type(data.data) == 'table')
	self._data = (data.data or {})
	self.data = self._data -- element.data is exposed for easy access

	-- Make sure the element has an ID
	if self._id == '' then
		local numId = gui._lastAutomaticId+1
		gui._lastAutomaticId = numId
		self._id = '__'..numId
	end

	-- Set sounds table
	self._sounds = {}
	if data.sounds ~= nil then
		assert(type(data.sounds) == 'table')
		for soundK, sound in pairs(data.sounds) do
			checkValidSoundKey(soundK)
			self._sounds[soundK] = sound
		end
	end

	-- Add tags
	self._tags = {}
	if data.tags ~= nil then
		assert(type(data.tags) == 'table')
		for _, tag in ipairs(data.tags) do
			self._tags[tag] = true
		end
	end

	if data.mouseCursor ~= nil then  self:setMouseCursor(data.mouseCursor)  end
	if data.tooltip     ~= nil then  self:setTooltip(data.tooltip)          end

	-- Set initial offset
	if parent then
		self._layoutImmediateOffsetX = parent._layoutImmediateOffsetX+parent._scrollX
		self._layoutImmediateOffsetY = parent._layoutImmediateOffsetY+parent._scrollY
		self._layoutOffsetX = parent._layoutOffsetX+parent._visualScrollX
		self._layoutOffsetY = parent._layoutOffsetY+parent._visualScrollY
	end

	if data.debug then gui.debug = true end
end



-- _update( deltaTime )
function Cs.element:_update(dt)
	-- void
end



-- _draw( )
function Cs.element:_draw()
	local x, y, w, h = xywh(self)

	if not self._gui.debug then
		triggerIncludingAnimations(self, 'beforedraw', x, y, w, h)
	end

	drawLayoutBackground(self)

	if not self._gui.debug then
		triggerIncludingAnimations(self, 'afterdraw', x, y, w, h)
	end

end

-- _drawDebug( red, green, blue [, backgroundOpacity=1 ] )
function Cs.element:_drawDebug(r, g, b, bgOpacity)
	local gui = self._gui
	if not gui.debug then return end

	local isContainer = self:is(Cs.container)

	local x, y, w, h = xywh(self)
	local innerW, innerH = self._layoutInnerWidth, self._layoutInnerHeight
	local padding = (isContainer and self._padding or 0)
	local lw = math.max(padding, 1)

	local sbW = themeGet(gui, 'scrollbarWidth')

	if self:isKeyboardFocus() then
		r, g, b = 255, 255, 0
	elseif self:isNavigationTarget() then
		r, g, b = 255, 255, 255
	end

	LG.push('all')

	LG.translate(x, y)

	-- Background and center line
	LG.setColor(r, g, b, 60*(bgOpacity or 1))
	LG.rectangle('fill', 0, 0, w, h)
	LG.line(padding, padding, w/2, h/2)

	-- Border
	LG.setLineWidth(lw)
	LG.setColor(r, g, b, 100)
	LG.rectangle('line', lw/2, lw/2, w-lw, h-lw)
	if isContainer then
		if self:hasScrollbarOnRight()  then  LG.rectangle('fill', w-lw-sbW, lw, sbW, h-2*lw)  end
		if self:hasScrollbarOnBottom() then  LG.rectangle('fill', lw, h-lw-sbW, w-w*lw, sbW)  end
	end
	LG.setLineWidth(1)
	LG.setColor(r, g, b, 150)
	LG.rectangle('line', 0.5, 0.5, w-1, h-1)

	-- Info
	r, g, b = lerp(r, 255, 0.5), lerp(g, 255, 0.5), lerp(b, 255, 0.5)
	LG.setFont(gui._font or DEFAULT_FONT)
	LG.setColor(r, g, b, 200)
	if self._id:find'^__%d+$' then
		LG.print(F'%d.%d'   (self:getDepth(), (self:getIndex() or 0)          ), 2, 1)
	else
		LG.print(F'%d.%d:%s'(self:getDepth(), (self:getIndex() or 0), self._id), 2, 1)
	end

	LG.pop()

end

-- _drawTooltip( )
function Cs.element:_drawTooltip()

	local gui = self._gui

	local text = self._tooltip
	if (text == '' or gui._tooltipTime < gui.TOOLTIP_DELAY) then
		return
	end

	local root = gui._root

	local font = (gui._font or DEFAULT_FONT)
	local textW, textH = getTextDimensions(font, text)

	local w, h = themeGetSize(self, 'tooltip', textW, textH) -- @Speed: Get tooltip size when tooltip text changes.

	local x = math.max(math.min(self._layoutX, root._width-w), 0)
	local y = self._layoutY+self._layoutHeight
	if y+h > root._height then
		y = math.max(y-h-self._layoutHeight, 0)
	end

	themeRenderOnScreen(self, 'tooltip', x, y, w, h, text, textW, textH, gui._tooltipTime-gui.TOOLTIP_DELAY)

end



--[[
	animate( duration, [ lockInteraction=false, ] callbackTable )
	callbackTable = { [event]=callback... }
	callback = function( element, event, progress, ... )

	-- Example:
	myGui:find("myButton"):animate(1, true, {
		afterdraw = function(myButton, event, progress, x, y, w, h)
			-- Fade in and out a green cover over the button.
			LG.setColor(0, 255, 0, 255*math.sin(progress*math.pi))
			LG.rectangle('fill', x, y, w, h)
		end,
	})

]]
function Cs.element:animate(duration, lockInteraction, callbacks)
	assertarg(1, duration, 'number')

	if type(lockInteraction) == 'table' then
		lockInteraction, callbacks = false, lockInteraction
	else
		assertarg(2, lockInteraction, 'boolean')
		assertarg(3, callbacks, 'table')
	end

	local gui  = self._gui
	local time = gui._time

	local anim = {

		element         = self,
		lockInteraction = lockInteraction,
		callbacks       = callbacks,

		startTime = time,
		endTime   = time+duration,
		duration  = duration,

	}

	table.insert(self._animations, anim)
	table.insert(gui._allAnimations, anim)

	if lockInteraction then
		gui._animationLockCount = gui._animationLockCount+1
	end

end



-- success = close( )
function Cs.element:close()
	if not self:canClose() then
		return false
	end
	local preparedSound = prepareSound(self, 'close')
	if trigger(self, 'close') then
		return false -- Suppress default behavior.
	end
	preparedSound()
	self:hide()
	self:triggerBubbling('closed', self)
	return true
end

-- result = canClose( )
function Cs.element:canClose()
	return (self._closable and not self._gui._lockNavigation and self:isDisplayed())
end



-- state = exists( )
function Cs.element:exists()
	return (self._parent ~= nil or self == self._gui._root)
end



-- anchorX, anchorY = getAnchor( )
function Cs.element:getAnchor()
	return self._anchorX, self._anchorY
end

-- setAnchor( anchorX, anchorY )
function Cs.element:setAnchor(anchorX, anchorY)
	if (self._anchorX == anchorX and self._anchorY == anchorY) then
		return
	end
	self._anchorX, self._anchorY = anchorY
	scheduleLayoutUpdateIfDisplayed(self)
end

-- getAnchorX
Cs.element:defget'_anchorX'

-- setAnchorX( anchorX )
function Cs.element:setAnchorX(anchorX)
	if self._anchorX == anchorX then
		return
	end
	self._anchorX = anchorX
	scheduleLayoutUpdateIfDisplayed(self)
end

-- getAnchorY
Cs.element:defget'_anchorY'

-- setAnchorY( anchorY )
function Cs.element:setAnchorY(anchorY)
	if self._anchorY == anchorY then
		return
	end
	self._anchorY = anchorY
	scheduleLayoutUpdateIfDisplayed(self)
end



-- callback = getCallback( event )
function Cs.element:getCallback(event)
	return self._callbacks[event]
end

-- setCallback( event, callback )
function Cs.element:setCallback(event, cb)
	assertarg(1, event, 'string')
	assertarg(2, cb, 'function','nil')

	if not self._events[event] then
		printerror(2, 'Unknown event %q. (%s)', event, self:getPathDescription())
		return
	end

	self._callbacks[event] = cb

	-- Since callbacks can only be attached to elements after the actual
	-- initialization has happened we instead trigger the init event here.
	if cb and event == 'init' then
		trigger(self, 'init')
	end

end

-- Alias for setCallback().
-- on( event, callback )
Cs.element.on = Cs.element.setCallback

-- off( event )
function Cs.element:off(event)
	self:on(event, nil)
end

-- value = trigger( event [, extraArguments... ] )
function Cs.element:trigger(event, ...)
	assertarg(1, event, 'string')
	if not self._events[event] then
		printerror(2, 'Unknown event %q. (%s)', event, self:getPathDescription())
		return nil
	end
	return trigger(self, event, ...)
end

-- triggerBubbling( event [, extraArguments... ] )
function Cs.element:triggerBubbling(event, ...)
	assertarg(1, event, 'string')
	if not self._events[event] then
		printerror(2, 'Unknown event %q. (%s)', event, self:getPathDescription())
		return
	end
	local el = self
	repeat
		local returnV = trigger(el, event, ...)
		el = el._parent
	until (returnV or not el)
end



-- Returns closest ancestor matching elementType (including self)
-- element = getClosest( elementType )
function Cs.element.getClosest(el, elType)
	local C = requireElementClass(elType)
	repeat
		if el:is(C) then
			return el
		end
		el = el._parent
	until not el
	return nil
end



-- element = getClosestInDirection( angle [, elementType="widget", ignoreInputCaptureState=false, ignoreConfinement=false ] )
do
	local MAX_ANGLE_DIFF = tau/4

	local function _getClosestInDirection(navRoot, C, fromX, fromY, ang, ignoreCapture, elToIgnore)
		local closestEl      = nil
		local closestDistSqr = math.huge
		local closestAngDiff = math.huge

		for el in navRoot:traverseVisible() do

			if el ~= elToIgnore and el:is(C) then
				local x, y = el:getPositionOnScreen()
				x = math.min(math.max(fromX, x+0.01), x+el._layoutWidth-0.01)
				y = math.min(math.max(fromY, y+0.01), y+el._layoutHeight-0.01)

				local dx, dy = x-fromX, y-fromY

				local distSqr = dx*dx+dy*dy
				if distSqr <= closestDistSqr then

					local angDiff = math.atan2(dy, dx)-ang
					angDiff = math.abs(math.atan2(math.sin(angDiff), math.cos(angDiff))) -- Normalize.

					if angDiff < MAX_ANGLE_DIFF then
						closestEl      = el
						closestDistSqr = distSqr
						closestAngDiff = angDiff
					end

				end
			end

			if not ignoreCapture and (el._captureInput or el._captureGuiInput) then
				break
			end

		end

		return closestEl
	end

	function Cs.element:getClosestInDirection(ang, elType, ignoreCapture, ignoreConfinement)
		assertarg(1, ang, 'number')
		assertarg(2, elType, 'nil','string')
		assertarg(3, ignoreCapture, 'nil','boolean')

		local C = (elType and requireElementClass(elType) or Cs.widget)

		local gui = self._gui
		updateLayoutIfNeeded(gui)

		local navRoot = (ignoreConfinement and gui._root or self:getNavigationRoot())

		local centerX, centerY = self:getLayoutCenterPosition()

		local fromX = centerX+self._layoutOffsetX+0.495*self._layoutWidth *math.cos(ang)
		local fromY = centerY+self._layoutOffsetY+0.495*self._layoutHeight*math.sin(ang)
		local closestEl = _getClosestInDirection(navRoot, C, fromX, fromY, ang, ignoreCapture, self)

		if not closestEl and not ignoreConfinement and navRoot._confineNavigation then
			fromX = centerX+self._layoutOffsetX-10000*math.cos(ang)
			fromY = centerY+self._layoutOffsetY-10000*math.sin(ang)
			closestEl = _getClosestInDirection(navRoot, C, fromX, fromY, ang, ignoreCapture, nil)
		end

		return closestEl
	end

end

do
	local function getNextOrPrevious(self, elType, ignoreCapture, usePrev)
		local C = (elType and requireElementClass(elType) or Cs.widget)

		local root = self._gui._root
		if not root or root._hidden then return nil end

		local foundSelf, lastMatch = false, nil
		for el in self:getNavigationRoot():traverseVisible() do
			-- Note: Remember that we're traversing backwards.

			local elIsValid = el:is(C)
			if (elIsValid and usePrev and foundSelf) then return el end

			foundSelf = (foundSelf or el == self)
			if not usePrev and foundSelf then
				return lastMatch -- May be nil.
			end

			if elIsValid then lastMatch = el end

			if not ignoreCapture and (el._captureInput or el._captureGuiInput) then
				break
			end

		end
		return nil
	end

	-- element = getNext( [ elType="widget", ignoreInputCaptureState=false ] )
	function Cs.element:getNext(elType, ignoreCapture)
		return getNextOrPrevious(self, elType, ignoreCapture, false)
	end

	-- element = getPrevious( [ elType="widget", ignoreInputCaptureState=false ] )
	function Cs.element:getPrevious(elType, ignoreCapture)
		return getNextOrPrevious(self, elType, ignoreCapture, true)
	end

end



-- value = getData( key )
-- NOTE: element:getData(k) is the same as element.data[k]
function Cs.element:getData(k)
	return self._data[k]
end

-- setData( key, value )
-- NOTE: element:setData(key, value) is the same as element.data[key]=value
function Cs.element:setData(k, v)
	self._data[k] = v
end

-- oldDataTable = swapData( newDataTable )
function Cs.element:swapData(data)
	assertarg(1, data, 'table')
	local oldData = self._data
	self._data, self.data = data, data
	return oldData
end



-- width, height = getDimensions( )
function Cs.element:getDimensions()
	return self._width, self._height
end

-- setDimensions( width, height )
function Cs.element:setDimensions(w, h)
	if self._width == w and self._height == h then return end
	self._width, self._height = w, h
	scheduleLayoutUpdateIfDisplayed(self)
end

-- getWidth
Cs.element:defget'_width'

-- setWidth( width )
function Cs.element:setWidth(w)
	if self._width == w then return end
	self._width = w
	scheduleLayoutUpdateIfDisplayed(self)
end

-- getHeight
Cs.element:defget'_height'

-- setHeight( height )
function Cs.element:setHeight(h)
	if self._height == h then return end
	self._height = h
	scheduleLayoutUpdateIfDisplayed(self)
end



-- getGui
Cs.element:defget'_gui'



-- time = getGuiTime( )
function Cs.element:getGuiTime()
	return self._gui._time
end



-- getId
Cs.element:defget'_id'

-- state = hasId( id [, id2... ] )
function Cs.element:hasId(id, ...)
	if self._id == id then
		return true
	elseif ... then
		return self:hasId(...)
	end
	return false
end



-- index = getIndex( )
function Cs.element:getIndex()
	local parent = self._parent
	return (parent and parent:indexOf(self))
end

-- depth = getDepth( )
function Cs.element:getDepth()
	local depth, current = 0, self
	while true do
		current = current._parent
		if not current then
			return depth
		end
		depth = depth+1
	end
end



-- x, y, width, height = getLayout( )
function Cs.element:getLayout()
	updateLayoutIfNeeded(self._gui)
	return self._layoutX, self._layoutY, self._layoutWidth, self._layoutHeight
end



-- width, height = getLayoutDimensions( )
function Cs.element:getLayoutDimensions()
	updateLayoutIfNeeded(self._gui)
	return self._layoutWidth, self._layoutHeight
end

-- width = getLayoutWidth( )
function Cs.element:getLayoutWidth()
	updateLayoutIfNeeded(self._gui)
	return self._layoutWidth
end

-- height = getLayoutHeight( )
function Cs.element:getLayoutHeight()
	updateLayoutIfNeeded(self._gui)
	return self._layoutHeight
end



-- x, y = getLayoutPosition( )
function Cs.element:getLayoutPosition()
	updateLayoutIfNeeded(self._gui)
	return self._layoutX, self._layoutY
end

-- x = getLayoutX( )
function Cs.element:getLayoutX()
	updateLayoutIfNeeded(self._gui)
	return self._layoutX
end

-- y = getLayoutY( )
function Cs.element:getLayoutY()
	updateLayoutIfNeeded(self._gui)
	return self._layoutY
end

-- x, y = getLayoutCenterPosition( )
function Cs.element:getLayoutCenterPosition()
	updateLayoutIfNeeded(self._gui)
	return self._layoutX+self._layoutWidth*0.5,
		self._layoutY+self._layoutHeight*0.5
end



-- width, height = getMinDimensions( )
function Cs.element:getMinDimensions()
	return self._minWidth, self._minHeight
end

-- getMinWidth
Cs.element:defget'_minWidth'

-- getMinHeight
Cs.element:defget'_minHeight'



-- cursor           = getMouseCursor( )
-- systemCursorType = getMouseCursor( )
function Cs.element:getMouseCursor()
	return self._mouseCursor
end

-- cursor = getResultingMouseCursor( )
-- Returns nil if no cursor is set.
function Cs.element:getResultingMouseCursor()
	local cur = self._mouseCursor
	if type(cur) ~= 'string' then return cur end
	return LM.getSystemCursor(cur)
end

-- setMouseCursor( cursor )
-- setMouseCursor( systemCursorType )
function Cs.element:setMouseCursor(cur)
	assertarg(1, cur, 'userdata','string','nil')

	if type(cur) == 'string' then
		assert(LM.getSystemCursor(cur))
	end

	self._mouseCursor = cur
end



-- Get the mouse position relative the element.
-- Returns nil if the mouse position is unknown.
-- x, y = getMousePosition( )
function Cs.element:getMousePosition()
	local gui = self._gui
	if not gui._mouseX then return nil end

	local x, y = self:getPositionOnScreen()
	return gui._mouseX-x, gui._mouseY-y
end

-- x = getMouseX( )
function Cs.element:getMouseX()
	local x = self._gui._mouseX
	return x and x-self:getXOnScreen()
end

-- y = getMouseY( )
function Cs.element:getMouseY()
	local y = self._gui._mouseY
	return y and y-self:getYOnScreen()
end



-- originX, originY = getOrigin( )
function Cs.element:getOrigin()
	return self._originX, self._originY
end

-- setOrigin( originX, originY )
function Cs.element:setOrigin(originX, originY)
	if (self._originX == originX and self._originY == originY) then
		return
	end
	self._originX, self._originY = originX, originY
	scheduleLayoutUpdateIfDisplayed(self)
end

-- getOriginX
Cs.element:defget'_originX'

-- setOriginX( originX )
function Cs.element:setOriginX(originX)
	if self._originX == originX then
		return
	end
	self._originX = originX
	scheduleLayoutUpdateIfDisplayed(self)
end

-- getOriginY
Cs.element:defget'_originY'

-- setOriginY( originY )
function Cs.element:setOriginY(originY)
	if self._originY == originY then
		return
	end
	self._originY = originY
	scheduleLayoutUpdateIfDisplayed(self)
end



-- getParent
Cs.element:defget'_parent'

-- parents = getParents( )
-- Returns parents, with the closest parent first
function Cs.element:getParents()
	local el, parents, i = self, {}, 0
	while true do
		el = el._parent
		if not el then
			return parents
		end
		i = i+1
		parents[i] = el
	end
end

-- result = hasParent( parent )
-- Note: Checks all grandparents too
function Cs.element.hasParent(el, parent)
	while true do
		el = el._parent
		if not el then
			return false
		elseif el == parent then
			return true
		end
	end
	return false
end

-- container = getParentWithId( id )
function Cs.element.getParentWithId(el, id)
	while true do
		el = el._parent
		if not el then
			return nil
		elseif el._id == id then
			return el
		end
	end
	return nil
end

-- state = hasParentWithId( id )
function Cs.element:hasParentWithId(id)
	return (self:getParentWithId() ~= nil)
end

-- for index, parent in parents( ) do
do
	local function traverseParents(el)
		local i = 0
		while true do
			el = el._parent
			if not el then
				return
			end
			i = i+1
			coroutine.yield(i, el)
		end
	end
	function Cs.element:parents()
		return newIteratorCoroutine(traverseParents, self)
	end
end

-- for index, parent in parentsr( ) do
function Cs.element:parentsr()
	return ipairs(reverseArray(self:getParents()))
end

-- Traverse from self to the grandest parent.
-- for index, element in lineageUp( ) do
do
	local function traverseLineage(el)
		local i = 1
		while true do
			coroutine.yield(i, el)
			el = el._parent
			if not el then
				return
			end
			i = i+1
		end
	end
	function Cs.element:lineageUp()
		return newIteratorCoroutine(traverseLineage, self)
	end
end



-- description = getPathDescription( )
function Cs.element:getPathDescription()
	local parts, el = {}, self
	while true do
		local id, i = el._id, el:getIndex()
		if id:find('__', 1, true) ~= 1 then
			table.insert(parts, ')')
			table.insert(parts, el._id)
			table.insert(parts, '(')
		end
		table.insert(parts, (el.class.__name:gsub('^Gui', '')))
		if i then
			table.insert(parts, ':')
			table.insert(parts, i)
		end
		el = el._parent
		if not el then
			break
		end
		table.insert(parts, '/')
	end
	return table.concat(reverseArray(parts))
end



-- x, y = getPosition( )
function Cs.element:getPosition()
	return self._x, self._y
end

-- setPosition( x, y )
function Cs.element:setPosition(x, y)
	if (self._x == x and self._y == y) then
		return
	end
	self._x, self._y = x, y
	scheduleLayoutUpdateIfDisplayed(self)
end

-- getX
Cs.element:defget'_x'

-- setX( x )
function Cs.element:setX(x)
	if self._x == x then
		return
	end
	self._x = x
	scheduleLayoutUpdateIfDisplayed(self)
end

-- getY
Cs.element:defget'_y'

-- setY( y )
function Cs.element:setY(y)
	if self._y == y then
		return
	end
	self._y = y
	scheduleLayoutUpdateIfDisplayed(self)
end



-- x, y = getPositionOnScreen( [ ignoreSmoothScrolling=false ] )
function Cs.element:getPositionOnScreen(ignoreSmoothScrolling)
	updateLayoutIfNeeded(self._gui)
	if ignoreSmoothScrolling then
		return self._layoutX+self._layoutImmediateOffsetX, self._layoutY+self._layoutImmediateOffsetY
	else
		return self._layoutX+self._layoutOffsetX, self._layoutY+self._layoutOffsetY
	end
end

-- x = getXOnScreen( [ ignoreSmoothScrolling=false ] )
function Cs.element:getXOnScreen(ignoreSmoothScrolling)
	updateLayoutIfNeeded(self._gui)
	if ignoreSmoothScrolling then
		return self._layoutX+self._layoutImmediateOffsetX
	else
		return self._layoutX+self._layoutOffsetX
	end
end

-- y = getYOnScreen( [ ignoreSmoothScrolling=false ] )
function Cs.element:getYOnScreen(ignoreSmoothScrolling)
	updateLayoutIfNeeded(self._gui)
	if ignoreSmoothScrolling then
		return self._layoutY+self._layoutImmediateOffsetY
	else
		return self._layoutY+self._layoutOffsetY
	end
end



-- root = getRoot( )
-- Note: Returns the root the element knows of, which itself may have been removed
--   from the GUI. So this function differs slightly from gui:getRoot().
function Cs.element.getRoot(el)
	repeat
		if el.class == Cs.root then return el end
		el = el._parent
	until not el
	return nil -- We've been removed from the root.
end

-- container = getNavigationRoot( )
function Cs.element:getNavigationRoot()
	local container = self._parent
	if not container then return nil end -- Should we allow returning self if we're a container?

	while container._parent do
		if container._confineNavigation then return container end
		container = container._parent
	end

	return container -- We've reached the top container we know of.
end



-- sound = getSound( soundKey )
function Cs.element:getSound(soundK)
	assertarg(1, soundK, 'string')
	checkValidSoundKey(soundK)
	return self._sounds[soundK]
end

-- sound = getResultingSound( soundKey )
function Cs.element:getResultingSound(soundK)
	assertarg(1, soundK, 'string')
	checkValidSoundKey(soundK)
	local sound = self._sounds[soundK]
	if sound == nil then
		for _, parent in self:parents() do
			sound = parent._sounds[soundK]
			if sound ~= nil then
				break
			end
		end
		if sound == nil then
			local gui = self._gui
			if gui then
				sound = gui._defaultSounds[soundK]
			end
		end
	end
	if sound == '' then
		sound = nil -- special case: An empty string intercepts the bubbling and tells that no sound should be played
	end
	return sound
end

-- setSound( soundKey, sound )
-- setSound( soundKey, nil ) -- remove sound
function Cs.element:setSound(soundK, sound)
	assertarg(1, soundK, 'string')
	checkValidSoundKey(soundK)
	self._sounds[soundK] = sound
end



-- getStyle
Cs.element:defget'_style'



-- duration = getTimeSinceBecomingVisible( )
function Cs.element:getTimeSinceBecomingVisible()
	return self._gui._time-self._timeBecomingVisible
end



-- getTooltip
Cs.element:defget'_tooltip'

-- setTooltip( text )
function Cs.element:setTooltip(unprocessedText)
	unprocessedText = tostring(unprocessedText == nil and '' or unprocessedText)

	local text = preprocessText(self._gui, unprocessedText, self, false)
	if self._tooltip == text then return end

	self._tooltip = text
	self._unprocessedTooltip = unprocessedText

end

-- drawTooltip( x, y )
function Cs.element:drawTooltip(x, y)
	LG.print(self._tooltip, x, y)
end



-- font = getTooltipFont( )
function Cs.element:getTooltipFont()
	return (self._gui._fontTooltip or DEFAULT_FONT)
end

-- Tell LÖVE to use the tooltip font.
-- useTooltipFont( )
function Cs.element:useTooltipFont()
	LG.setFont(self:getTooltipFont())
end



-- state = hasTag( tag )
function Cs.element:hasTag(tag)
	return (self._tags[tag] ~= nil)
end

-- addTag( tag )
function Cs.element:addTag(tag)
	self._tags[tag] = true
end

-- removeTag( tag )
function Cs.element:removeTag(tag)
	self._tags[tag] = nil
end

-- removeAllTags( )
function Cs.element:removeAllTags()
	self._tags = {}
end

-- setTag( tag, state )
function Cs.element:setTag(tag, state)
	if state then
		self:addTag(tag)
	else
		self:removeTag(tag)
	end
end



-- result = isAt( x, y )
function Cs.element:isAt(x, y)
	updateLayoutIfNeeded(self._gui)
	x, y = x-self._layoutOffsetX, y-self._layoutOffsetY
	return (x >= self._layoutX and y >= self._layoutY
		and x < self._layoutX+self._layoutWidth and y < self._layoutY+self._layoutHeight)
end



-- handled, grabFocus = _keypressed( key, scancode, isRepeat )
function Cs.element:_keypressed(key, scancode, isRepeat)
	return false, false
end

-- _keyreleased( key, scancode )
function Cs.element:_keyreleased(key, scancode)
	-- void
end

-- handled = _textinput( text )
function Cs.element:_textinput(text)
	return false
end



-- handled, grabFocus = _mousepressed( x, y, button )
function Cs.element:_mousepressed(x, y, buttonN)
	return false, false
end

-- _mousemoved( x, y )
function Cs.element:_mousemoved(x, y)
	-- void
end

-- _mousereleased( x, y, button )
function Cs.element:_mousereleased(x, y, buttonN)
	-- void
end

-- handled = _wheelmoved( deltaX, deltaY )
function Cs.element:_wheelmoved(dx, dy)
	return false
end



-- state = isDisplayed( )
-- Returns true if the element and its parents are visible (and the element exists).
function Cs.element.isDisplayed(el)
	if not el:exists() then return false end
	repeat
		if el._hidden then return false end
		el = el._parent
	until not el
	return true
end

-- element = getClosestHiddenElement( )
function Cs.element:getClosestHiddenElement()
	local el = self
	repeat
		if el._hidden then
			return el
		end
		el = el._parent
	until not el
	return nil
end

-- element = getFarthestHiddenElement( )
function Cs.element:getFarthestHiddenElement()
	local el, hiddenEl = self, nil
	repeat
		if el._hidden then
			hiddenEl = el
		end
		el = el._parent
	until not el
	return hiddenEl
end



-- state = isFirst( )
function Cs.element:isFirst()
	return (not self._parent or self:getIndex() == 1)
end

-- state = isLast( )
function Cs.element:isLast()
	local parent = self._parent
	return (not parent or self:getIndex() == #parent)
end



-- state = isHidden( )
function Cs.element:isHidden()
	return self._hidden
end

-- state = isVisible( )
function Cs.element:isVisible()
	return (not self._hidden)
end

-- stateChanged = setHidden( state )
function Cs.element:setHidden(hidden)
	assertarg(1, hidden, 'boolean')
	if self._hidden == hidden then return false end

	local wasDisplayed = self:isDisplayed()
	self._hidden = hidden
	local isDisplayed = self:isDisplayed()

	local gui = self._gui

	if (wasDisplayed or isDisplayed) then

		if wasDisplayed then validateNavigationTarget(gui) end

		gui._layoutNeedsUpdate = true

		if isDisplayed then
			local time = gui._time

			self._timeBecomingVisible = time

			if self:is(Cs.container) then
				for el in self:traverseVisible() do
					el._timeBecomingVisible = time
				end
			end

		end
	end

	trigger(self, (hidden and 'hide' or 'show'))
	return true
end

-- stateChanged = setVisible( state )
function Cs.element:setVisible(hidden)
	return self:setHidden(not hidden)
end

-- stateChanged = show( )
function Cs.element:show()
	return self:setHidden(false)
end

-- stateChanged = hide( )
function Cs.element:hide()
	return self:setHidden(true)
end

-- toggleHidden( )
function Cs.element:toggleHidden()
	return self:setHidden(not self._hidden)
end



-- state = isHovered( [ checkMouseFocus=false ] )
function Cs.element:isHovered(checkMouseFocus)
	local gui = self._gui
	updateLayoutIfNeeded(gui) -- Updates hovered element.
	return (self == gui._hoveredElement) and not (checkMouseFocus and self ~= (gui._mouseFocus or self))
end



-- state = isMouseFocus( )
function Cs.element:isMouseFocus()
	return (self == self._gui._mouseFocus)
end

-- state = isKeyboardFocus( )
function Cs.element:isKeyboardFocus()
	return (self == self._gui._keyboardFocus)
end



-- state = isNavigationTarget( )
function Cs.element:isNavigationTarget()
	return (self == self._gui._navigationTarget)
end



-- state = isScrollbarXHovered( )
function Cs.element:isScrollbarXHovered()
	local gui = self._gui
	local x, y = gui._mouseX, gui._mouseY
	if not x then return false end

	local x1, y1 = self:getPositionOnScreen()
	local x2, y2 = x1+self:getChildAreaWidth(), y1+self._layoutHeight
	y1 = y2-themeGet(self._gui, 'scrollbarWidth')

	return (x >= x1 and x < x2 and y >= y1 and y < y2)
end

-- state = isScrollbarYHovered( )
function Cs.element:isScrollbarYHovered()
	local gui = self._gui
	local x, y = gui._mouseX, gui._mouseY
	if not x then return false end

	local x1, y1 = self:getPositionOnScreen()
	local x2, y2 = x1+self._layoutWidth, y1+self:getChildAreaHeight()
	x1 = x2-themeGet(self._gui, 'scrollbarWidth')

	return (x >= x1 and x < x2 and y >= y1 and y < y2)
end

-- state = isScrollbarXHandleHovered( )
function Cs.element:isScrollbarXHandleHovered()
	local gui = self._gui
	local x, y = gui._mouseX, gui._mouseY
	if not x then return false end

	local handlePos, handleLen = self:getScrollHandleX()
	local x1, y1 = self:getPositionOnScreen()

	x1 = x1+handlePos
	local x2 = x1+handleLen

	local y2 = y1+self._layoutHeight
	y1 = y2-themeGet(self._gui, 'scrollbarWidth')

	return (x >= x1 and x < x2 and y >= y1 and y < y2)
end

-- state = isScrollbarYHandleHovered( )
function Cs.element:isScrollbarYHandleHovered()
	local gui = self._gui
	local x, y = gui._mouseX, gui._mouseY
	if not x then return false end

	local handlePos, handleLen = self:getScrollHandleY()
	local x1, y1 = self:getPositionOnScreen()

	local x2 = x1+self._layoutWidth
	x1 = x2-themeGet(self._gui, 'scrollbarWidth')

	y1 = y1+handlePos
	local y2 = y1+handleLen

	return (x >= x1 and x < x2 and y >= y1 and y < y2)
end



-- state = isScrollingX( )
function Cs.element:isScrollingX()
	return (self._mouseScrollDirection == 'x')
end

-- state = isScrollingY( )
function Cs.element:isScrollingY()
	return (self._mouseScrollDirection == 'y')
end



-- state = isSolid( )
function Cs.element:isSolid()
	return false
end



-- result = isType( elementType )
function Cs.element:isType(elType)
	return self:is(requireElementClass(elType))
end



-- playSound( soundKey )
function Cs.element:playSound(soundK)
	assertarg(1, soundK, 'string')
	checkValidSoundKey(soundK)

	local gui = self._gui
	local soundPlayer = (gui and gui._soundPlayer)

	local sound = (soundPlayer and self:getResultingSound(soundK))
	if sound ~= nil then soundPlayer(sound) end
end



-- Trigger helper event "refresh"
-- refresh( )
function Cs.element:refresh()
	trigger(self, 'refresh')
end



-- handled = _ok( )
function Cs.element:_ok()
	return false
end



-- remove( )
function Cs.element:remove()
	local parent = self._parent
	if parent then
		parent:removeAt(parent:indexOf(self))
	end
end



-- reprocessTexts( )
function Cs.element:reprocessTexts()
	self:setTooltip(self._unprocessedTooltip)
end



-- scrollIntoView( )
function Cs.element.scrollIntoView(el)
	local gui = el._gui

	updateLayoutIfNeeded(gui)

	local sbW = themeGet(gui, 'scrollbarWidth')
	local navSize = themeGet(gui, 'navigationSize')

	local x1, y1 = el:getPositionOnScreen(true)
	local x2, y2 = x1+el._layoutWidth, y1+el._layoutHeight

	x1, y1 = x1-navSize, y1-navSize
	x2, y2 = x2+navSize, y2+navSize

	-- @Incomplete: navSize should probably be applied in places here below,
	-- (though it only matters if there are scrollables inside scrollables).

	repeat
		local parent = el._parent
		local maxW, maxH = parent._maxWidth, parent._maxHeight

		if (maxW or maxH) then
			local scrollX, scrollY = parent._scrollX, parent._scrollY

			if maxW then
				local distOutside = parent:getXOnScreen(true)-x1
				if distOutside >= 0 then
					scrollX = scrollX+distOutside
				else
					distOutside = x2-(parent:getXOnScreen(true)+maxW-(maxH and sbW or 0))
					if distOutside > 0 then
						scrollX = scrollX-distOutside
					end
				end
				x1 = el:getXOnScreen(true)
				x2 = x1+el._layoutWidth
			end

			if maxH then
				local distOutside = parent:getYOnScreen(true)-y1
				if distOutside >= 0 then
					scrollY = scrollY+distOutside
				else
					distOutside = y2-(parent:getYOnScreen(true)+maxH-(maxW and sbW or 0))
					if distOutside > 0 then
						scrollY = scrollY-distOutside
					end
				end
				y1 = el:getYOnScreen(true)
				y2 = y1+el._layoutHeight
			end

			parent:setScroll(scrollX, scrollY)

		end

		el, parent = parent, parent._parent

	until not parent

end



-- Helper function for themes' drawing functions.
-- Note that each call replaces the previous scissor.
-- setScissor( relativeX, relativeY, width, height [, ignoreParentScrollables=false ] )
-- setScissor( ) -- Only applies scissors from parent scrollables.
function Cs.element:setScissor(x, y, w, h, ignoreScrollables)
	local gui = self._gui

	self:unsetScissor()

	if x then
		setScissor(gui, self:getXOnScreen()+x, self:getYOnScreen()+y, w, h)
		gui._elementScissorIsSet = true
	end

	if not ignoreScrollables then
		local parent = self._parent
		while parent do

			if not parent then break end

			if parent:hasScrollbars() then
				local parentX, parentY = parent:getPositionOnScreen()

				if not gui._elementScissorIsSet then
					setScissor(gui, parentX, parentY, parent:getChildAreaDimensions())
					gui._elementScissorIsSet = true
				else
					intersectScissor(self._gui, parentX, parentY, parent:getChildAreaDimensions())
				end

			end

			parent = parent._parent
		end
	end

end

-- Remove scissor set by setScissor().
-- Helper function for themes' drawing functions.
-- unsetScissor( )
function Cs.element:unsetScissor()
	local gui = self._gui
	if gui._elementScissorIsSet then
		setScissor(gui, nil)
		gui._elementScissorIsSet = false
	end
end



-- menuElement = showMenu( items, [ highlightedIndex,   ] [ offsetX=0, offsetY=0, ] callback )
-- menuElement = showMenu( items, [ highlightedIndices, ] [ offsetX=0, offsetY=0, ] callback )
-- items = { itemText... }
-- items = { { itemText, itemExtraText }... }
-- callback = function( index, itemText )
--    index will be 0 if no item was chosen.
function Cs.element:showMenu(items, hlIndices, offsetX, offsetY, cb)
	assertarg(1, items, 'table')

	-- showMenu( items, highlightedIndex,   offsetX, offsetY, callback )
	-- showMenu( items, highlightedIndices, offsetX, offsetY, callback )
	if (type(hlIndices) == 'number' or type(hlIndices) == 'table') and type(offsetX) == 'number' and type(offsetY) == 'number' then
		-- void

	-- showMenu( items, offsetX, offsetY, callback )
	elseif (type(hlIndices) == 'number' or type(hlIndices) == 'table') and type(offsetX) == 'number' then
		hlIndices, offsetX, offsetY, cb = nil, hlIndices, offsetX, offsetY

	-- showMenu( items, highlightedIndex,   callback )
	-- showMenu( items, highlightedIndices, callback )
	elseif type(hlIndices) == 'number' or type(hlIndices) == 'table' then
		offsetX, offsetY, cb = 0, 0, offsetX

	-- showMenu( items, callback )
	else
		hlIndices, offsetX, offsetY, cb = nil, 0, 0, hlIndices

	end
	if type(cb) ~= 'function' then
		error('Missing callback argument.', 2)
	end

	if type(hlIndices) == 'number' then
		hlIndices = {hlIndices}
	end


	local gui = self._gui
	local root = self:getRoot()

	updateLayoutIfNeeded(gui) -- So we get the correct self size and position here below.

	-- Create menu.

	local menu = root:insert{
		type='container', style='_MENU', expandX=true, expandY=true,
		closable=true, captureGuiInput=true, confineNavigation=true,
		[1] = {type='vbar', minWidth=self._layoutWidth, maxHeight=root._height},
	}

	menu:on('closed', function(button, event)
		local _cb = cb
		cb = nil

		menu:remove()

		if _cb then _cb(0, '') end
	end)

	menu:on('mousepressed', function(button, event, x, y, buttonN)
		menu:close()
	end)

	-- Add menu items.
	local buttons = menu[1]
	for i, text in ipairs(items) do

		local text2 = nil
		if type(text) == 'table' then text, text2 = unpack(text) end

		local isToggled = (indexOf(hlIndices, i) ~= nil)
		local button = buttons:insert{ type='button', text=text, text2=text2, align='left', toggled=isToggled }

		button:on('mousepressed', function(button, event, x, y, buttonN)
			if buttonN == 1 then button:press() end
			return true -- Prevent the menu from receiving the mousepressed event.
		end)

		button:on('press', function(button, event)
			local _cb = cb
			cb = nil

			menu:remove()

			if _cb then _cb(i, text) end
		end)

		button:on('navigated', function(button, event)
			buttons:setToggledChild(button._id)
		end)

	end

	local searchTerm       = ''
	local searchStartIndex = 1
	local lastInputTime    = -99

	if gui._standardKeysAreActive then
		menu:on('keypressed', function(button, event, key, scancode, isRepeat)

			if key == 'up' then
				local button     = buttons:getToggledChild()
				searchStartIndex = button and (button:getIndex()-2)%#buttons+1 or 1
				lastInputTime    = -99
				gui:navigateTo(buttons[searchStartIndex])
				return true

			elseif key == 'down' then
				local button     = buttons:getToggledChild()
				searchStartIndex = button and button:getIndex()%#buttons+1 or 1
				lastInputTime    = -99
				gui:navigateTo(buttons[searchStartIndex])
				return true

			elseif key == 'home' or key == 'pageup' then
				searchStartIndex = 1
				lastInputTime    = -99
				gui:navigateTo(buttons[searchStartIndex])
				return true

			elseif key == 'end' or key == 'pagedown' then
				searchStartIndex = #buttons
				lastInputTime    = -99
				gui:navigateTo(buttons[searchStartIndex])
				return true

			elseif key == 'return' or key == 'kpenter' then
				local button = buttons:getToggledChild()
				if button then button:press() end
				return true

			end
		end)
	end

	menu:on('textinput', function(button, event, text)

		-- Append to old or start a new term.
		local time = gui._time
		if time-lastInputTime > 1.00 then
			searchTerm = text:lower()
			local button = buttons:getToggledChild()
			searchStartIndex = button and button:getIndex() or 1

		else
			searchTerm = searchTerm..text:lower()
		end
		lastInputTime = time

		-- Pressing the same letter over and over should just cycle through all items starting with that letter.
		if #searchTerm > 1 then
			local firstChar = searchTerm:match('^'..require'utf8'.charpattern)
			local reps = #searchTerm/#firstChar

			if reps == math.floor(reps) and searchTerm == firstChar:rep(reps) then
				local i = searchStartIndex

				while true do
					i = i%#buttons+1
					local button = buttons[i]

					if button._text:lower():find(firstChar, 1, true) == 1 then
						reps = reps-1
						if reps <= 0 then
							gui:navigateTo(button)
							return
						end
					end
				end

			end
		end

		-- Otherwise search for the whole term.
		for i = 1, #buttons do
			i = (searchStartIndex+i-1)%#buttons+1
			local button = buttons[i]

			if button._text:lower():find(searchTerm, 1, true) == 1 then
				gui:navigateTo(button)
				break
			end
		end

	end)

	-- Set position.

	menu:_updateLayoutSize() -- Expanding and positioning of the whole menu isn't necessary right here.

	buttons:setPosition(
		math.max(math.min(self:getXOnScreen()+offsetX, root._width -buttons._layoutWidth),  0),
		math.max(math.min(self:getYOnScreen()+offsetY, root._height-buttons._layoutHeight), 0)
	)

	local button = buttons:getToggledChild()
	if button then gui:navigateTo(button) end

	return menu
end



-- Force a layout update (should never be needed as it's done automatically)
-- FINAL
-- updateLayout( )
function Cs.element:updateLayout()
	return updateLayout(self)
end

-- _updateLayoutSize( )
function Cs.element:_updateLayoutSize()
	-- void (subclasses should replace this method)
end

-- _expandLayout( [ expandWidth, expandHeight ] )
function Cs.element:_expandLayout(expandW, expandH)
	if expandW then
		self._layoutWidth = expandW
		self._layoutInnerWidth = self._layoutWidth
	end
	if expandH then
		self._layoutHeight = expandH
		self._layoutInnerHeight = self._layoutHeight
	end
end

-- _updateLayoutPosition( )
function Cs.element:_updateLayoutPosition()
	-- void (position is always set by the parent container)
end



--==============================================================
--= Container ==================================================
--==============================================================



Cs.container = Cs.element:extend('GuiContainer', {

	SCROLL_SMOOTHNESS = 0.65,
	SCROLL_SPEED_X = 30, SCROLL_SPEED_Y = 50,

	_mouseScrollDirection = nil, _mouseScrollOffset = 0,
	_scrollX = 0.0, _scrollY = 0.0,
	_visualScrollX = 0.0, _visualScrollY = 0.0,

	_confineNavigation = false,
	_expandX = false, _expandY = false,
	_maxWidth = nil, _maxHeight = nil,
	_padding = 0,
	_solid = false,

})
registerEvents(Cs.container, {
})

function Cs.container:init(gui, data, parent)
	Cs.container.super.init(self, gui, data, parent)

	retrieve(self, data, '_confineNavigation')
	retrieve(self, data, '_expandX', '_expandY')
	retrieve(self, data, '_maxWidth', '_maxHeight')
	retrieve(self, data, '_padding')
	retrieve(self, data, '_solid')

	for i, childData in ipairs(data) do
		local C = Cs[getTypeFromData(childData)]
			or errorf('bad gui type %q', getTypeFromData(childData))
		self[i] = C(gui, childData, self)
	end

end



-- OVERRIDE  _update( deltaTime )
function Cs.container:_update(dt)
	Cs.container.super._update(self, dt)

	for _, child in ipairs(self) do
		child:_update(dt)
	end

	local scrollX = self._scrollX
	local scrollY = self._scrollY

	local visualScrollX = self._visualScrollX
	local visualScrollY = self._visualScrollY

	local didScroll = false

	if visualScrollX ~= scrollX then

		visualScrollX = scrollX+self.SCROLL_SMOOTHNESS*(visualScrollX-scrollX)
		if math.abs(visualScrollX-scrollX) < 0.5 then
			visualScrollX = scrollX
		end

		didScroll = true

	end

	if visualScrollY ~= scrollY then

		visualScrollY = scrollY+self.SCROLL_SMOOTHNESS*(visualScrollY-scrollY)
		if math.abs(visualScrollY-scrollY) < 0.5 then
			visualScrollY = scrollY
		end

		didScroll = true

	end

	if didScroll then
		setVisualScroll(self, visualScrollX, visualScrollY)
	end

end



-- REPLACE  _draw( )
function Cs.container:_draw()
	if self._hidden then  return  end

	local gui = self._gui
	local x, y, w, h = xywh(self)

	local maxW, maxH = self._maxWidth, self._maxHeight
	local childAreaW, childAreaH = self:getChildAreaDimensions()

	local sbW = themeGet(gui, 'scrollbarWidth')
	local sbMinW = themeGet(gui, 'scrollbarMinLength')

	if not self._gui.debug then
		triggerIncludingAnimations(self, 'beforedraw', x, y, w, h)
	end

	drawLayoutBackground(self)
	self:_drawDebug(0, 0, 255)

	if maxW or maxH then  setScissor(gui, x, y, childAreaW, childAreaH)  end
	for _, child in ipairs(self) do
		child:_draw()
	end
	if maxW or maxH then  setScissor(gui, nil)  end

	if not self._gui.debug then

		-- Horizontal scrollbar.
		if maxW then
			local handlePos, handleLen = self:getScrollHandleX()
			themeRenderArea(self, 'scrollbar', 0, h-sbW, childAreaW, sbW, 'x', round(handlePos), handleLen)
		end

		-- Vertical scrollbar.
		if maxH then
			local handlePos, handleLen = self:getScrollHandleY()
			themeRenderArea(self, 'scrollbar', w-sbW, 0, sbW, childAreaH, 'y', round(handlePos), handleLen)
		end

		if maxW and maxH then
			themeRenderArea(self, 'scrollbardeadzone', w-sbW, h-sbW, sbW, sbW)
		end

		triggerIncludingAnimations(self, 'afterdraw', x, y, w, h)

	end

end



-- element = find( id )
function Cs.container:find(id)
	for el in self:traverse() do
		if el._id == id then
			return el
		end
	end
	return nil
end

-- elements = findAll( id )
function Cs.container:findAll(id)
	local els = {}
	for el in self:traverse() do
		if el._id == id then
			table.insert(els, el)
		end
	end
	return els
end

-- elements = findType( elementType )
function Cs.container:findType(elType)
	local C = requireElementClass(elType)

	for el in self:traverse() do
		if el:is(C) then return el end
	end

	return nil
end

-- widget = findActive( )
function Cs.container:findActive()
	for el in self:traverse() do
		if (el:is(Cs.widget) and el._active) then
			return el
		end
	end
	return nil
end

-- button = findToggled( )
function Cs.container:findToggled()
	for el in self:traverse() do
		if (el:is(Cs.button) and el._toggled) then
			return el
		end
	end
	return nil
end

-- Match an element using a CSS-like selector.
-- element = match( selector [, includeSelf=false ] )
-- selector = "elementtype #id .tag"
-- Note: Element types include subtypes (e.g. 'bar' includes both 'vbar' and 'hbar').
function Cs.container:match(selector, includeSelf)

	local selPath = parseSelector(selector)
	if not selPath then  return nil  end

	local breakElement = (not includeSelf and self or self._parent)
	if (includeSelf and isElementMatchingSelectorPath(self, selPath, breakElement)) then
		return self
	end
	for el in self:traverse() do
		if isElementMatchingSelectorPath(el, selPath, breakElement) then
			return el
		end
	end

	return nil
end

-- Match elements using a CSS-like selector.
-- elements = matchAll( selector [, includeSelf=false ] )
-- selector = "elementtype #id .tag"
-- Note: Element types include subtypes (e.g. 'bar' includes both 'vbar' and 'hbar').
function Cs.container:matchAll(selector, includeSelf)

	local elements = {}
	local selPath = parseSelector(selector)

	if selPath then
		local breakElement = (not includeSelf and self or self._parent)
		if (includeSelf and isElementMatchingSelectorPath(self, selPath, breakElement)) then
			table.insert(elements, self)
		end
		for el in self:traverse() do
			if isElementMatchingSelectorPath(el, selPath, breakElement) then
				table.insert(elements, el)
			end
		end
	end

	return elements
end



-- spaceX, spaceY = getInnerSpace( )
function Cs.container:getInnerSpace()
	local spaceX = 2*self._padding
	local spaceY = spaceX
	local sbW = themeGet(self._gui, 'scrollbarWidth')
	if self:hasScrollbarOnRight()  then spaceX = spaceX+sbW end
	if self:hasScrollbarOnBottom() then spaceY = spaceY+sbW end
	return spaceX, spaceY
end

-- spaceX = getInnerSpaceX( )
function Cs.container:getInnerSpaceX()
	local spaceX = 2*self._padding
	if self:hasScrollbarOnRight() then
		spaceX = spaceX+themeGet(self._gui, 'scrollbarWidth')
	end
	return spaceX
end

-- spaceY = getInnerSpaceY( )
function Cs.container:getInnerSpaceY()
	local spaceY = 2*self._padding
	if self:hasScrollbarOnBottom() then
		spaceY = spaceY+themeGet(self._gui, 'scrollbarWidth')
	end
	return spaceY
end



-- getMaxWidth
Cs.container:defget'_maxWidth'

-- setMaxWidth( width )
-- width: nil removes restriction
function Cs.container:setMaxWidth(w)
	w = (w and math.max(w, 0) or nil)
	if self._maxWidth == w then
		return
	end
	self._maxWidth = w
	scheduleLayoutUpdateIfDisplayed(self)
end

-- getMaxHeight
Cs.container:defget'_maxHeight'

-- setMaxHeight( height )
-- height: nil removes restriction
function Cs.container:setMaxHeight(h)
	h = (h and math.max(h, 0) or nil)
	if self._maxHeight == h then
		return
	end
	self._maxHeight = h
	scheduleLayoutUpdateIfDisplayed(self)
end



-- getPadding
Cs.container:defget'_padding'

-- setPadding( padding )
function Cs.container:setPadding(padding)
	if self._padding == padding then
		return
	end
	self._padding = padding
	scheduleLayoutUpdateIfDisplayed(self)
end



-- x, y = getScroll( )
function Cs.container:getScroll()
	return self._scrollX, self._scrollY
end

-- getScrollX
Cs.container:defget'_scrollX'

-- getScrollY
Cs.container:defget'_scrollY'

-- scrollChanged = setScroll( x, y [, immediate=false ] )
function Cs.container:setScroll(scrollX, scrollY, immediate)
	assertarg(1, scrollX, 'number')
	assertarg(2, scrollY, 'number')

	updateLayoutIfNeeded(self._gui)

	-- Limit scrolling
	local limitX, limitY = self:getScrollLimit()
	scrollX = math.min(math.max(scrollX, limitX), 0)
	scrollY = math.min(math.max(scrollY, limitY), 0)
	local dx, dy = scrollX-self._scrollX, scrollY-self._scrollY
	if dx == 0 and dy == 0 then return false end

	self._scrollX, self._scrollY = scrollX, scrollY

	for el in self:traverse() do
		el._layoutImmediateOffsetX = el._layoutImmediateOffsetX+dx
		el._layoutImmediateOffsetY = el._layoutImmediateOffsetY+dy
	end

	if immediate then setVisualScroll(self, scrollX, scrollY) end

	if self:isDisplayed() then
		self:playSound('scroll') -- @Robustness: May have to add more limitations to whether "scroll" sound plays or not.
		updateHoveredElement(self._gui)
	end

	return true
end

-- scrollChanged = setScrollX( x [, immediate=false ] )
function Cs.container:setScrollX(scrollX, immediate)
	return self:setScroll(scrollX, self._scrollY, immediate)
end

-- scrollChanged = setScrollY( y [, immediate=false ] )
function Cs.container:setScrollY(scrollY, immediate)
	return self:setScroll(self._scrollX, scrollY, immediate)
end

-- scrollChanged = scroll( deltaX, deltaY [, immediate=false ] )
function Cs.container:scroll(dx, dy, immediate)
	return self:setScroll(self._scrollX+dx, self._scrollY+dy, immediate)
end

-- scrollChanged = updateScroll( [, immediate=false ] )
-- @Incomplete: Update scroll automatically when elements change size etc.
function Cs.container:updateScroll(immediate)
	return self:scroll(0, 0, immediate)
end



do
	local function getScrollHandle(self, childAreaSize, innerSize, scroll)
		local insideSize = (childAreaSize-2*self._padding)

		local handleLen = math.max(
			round(childAreaSize*insideSize/innerSize),
			themeGet(self._gui, 'scrollbarMinLength'))

		local handlePos, handleMaxPos = 0, 0
		if innerSize > insideSize then
			handleMaxPos = childAreaSize-handleLen
			handlePos = -scroll*handleMaxPos/(innerSize-insideSize)
		end

		return handlePos, handleLen, handleMaxPos
	end

	-- position, length, maxPosition = getScrollHandleX( )
	-- Units are in pixels.
	function Cs.container:getScrollHandleX()
		updateLayoutIfNeeded(self._gui)
		return getScrollHandle(self, self:getChildAreaWidth(), self._layoutInnerWidth, self._scrollX)
	end

	-- position, length, maxPosition = getScrollHandleY( )
	-- Units are in pixels.
	function Cs.container:getScrollHandleY()
		updateLayoutIfNeeded(self._gui)
		return getScrollHandle(self, self:getChildAreaHeight(), self._layoutInnerHeight, self._scrollY)
	end

end



-- x, y = getScrollLimit( )
function Cs.container:getScrollLimit()
	local childAreaW, childAreaH = self:getChildAreaDimensions()
	return
		childAreaW-2*self._padding-self._layoutInnerWidth,
		childAreaH-2*self._padding-self._layoutInnerHeight
end

-- x = getScrollLimitX( )
function Cs.container:getScrollLimitX()
	local childAreaW = self:getChildAreaWidth()
	return childAreaW-2*self._padding-self._layoutInnerWidth
end

-- y = getScrollLimitY( )
function Cs.container:getScrollLimitY()
	local childAreaH = self:getChildAreaHeight()
	return childAreaH-2*self._padding-self._layoutInnerHeight
end



-- child = getVisibleChild( [ number=1 ] )
function Cs.container:getVisibleChild(n)
	n = (n or 1)
	for _, child in ipairs(self) do
		if not child._hidden then
			n = n-1
			if n == 0 then
				return child
			end
		end
	end
	return nil
end

-- number = getVisibleChildNumber( child )
function Cs.container:getVisibleChildNumber(el)
	local n = 0
	for _, child in ipairs(self) do
		if not child._hidden then
			n = n+1
			if child == el then
				return n
			end
		end
	end
	return nil
end

-- count = getVisibleChildCount( )
function Cs.container:getVisibleChildCount()
	local count = 0
	for _, child in ipairs(self) do
		if not child._hidden then
			count = count+1
		end
	end
	return count
end

-- visibleChild = setVisibleChild( id )
function Cs.container:setVisibleChild(id)
	local visibleChild = nil
	for _, child in ipairs(self) do
		if child._id == id then
			child:show()
			visibleChild = child
		else
			child:hide()
		end
	end
	return visibleChild -- if multiple children matched then the last match is returned
end



-- x, y = getVisualScroll( )
function Cs.container:getVisualScroll()
	return self._visualScrollX, self._visualScrollY
end

-- getVisualScrollX
Cs.container:defget'_visualScrollX'

-- getVisualScrollY
Cs.container:defget'_visualScrollY'



-- state = hasScrollbars( )
function Cs.container:hasScrollbars()
	return (self:hasScrollbarOnRight() or self:hasScrollbarOnBottom())
end

-- state = hasScrollbarOnRight( )
function Cs.container:hasScrollbarOnRight()
	return (self._maxHeight ~= nil)
end

-- state = hasScrollbarOnBottom( )
function Cs.container:hasScrollbarOnBottom()
	return (self._maxWidth ~= nil)
end



-- index = indexOf( element )
Cs.container.indexOf = indexOf



-- REPLACE  state = isSolid( )
function Cs.container:isSolid()
	return (self._solid or self._background ~= nil or self._maxWidth ~= nil or self._maxHeight ~= nil)
end



-- child, index = get( index )
-- child, index = get( id )
-- NOTE: parent:get(index) is the same as parent[index]
function Cs.container:get(iOrId)
	if type(iOrId) == 'string' then
		for i, child in ipairs(self) do
			if child._id == iOrId then
				return child, i
			end
		end
		return nil
	else
		local child = self[iOrId]
		return child, (child and iOrId or nil)
	end
end

-- for index, child in children( )
function Cs.container:children()
	return ipairs(self)
end



-- width, height = getChildAreaDimensions( )
function Cs.container:getChildAreaDimensions()
	updateLayoutIfNeeded(self._gui)
	local sbW = themeGet(self._gui, 'scrollbarWidth')
	return
		(self._maxHeight and self._layoutWidth -sbW or self._layoutWidth),
		(self._maxWidth  and self._layoutHeight-sbW or self._layoutHeight)
end

-- width = getChildAreaWidth( )
function Cs.container:getChildAreaWidth()
	updateLayoutIfNeeded(self._gui)
	return
		self:hasScrollbarOnRight() and self._layoutWidth-themeGet(self._gui, 'scrollbarWidth')
		or self._layoutWidth
end

-- height = getChildAreaHeight( )
function Cs.container:getChildAreaHeight()
	updateLayoutIfNeeded(self._gui)
	return
		self:hasScrollbarOnBottom() and self._layoutHeight-themeGet(self._gui, 'scrollbarWidth')
		or self._layoutHeight
end



-- child = getChildWithData( dataKey, dataValue )
function Cs.container:getChildWithData(k, v)
	for _, child in ipairs(self) do
		if child._data[k] == v then
			return child
		end
	end
	return nil
end



-- element = getElementAt( x, y [, includeNonSolid=false ] )
function Cs.container:getElementAt(x, y, nonSolid)
	updateLayoutIfNeeded(self._gui)
	if (self._maxWidth) and (x < self._layoutX or x >= self._layoutX+self._layoutWidth) then
		return nil
	end
	if (self._maxHeight) and (y < self._layoutY or y >= self._layoutY+self._layoutHeight) then
		return nil
	end
	for el in self:traverseVisible(x, y) do
		if ((nonSolid or el:isSolid()) and el:isAt(x, y)) or (el._captureInput or el._captureGuiInput) then
			return el
		end
	end
	return nil
end



-- child = insert( data [, index=atEnd ] )
function Cs.container:insert(childData, i)
	assertarg(1, childData, 'table')
	assertarg(2, i, 'number','nil')

	local C = Cs[getTypeFromData(childData)]
		or errorf('Bad element type %q.', getTypeFromData(childData))

	local child = C(self._gui, childData, self)
	table.insert(self, (i or #self+1), child)

	scheduleLayoutUpdateIfDisplayed(child)

	local themeInit = themeGet(self._gui, 'init')
	themeInit(child)
	if child:is(Cs.container) then
		for el in child:traverse() do
			themeInit(el)
		end
	end

	validateNavigationTarget(self._gui)
	scheduleLayoutUpdateIfDisplayed(child)

	return child
end

-- REPLACE  removeAt( index )
function Cs.container:removeAt(i)
	assertarg(1, i, 'number')

	local child = self[i]
	if not child then
		printerror(2, 'Child index %d is out of bounds.', i)
		return
	end

	if child:is(Cs.container) then
		child:empty()
	end

	-- Note: The child still keeps the reference to the GUI.
	child._parent = nil
	table.remove(self, i)

	validateNavigationTarget(self._gui)
	scheduleLayoutUpdateIfDisplayed(self)
end

-- empty( )
function Cs.container:empty()
	for i = #self, 1, -1 do
		self:removeAt(i)
	end
end



-- REPLACE  handled, grabFocus = _mousepressed( x, y, button )
function Cs.container:_mousepressed(x, y, buttonN)

	if buttonN == 1 then

		local x0, y0 = self:getPositionOnScreen()
		local childAreaW, childAreaH = self:getChildAreaDimensions()

		local sbW = themeGet(self._gui, 'scrollbarWidth')

		-- Horizontal scrolling.
		----------------------------------------------------------------

		local x2, y2 = x0+childAreaW, y0+self._layoutHeight
		local x1, y1 = x0, y2-sbW
		if x >= x1 and x < x2 and y >= y1 and y < y2 then
			local handlePos, handleLen, handleMaxPos = self:getScrollHandleX()

			self._mouseScrollDirection = 'x'

			-- Drag handle.
			if (x >= x1+handlePos and x < x1+handlePos+handleLen) then
				self._mouseScrollOffset = x-x1-handlePos

			-- Jump and drag.
			else
				self._mouseScrollOffset = handleLen/2
				self:_mousemoved(x, y)
			end

			return true, true
		end

		-- Vertical scrolling.
		----------------------------------------------------------------

		local x2, y2 = x0+self._layoutWidth, y0+childAreaH
		local x1, y1 = x2-sbW, y0
		if x >= x1 and x < x2 and y >= y1 and y < y2 then
			local handlePos, handleLen, handleMaxPos = self:getScrollHandleY()

			self._mouseScrollDirection = 'y'

			-- Drag handle.
			if (y >= y1+handlePos and y < y1+handlePos+handleLen) then
				self._mouseScrollOffset = y-y1-handlePos

			-- Jump and drag.
			else
				self._mouseScrollOffset = handleLen/2
				self:_mousemoved(x, y)
			end

			return true, true
		end

		----------------------------------------------------------------

	end

	return false, false
end

-- REPLACE  _mousemoved( x, y )
function Cs.container:_mousemoved(x, y)

	-- Horizontal scrolling.
	if self._mouseScrollDirection == 'x' then
		local handleMaxPos = select(3, self:getScrollHandleX())
		self:setScrollX(
			(x-self:getXOnScreen()-self._mouseScrollOffset)
			*self:getScrollLimitX()/handleMaxPos, true
		)

	-- Vertical scrolling.
	elseif self._mouseScrollDirection == 'y' then
		local handleMaxPos = select(3, self:getScrollHandleY())
		self:setScrollY(
			(y-self:getYOnScreen()-self._mouseScrollOffset)
			*self:getScrollLimitY()/handleMaxPos, true
		)

	end
end

-- REPLACE  _mousereleased( x, y, button )
function Cs.container:_mousereleased(x, y, buttonN)
	if buttonN == 1 then
		self._mouseScrollDirection = nil
		self._mouseScrollOffset = 0
	end
end

-- REPLACE  handled = _wheelmoved( deltaX, deltaY )
function Cs.container:_wheelmoved(dx, dy)
	if (dx ~= 0 and self._maxWidth) or (dy ~= 0 and self._maxHeight) then
		local gui = self._gui
		local scrolled = self:scroll(
			gui._scrollSpeedX*self.SCROLL_SPEED_X*dx,
			gui._scrollSpeedY*self.SCROLL_SPEED_Y*dy
		)
		if scrolled then return true end
	end
	return false
end



-- OVERRIDE  remove( )
function Cs.container:remove(_removeAt_i)
	if _removeAt_i ~= nil then
		print('WARNING: container:remove() called with an argument. Did you mean to call container:removeAt(index)?')
	end
	return Cs.container.super.remove(self)
end



-- OVERRIDE  reprocessTexts( )
function Cs.container:reprocessTexts()
	Cs.container.super.reprocessTexts(self)
	for _, child in ipairs(self) do
		child:reprocessTexts()
	end
end



-- setChildrenActive( state )
function Cs.container:setChildrenActive(state)
	for _, child in ipairs(self) do
		if child:is(Cs.widget) then
			child:setActive(state)
		end
	end
end



-- setChildrenHidden( state )
function Cs.container:setChildrenHidden(state)
	for _, child in ipairs(self) do
		child:setHidden(state)
	end
end



-- widget = getToggledChild( [ includeGrandchildren=false ] )
function Cs.container:getToggledChild(deep)
	if deep then
		for button in self:traverseType'button' do
			if button:isToggled() then  return button  end
		end
	else
		for _, child in ipairs(self) do
			if child:is(Cs.button) and child:isToggled() then  return child  end
		end
	end
	return nil
end

-- widget = setToggledChild( id [, includeGrandchildren=false ] )
function Cs.container:setToggledChild(id, deep)
	local toggledChild = nil
	if deep then
		for button in self:traverseType'button' do
			if button._id == id then
				button:setToggled(true)
				toggledChild = button
			else
				button:setToggled(false)
			end
		end
	else
		for _, child in ipairs(self) do
			if child:is(Cs.button) then
				if child._id == id then
					child:setToggled(true)
					toggledChild = child
				else
					child:setToggled(false)
				end
			end
		end
	end
	return toggledChild -- if multiple children matched then the last match is returned
end



-- sort( sortFunction )
function Cs.container:sort(f)
	assertarg(1, f, 'function')
	table.sort(self, f)
	scheduleLayoutUpdateIfDisplayed(self)
end



-- for element in traverse( ) do
do
	local function traverseChildren(el)
		for _, child in ipairs(el) do
			coroutine.yield(child)
			if child:is(Cs.container) then
				traverseChildren(child)
			end
		end
	end
	function Cs.container:traverse()
		return newIteratorCoroutine(traverseChildren, self)
	end
end

-- for element in traverseType( elementType ) do
do
	local function traverseChildrenOfType(el, C)
		for _, child in ipairs(el) do
			if child:is(C) then
				coroutine.yield(child)
			end
			if child:is(Cs.container) then
				traverseChildrenOfType(child, C)
			end
		end
	end
	function Cs.container:traverseType(elType)
		local C = requireElementClass(elType)
		return newIteratorCoroutine(traverseChildrenOfType, self, C)
	end
end

-- for element in traverseVisible( [ x, y ] ) do
do
	local function traverseVisibleChildren(el)
		for i = #el, 1, -1 do
			local child = el[i]
			if not child._hidden then

				if child:is(Cs.container) then
					traverseVisibleChildren(child)
				end

				coroutine.yield(child)

			end
		end
	end

	local function traverseVisibleChildrenUnderCoords(el, x, y, sbW)
		for i = #el, 1, -1 do
			local child = el[i]
			if not child._hidden then

				local isContainer = child:is(Cs.container)
				local includeSelf, includeChildren = true, isContainer

				if isContainer then

					local x1, y1 = child:getPositionOnScreen()
					local x2, y2 = x1+child._layoutWidth, y1+child._layoutHeight

					local maxW = child._maxWidth
					local maxH = child._maxHeight

					if (maxW) and (x < x1 or x >= x2-(maxH and sbW or 0)) then
						includeChildren = false
						includeSelf = (x < x2)
					elseif (maxH) and (y < y1 or y >= y2-(maxW and sbW or 0)) then
						includeChildren = false
						includeSelf = (y < y2)
					end

				end

				if includeSelf then
					if includeChildren then
						traverseVisibleChildrenUnderCoords(child, x, y, sbW)
					end
					coroutine.yield(child)
				end

			end
		end
	end

	function Cs.container:traverseVisible(x, y)
		if x and y then
			local sbW = themeGet(self._gui, 'scrollbarWidth')
			return newIteratorCoroutine(traverseVisibleChildrenUnderCoords, self, x, y, sbW)
		end
		return newIteratorCoroutine(traverseVisibleChildren, self)
	end

end



-- REPLACE  _updateLayoutSize( )
function Cs.container:_updateLayoutSize()

	updateContainerChildLayoutSizes(self)

	local maxX, maxY = 0, 0
	for _, child in ipairs(self) do
		if not (child._hidden or child._floating) then

			-- Note: We don't consider the anchor as we only care about the size here.
			-- We do treat the position offset as part of the size (added to the top left of the child).
			-- (Maybe the reasoning is flawed somewhere here but it seems to work.)
			maxX = math.max(maxX, child._x+child._layoutWidth)
			maxY = math.max(maxY, child._y+child._layoutHeight)

		end
	end

	self._layoutInnerWidth  = (self._width  and self._width -self:getInnerSpaceX() or maxX)
	self._layoutInnerHeight = (self._height and self._height-self:getInnerSpaceY() or maxY)

	updateContainerLayoutSize(self)

end

-- REPLACE  _expandLayout( )
function Cs.container:_expandLayout(expandW, expandH)

	expandContainer(self, expandW, expandH)

	for _, child in ipairs(self) do
		if not child._hidden then
			child:_expandLayout(nil, nil)
		end
	end

end

-- REPLACE  _updateLayoutPosition( )
function Cs.container:_updateLayoutPosition()
	for _, child in ipairs(self) do
		if not child._hidden then
			updateFloatingElementPosition(child) -- All children counts as floating in plain containers.
		end
	end
end



--==============================================================
--= Bar ========================================================
--==============================================================



Cs.bar = Cs.container:extend('GuiBar', {
	_expandChildren = true,
	_homogeneous = false,
})
registerEvents(Cs.bar, {
})

function Cs.bar:init(gui, data, parent)
	Cs.bar.super.init(self, gui, data, parent)

	retrieve(self, data, '_expandChildren')
	retrieve(self, data, '_homogeneous')

end



--==============================================================
--= Hbar =======================================================
--==============================================================



Cs.hbar = Cs.bar:extend('GuiHorizontalBar', {
})
registerEvents(Cs.hbar, {
})

-- function Cs.hbar:init(gui, data, parent)
-- 	Cs.hbar.super.init(self, gui, data, parent)
-- end



-- REPLACE  _updateLayoutSize( )
function Cs.hbar:_updateLayoutSize()

	updateContainerChildLayoutSizes(self)

	local staticW, dynamicW, highestW, highestDynamicW, expandablesX, currentSx, sumSx,
	      staticH, dynamicH, highestH, highestDynamicH, expandablesY, currentSy, sumSy
	      = getContainerLayoutSizeValues(self)

	local innerW = (self._homogeneous and highestDynamicW*expandablesX or dynamicW)+staticW+sumSx

	innerW   = math.max(innerW,   self._minWidth -self:getInnerSpaceX())
	highestH = math.max(highestH, self._minHeight-self:getInnerSpaceY())

	self._layoutInnerWidth  = (self._width  and self._width -self:getInnerSpaceX() or innerW)
	self._layoutInnerHeight = (self._height and self._height-self:getInnerSpaceY() or highestH)

	self._layoutInnerStaticWidth, self._layoutInnerStaticHeight = staticW, 0
	self._layoutInnerSpacingsX,   self._layoutInnerSpacingsY    = sumSx, 0
	self._layoutExpandablesX,     self._layoutExpandablesY      = expandablesX, expandablesY

	updateContainerLayoutSize(self)

end

-- REPLACE  _expandLayout( [ expandWidth, expandHeight ] )
function Cs.hbar:_expandLayout(expandW, expandH)

	-- Expand self
	expandContainer(self, expandW, expandH)

	-- Calculate amount of space for children to expand into (total or extra, whether homogeneous or not)
	local totalSpaceX = 0
	if expandW then
		totalSpaceX = self._layoutInnerWidth-self._layoutInnerSpacingsX
		if self._homogeneous then
			totalSpaceX = totalSpaceX-self._layoutInnerStaticWidth
		else
			for _, child in ipairs(self) do
				if not (child._hidden or child._floating) then
					totalSpaceX = totalSpaceX-child._layoutWidth
				end
			end
		end
	end

	-- Expand children
	local expandablesX = self._layoutExpandablesX
	for _, child in ipairs(self) do
		if not child._hidden then
			if child._floating then
				child:_expandLayout(nil, nil)
			else
				if not child._width then
					if expandW then
						local spaceX = round(totalSpaceX/expandablesX)
						totalSpaceX = totalSpaceX-spaceX
						expandW = (self._homogeneous and 0 or child._layoutWidth)+spaceX
					end
					expandablesX = expandablesX-1
				end
				child:_expandLayout(
					(not child._width and expandW or nil),
					(self._expandChildren and self._layoutInnerHeight or nil)
				)
			end
		end
	end
	assert(expandablesX == 0, expandablesX)

end

-- REPLACE  _updateLayoutPosition( )
function Cs.hbar:_updateLayoutPosition()
	local x, y, m, first = self._layoutX+self._padding, self._layoutY+self._padding, 0, true
	for _, child in ipairs(self) do
		if not child._hidden then
			if child._floating then
				updateFloatingElementPosition(child)
			else
				if not first then
					m = math.max(m, child._spacingLeft or child._spacingHorizontal or child._spacing)
					x = x+m
				end
				child._layoutX, child._layoutY = x, y
				child:_updateLayoutPosition()
				x = x+child._layoutWidth
				m = (child._spacingRight or child._spacingHorizontal or child._spacing)
				first = false
			end
		end
	end
end



--==============================================================
--= Vbar =======================================================
--==============================================================



Cs.vbar = Cs.bar:extend('GuiVerticalBar', {
})
registerEvents(Cs.vbar, {
})

-- function Cs.vbar:init(gui, data, parent)
-- 	Cs.vbar.super.init(self, gui, data, parent)
-- end

-- REPLACE  _updateLayoutSize( )
function Cs.vbar:_updateLayoutSize()

	updateContainerChildLayoutSizes(self)

	local staticW, dynamicW, highestW, highestDynamicW, expandablesX, currentSx, sumSx,
	      staticH, dynamicH, highestH, highestDynamicH, expandablesY, currentSy, sumSy
	      = getContainerLayoutSizeValues(self)

	local innerH = (self._homogeneous and highestDynamicH*expandablesY or dynamicH)+staticH+sumSy

	highestW = math.max(highestW, self._minWidth -self:getInnerSpaceX())
	innerH   = math.max(innerH,   self._minHeight-self:getInnerSpaceY())

	self._layoutInnerWidth  = (self._width  and self._width -self:getInnerSpaceX() or highestW)
	self._layoutInnerHeight = (self._height and self._height-self:getInnerSpaceY() or innerH)

	self._layoutInnerStaticWidth, self._layoutInnerStaticHeight = 0, staticH
	self._layoutInnerSpacingsX,   self._layoutInnerSpacingsY    = 0, sumSy
	self._layoutExpandablesX,     self._layoutExpandablesY      = expandablesX, expandablesY

	updateContainerLayoutSize(self)

end

-- REPLACE  _expandLayout( [ expandWidth, expandHeight ] )
function Cs.vbar:_expandLayout(expandW, expandH)

	-- Expand self
	expandContainer(self, expandW, expandH)

	-- Calculate amount of space for children to expand into (total or extra, whether homogeneous or not)
	local totalSpaceY = 0
	if expandH then
		totalSpaceY = self._layoutInnerHeight-self._layoutInnerSpacingsY
		if self._homogeneous then
			totalSpaceY = totalSpaceY-self._layoutInnerStaticHeight
		else
			for _, child in ipairs(self) do
				if not (child._hidden or child._floating) then
					totalSpaceY = totalSpaceY-child._layoutHeight
				end
			end
		end
	end

	-- Expand children
	local expandablesY = self._layoutExpandablesY
	for _, child in ipairs(self) do
		if not child._hidden then
			if child._floating then
				child:_expandLayout(nil, nil)
			else
				if not child._height then
					if expandH then
						local spaceY = round(totalSpaceY/expandablesY)
						totalSpaceY = totalSpaceY-spaceY
						expandH = (self._homogeneous and 0 or child._layoutHeight)+spaceY
					end
					expandablesY = expandablesY-1
				end
				child:_expandLayout(
					(self._expandChildren and self._layoutInnerWidth or nil),
					(not child._height and expandH or nil)
				)
			end
		end
	end
	assert(expandablesY == 0, expandablesY)

end

-- REPLACE  _updateLayoutPosition( )
function Cs.vbar:_updateLayoutPosition()
	local x, y, m, first = self._layoutX+self._padding, self._layoutY+self._padding, 0, true
	for _, child in ipairs(self) do
		if not child._hidden then
			if child._floating then
				updateFloatingElementPosition(child)
			else
				if not first then
					m = math.max(m, child._spacingTop or child._spacingVertical or child._spacing)
					y = y+m
				end
				child._layoutX, child._layoutY = x, y
				child:_updateLayoutPosition()
				y = y+child._layoutHeight
				m = (child._spacingBottom or child._spacingVertical or child._spacing)
				first = false
			end
		end
	end
end



--==============================================================
--= Root =======================================================
--==============================================================



Cs.root = Cs.container:extend('GuiRoot', {

	--[[REPLACE]] _width = 0, _height = 0, -- The root always has a fixed size.

})
registerEvents(Cs.root, {
})

-- function Cs.root:init(gui, data, parent)
-- 	Cs.root.super.init(self, gui, data, parent)
-- end



-- REPLACE  _draw( )
function Cs.root:_draw()
	if self._hidden then  return  end

	local x, y, w, h = xywh(self)

	if not self._gui.debug then
		triggerIncludingAnimations(self, 'beforedraw', x, y, w, h)
	end

	drawLayoutBackground(self)
	self:_drawDebug(0, 0, 255, 0)

	for _, child in ipairs(self) do
		child:_draw()
	end

	if not self._gui.debug then
		triggerIncludingAnimations(self, 'afterdraw', x, y, w, h)
	end

end



-- REPLACE  setDimensions( width, height )
function Cs.root:setDimensions(w, h)
	assertarg(1, w, 'number')
	assertarg(2, h, 'number')
	if (self._width == w and self._height == h) then
		return
	end
	self._width, self._height = w, h
	scheduleLayoutUpdateIfDisplayed(self)
end



-- REPLACE  _updateLayoutSize( )
function Cs.root:_updateLayoutSize()
	self._layoutWidth  = self._width
	self._layoutHeight = self._height
	self._layoutInnerWidth  = self._layoutWidth -2*self._padding
	self._layoutInnerHeight = self._layoutHeight-2*self._padding
	updateContainerChildLayoutSizes(self)
end

-- REPLACE  _expandLayout( [ expandWidth, expandHeight ] )
-- expandWidth and expandHeight are ignored as the root always has a fixed non-expanding size.
function Cs.root:_expandLayout(expandW, expandH)
	for _, child in ipairs(self) do
		if not child._hidden then
			child:_expandLayout(nil, nil)
		end
	end
end



--==============================================================
--= Leaf =======================================================
--==============================================================



Cs.leaf = Cs.element:extend('GuiLeaf', {

	_mnemonicPosition = nil,
	_textWidth = 0, _textHeight = 0,
	_unprocessedText = '',

	_align = 'center',
	_bold = false, _small = false, _large = false,
	_mnemonics = false,
	_text = '',
	_textColor = nil,

})
registerEvents(Cs.leaf, {
})

function Cs.leaf:init(gui, data, parent)
	Cs.leaf.super.init(self, gui, data, parent)

	retrieve(self, data, '_align')
	retrieve(self, data, '_bold','_small','_large')
	retrieve(self, data, '_mnemonics')
	-- retrieve(self, data, '_text')
	retrieve(self, data, '_textColor')

	if data.text ~= nil then
		self:setText(data.text)
	end

end



-- getAlign, setAlign
-- Note: We shouldn't have to update the layout after changing the alignment.
Cs.leaf:def'_align'



-- font = getFont( )
function Cs.leaf:getFont()
	local k =
		   (self._large and '_fontLarge')
		or (self._small and '_fontSmall')
		or (self._bold and '_fontBold')
		or '_font'
	return (self._gui[k] or DEFAULT_FONT)
end

-- Tell LÖVE to use the font.
-- fontBeingUsed = useFont( )
function Cs.leaf:useFont()
	local font = self:getFont()
	LG.setFont(font)
	return font
end



-- position = getMnemonicPosition( )
-- Returns nil if there's no mnemonic.
function Cs.leaf:getMnemonicPosition()
	return self._mnemonicPosition
end



-- getText
Cs.leaf:defget'_text'

-- getUnprocessedText
Cs.leaf:defget'_unprocessedText'

-- setText( text )
function Cs.leaf:setText(unprocessedText)
	unprocessedText = tostring(unprocessedText == nil and '' or unprocessedText)

	local text = preprocessText(self._gui, unprocessedText, self, self._mnemonics)
	if self._text == text then return end

	-- Check text for mnemonics (using "&").
	self._mnemonicPosition = nil
	if self._mnemonics then
		local matchCount, mnemonicCount = 0, 0
		local cleanText = text:gsub('()&(.)', function(pos, c)
			if c ~= '&' then
				if mnemonicCount == 0 then
					self._mnemonicPosition = pos-matchCount
				end
				mnemonicCount = mnemonicCount+1
			end
			matchCount = matchCount+1
			return c
		end)
		if mnemonicCount > 1 then
			printf('ERROR: Multiple mnemonics in %q.', text)
		end
		text = cleanText
	end

	self._text = text
	self._unprocessedText = unprocessedText

	local oldW = self._textWidth
	self._textWidth = self:getFont():getWidth(text)
	if self._textWidth ~= oldW then
		scheduleLayoutUpdateIfDisplayed(self)
	end

end

-- drawText( x, y )
function Cs.leaf:drawText(x, y)
	LG.print(self._text, x, y)
end

-- drawAlignedText( areaX, areaY, areaWidth [, align=self:getAlign() ] )
function Cs.leaf:drawAlignedText(x, y, w, align)
	align = (align or self._align)
	if align == 'right' then
		x = x+w-self._textWidth
	elseif align == 'center' then
		x = x+math.floor((w-self._textWidth)/2)
	end
	self:drawText(x, y)
end



-- getTextColor, setTextColor
Cs.leaf:def'_textColor'

-- state = hasTextColor( )
function Cs.leaf:hasTextColor()
	return (self._textColor ~= nil)
end

-- Tell LÖVE to use the text color.
-- hasTextColor = useTextColor( [ opacity=1.0 ] )
function Cs.leaf:useTextColor(opacity)
	local color = self._textColor
	useColor((color or COLOR_WHITE), opacity)
	return (color ~= nil)
end



-- state = isBold( )
function Cs.leaf:isBold(text)
	return self._bold
end

-- setBold( state )
function Cs.leaf:setBold(state)
	if self._bold == state then
		return
	end
	self._bold = state
	scheduleLayoutUpdateIfDisplayed(self)
end



-- state = isLarge( )
function Cs.leaf:isLarge(text)
	return self._large
end

-- setLarge( state )
function Cs.leaf:setLarge(state)
	if self._large == state then
		return
	end
	self._large = state
	scheduleLayoutUpdateIfDisplayed(self)
end



-- state = isSmall( )
function Cs.leaf:isSmall(text)
	return self._small
end

-- setSmall( state )
function Cs.leaf:setSmall(state)
	if self._small == state then
		return
	end
	self._small = state
	scheduleLayoutUpdateIfDisplayed(self)
end



-- REPLACE  state = isSolid( )
function Cs.leaf:isSolid()
	return true
end



-- OVERRIDE  reprocessTexts( )
function Cs.leaf:reprocessTexts()
	Cs.leaf.super.reprocessTexts(self)
	self:setText(self._unprocessedText)
end



--==============================================================
--= Canvas =====================================================
--==============================================================



Cs.canvas = Cs.leaf:extend('GuiCanvas', {

	_canvasBackgroundColor = nil,

})
registerEvents(Cs.canvas, {
	'draw',
})

function Cs.canvas:init(gui, data, parent)
	Cs.canvas.super.init(self, gui, data, parent)

	retrieve(self, data, '_canvasBackgroundColor')

end



-- REPLACE  _draw( )
function Cs.canvas:_draw()
	if self._hidden then  return  end

	local gui = self._gui
	if gui.debug then  return self:_drawDebug(255, 0, 0)  end

	local x, y, w, h = xywh(self)

	triggerIncludingAnimations(self, 'beforedraw', x, y, w, h)

	drawLayoutBackground(self)

	-- Draw canvas.
	-- We don't call themeRender() for canvases as they should only draw things through the "draw" event.
	local cw = self._width  or w
	local ch = self._height or h
	if cw > 0 and ch > 0 then
		LG.push('all')

		local cx, cy = x+math.floor((w-cw)/2), y+math.floor((h-ch)/2)
		local bgColor = self._canvasBackgroundColor
		if bgColor then
			LG.setColor(bgColor)
			LG.rectangle('fill', cx, cy, cw, ch)
		end

		setScissor(gui, cx, cy, cw, ch)
		LG.translate(cx, cy)
		LG.setColor(255, 255, 255)

		triggerIncludingAnimations(self, 'draw', cw, ch)
		self:unsetScissor()

		setScissor(gui, nil)
		LG.pop()
	end

	triggerIncludingAnimations(self, 'afterdraw', x, y, w, h)

end



-- getCanvasBackgroundColor, setCanvasBackgroundColor
Cs.canvas:def'_canvasBackgroundColor'



-- REPLACE  handled, grabFocus = _mousepressed( x, y, button )
function Cs.canvas:_mousepressed(x, y, buttonN)
	return true, true
end



-- REPLACE  _updateLayoutSize( )
function Cs.canvas:_updateLayoutSize()
	-- We don't call themeGetSize() for canvases as they always have their own private "theme".
	local w, h = (self._width or 0), (self._height or 0)
	self._layoutWidth,      self._layoutHeight      = w, h
	self._layoutInnerWidth, self._layoutInnerHeight = w, h
end



--==============================================================
--= Image ======================================================
--==============================================================



Cs.image = Cs.leaf:extend('GuiImage', {

	-- imageMixin
	_spriteName = nil,

	-- imageMixin
	_imageBackgroundColor = nil,
	_imageColor = nil,
	_imageScaleX = 1.0, _imageScaleY = 1.0,
	_sprite = nil,

})
applyMixin(Cs.image, Ms.imageMixin)
registerEvents(Cs.image, {
})

function Cs.image:init(gui, data, parent)
	Cs.image.super.init(self, gui, data, parent)

	retrieve(self, data, '_imageBackgroundColor')
	retrieve(self, data, '_imageColor')
	-- retrieve(self, data, '_imageScaleX','_imageScaleY')
	-- retrieve(self, data, '_sprite')

	self._imageScaleX = (data.imageScaleX or data.imageScale or self._imageScaleX)
	self._imageScaleY = (data.imageScaleY or data.imageScale or self._imageScaleY)

	self:setSprite(data.sprite)

end



-- OVERRIDE  _update( deltaTime )
function Cs.image:_update(dt)
	Cs.image.super._update(self, dt)
	local sprite = self._sprite
	if sprite then updateSprite(sprite, dt) end
end



-- REPLACE  _draw( )
function Cs.image:_draw()
	if self._hidden then  return  end
	if self._gui.debug then  return self:_drawDebug(255, 0, 0)  end

	local x, y, w, h = xywh(self)

	triggerIncludingAnimations(self, 'beforedraw', x, y, w, h)

	drawLayoutBackground(self)

	local image, quad, iw, ih = nil, nil, 0, 0
	if self._sprite then
		image, quad, iw, ih = getCurrentViewOfSprite(self._sprite)
	end
	themeRender(self, 'image', iw*self._imageScaleX, ih*self._imageScaleY)

	triggerIncludingAnimations(self, 'afterdraw', x, y, w, h)

end



-- REPLACE  _updateLayoutSize( )
function Cs.image:_updateLayoutSize()

	local w, h = nil, nil
	if not (self._width and self._height) then
		local iw, ih = self:getImageDimensions()
		w, h = themeGetSize(self, 'image', iw*self._imageScaleX, ih*self._imageScaleX)
	end

	w = (self._width  or math.max(w, self._minWidth))
	h = (self._height or math.max(h, self._minHeight))

	self._layoutWidth,      self._layoutHeight      = w, h
	self._layoutInnerWidth, self._layoutInnerHeight = w, h

end



--==============================================================
--= Text =======================================================
--==============================================================



Cs.text = Cs.leaf:extend('GuiText', {

	_wrapText = false, _textWrapLimit = nil,

})
registerEvents(Cs.text, {
})

function Cs.text:init(gui, data, parent)
	Cs.text.super.init(self, gui, data, parent)

	retrieve(self, data, '_wrapText','_textWrapLimit')

end



-- REPLACE  _draw( )
function Cs.text:_draw()
	if self._hidden then  return  end
	if self._gui.debug then  return self:_drawDebug(255, 0, 0)  end

	local x, y, w, h = xywh(self)

	triggerIncludingAnimations(self, 'beforedraw', x, y, w, h)

	drawLayoutBackground(self)

	local textIndent = themeGet(self._gui, 'textIndentation')
	themeRender(self, 'text', textIndent, self._textWidth, self._textHeight)

	triggerIncludingAnimations(self, 'afterdraw', x, y, w, h)

end



-- REPLACE  _updateLayoutSize( )
function Cs.text:_updateLayoutSize()

	local wrapLimit = self._textWrapLimit
	if (not wrapLimit and self._wrapText) then

		local innerSpaceSum = 0

		for _, parent in self:parents() do

			innerSpaceSum = innerSpaceSum+parent:getInnerSpaceX()

			-- At most this will be the root, as the root always has a defined size.
			if parent._width then
				wrapLimit = parent._width-innerSpaceSum-2*themeGet(self._gui, 'textIndentation')
				if wrapLimit <= 0 then
					-- Maybe the root's size is 0x0?
					wrapLimit = nil
				end
				break
			end

		end

	end

	local textW, textH = getTextDimensions(self:getFont(), self._text, wrapLimit)
	self._textWidth, self._textHeight = textW, textH

	local w, h = nil, nil
	if not (self._width and self._height) then
		local textIndent = themeGet(self._gui, 'textIndentation')
		w, h = themeGetSize(self, 'text', textIndent, textW, textH)
	end

	w = (self._width  or math.max(w, self._minWidth))
	h = (self._height or math.max(h, self._minHeight))

	self._layoutWidth,      self._layoutHeight      = w, h
	self._layoutInnerWidth, self._layoutInnerHeight = w, h

end



-- REPLACE  drawText( x, y )
function Cs.text:drawText(x, y)
	if (self._wrapText or self._textWrapLimit) then
		LG.printf(self._text, x, y, self._textWidth, self._align)
	else
		LG.print(self._text, x, y)
	end
end



--==============================================================
--= Widget =====================================================
--==============================================================



Cs.widget = Cs.leaf:extend('GuiWidget', {

	_active = true,
	_priority = 0,

})
registerEvents(Cs.widget, {
	'navigate',
	'navupdate',
})

function Cs.widget:init(gui, data, parent)
	Cs.widget.super.init(self, gui, data, parent)

	retrieve(self, data, '_active')
	retrieve(self, data, '_priority')

end



-- getPriority, setPriority
Cs.widget:def'_priority'



-- state = isActive( )
function Cs.widget:isActive()
	return self._active
end

-- stateChanged = setActive( state )
function Cs.widget:setActive(state)
	if self._active == state then
		return false
	end
	self._active = state
	return true
end



--==============================================================
--= Button =====================================================
--==============================================================



Cs.button = Cs.widget:extend('GuiButton', {

	-- imageMixin
	_spriteName = nil,

	_isPressed = false,
	_textWidth1 = 0, _textWidth2 = 0,
	_unprocessedText2 = '',

	-- imageMixin
	_imageBackgroundColor = nil,
	_imageColor = nil,
	_imageScaleX = 1.0, _imageScaleY = 1.0,
	_sprite = nil,

	_arrow = nil,
	_canToggle = false,
	_close = false,
	_imagePadding = 0,
	_pressable = true,
	_text2 = '',
	_toggled = false,
	_toggledSprite = nil, _untoggledSprite = nil,

})
applyMixin(Cs.button, Ms.imageMixin)
registerEvents(Cs.button, {
	'press',
	'toggle',
})

function Cs.button:init(gui, data, parent)
	Cs.button.super.init(self, gui, data, parent)

	retrieve(self, data, '_arrow')
	retrieve(self, data, '_canToggle')
	retrieve(self, data, '_close')
	retrieve(self, data, '_imageBackgroundColor')
	retrieve(self, data, '_imageColor')
	-- retrieve(self, data, '_imageScaleX','_imageScaleY')
	retrieve(self, data, '_imagePadding')
	retrieve(self, data, '_pressable')
	-- retrieve(self, data, '_sprite')
	-- retrieve(self, data, '_text2')
	retrieve(self, data, '_toggled')
	retrieve(self, data, '_toggledSprite','_untoggledSprite')

	self._imageScaleX = (data.imageScaleX or data.imageScale or self._imageScaleX)
	self._imageScaleY = (data.imageScaleY or data.imageScale or self._imageScaleY)

	if data.sprite then
		self:setSprite(data.sprite)
	elseif (self._toggledSprite and self._toggled) then
		self:setSprite(self._toggledSprite)
	elseif (self._untoggledSprite and not self._toggled) then
		self:setSprite(self._untoggledSprite)
	end

	if data.text2 ~= nil then
		self:setText2(data.text2)
	end

end



-- OVERRIDE  _update( deltaTime )
function Cs.button:_update(dt)
	Cs.button.super._update(self, dt)
	local sprite = self._sprite
	if sprite then updateSprite(sprite, dt) end
end



-- REPLACE  _draw( )
function Cs.button:_draw()
	if self._hidden then  return  end
	if self._gui.debug then  return self:_drawDebug(0, 180, 0)  end

	local x, y, w, h = xywh(self)

	triggerIncludingAnimations(self, 'beforedraw', x, y, w, h)

	drawLayoutBackground(self)

	local image, quad, iw, ih = nil, nil, 0, 0
	if self._sprite then
		image, quad, iw, ih = getCurrentViewOfSprite(self._sprite)
	end
	themeRender(
		self, 'button', self._textWidth1, self._textWidth2, self._textHeight,
		iw*self._imageScaleX+2*self._imagePadding, ih*self._imageScaleY+2*self._imagePadding
	)

	triggerIncludingAnimations(self, 'afterdraw', x, y, w, h)

end



-- getArrow
Cs.button:defget'_arrow'



-- getText2
Cs.button:defget'_text2'

-- getUnprocessedText2
Cs.button:defget'_unprocessedText2'

-- OVERRIDE  setText( text )
function Cs.button:setText(text)
	local oldText = self._text
	local oldW = self._textWidth

	Cs.button.super.setText(self, text)
	text = nil -- Don't use this anymore.

	if self._text == oldText then
		return
	end

	self._textWidth1 = self._textWidth
	self._textWidth = self._textWidth1+self._textWidth2

	if self._textWidth ~= oldW then
		scheduleLayoutUpdateIfDisplayed(self)
	end

end

-- setText2( text )
function Cs.button:setText2(unprocessedText)
	unprocessedText = tostring(unprocessedText == nil and '' or unprocessedText)

	local text = preprocessText(self._gui, unprocessedText, self, false)
	if self._text2 == text then return end

	self._text2 = text
	self._unprocessedText2 = unprocessedText

	local oldW = self._textWidth
	self._textWidth2 = self:getFont():getWidth(text)
	self._textWidth = self._textWidth1+self._textWidth2
	if self._textWidth ~= oldW then
		scheduleLayoutUpdateIfDisplayed(self)
	end

end

-- drawText2( x, y )
function Cs.button:drawText2(x, y)
	LG.print(self._text2, x, y)
end

-- drawAlignedText2( areaX, areaY, areaWidth [, align=self:getAlign() ] )
function Cs.button:drawAlignedText2(x, y, w, align)
	align = (align or self._align)
	if align == 'right' then
		x = x+w-self._textWidth2
	elseif align == 'center' then
		x = x+math.floor((w-self._textWidth2)/2)
	end
	self:drawText(x, y)
end



-- state = isPressable( )
function Cs.button:isPressable()
	return self._pressable
end

-- setPressable
Cs.button:defset'_pressable'



-- state = isToggled( )
function Cs.button:isToggled()
	return self._toggled
end

-- setToggled( state )
function Cs.button:setToggled(state)
	if self._toggled == state then return end

	self._toggled = state

	if (state and self._toggledSprite) then
		self:setSprite(self._toggledSprite)
	elseif (not state and self._untoggledSprite) then
		self:setSprite(self._untoggledSprite)
	end

	trigger(self, 'toggle')

end



-- REPLACE  handled, grabFocus = _mousepressed( x, y, button )
function Cs.button:_mousepressed(x, y, buttonN)
	if buttonN == 1 then
		if not self._active then
			return true, false
		end
		self._isPressed = true
		return true, true
	end
	return false, false
end

-- -- REPLACE  _mousemoved( x, y )
-- function Cs.button:_mousemoved(x, y)
-- end

-- REPLACE  _mousereleased( x, y, button )
function Cs.button:_mousereleased(x, y, buttonN)
	if buttonN == 1 then
		self._isPressed = false
		if (x and self:isHovered()) then
			self:press()
		end
	end
end



-- REPLACE  handled = _ok( )
function Cs.button:_ok()
	self:press()
	return true
end



-- success = press( [ ignoreActiveState=false ] )
function Cs.button:press(ignoreActiveState)
	if not ignoreActiveState and not (self._active and self._pressable) then
		return false
	end

	-- Press/toggle the button
	local preparedSound = prepareSound(self, 'press')

	if self._canToggle then
		local state = (not self._toggled)
		self._toggled = state -- We need to toggle before the press event in case the callback uses the value.

		if state and self._toggledSprite then
			self:setSprite(self._toggledSprite)
		elseif not state and self._untoggledSprite then
			self:setSprite(self._untoggledSprite)
		end

	end

	self._gui._ignoreKeyboardInputThisFrame = true

	trigger(self, 'press')
	if self._canToggle then trigger(self, 'toggle') end

	self:triggerBubbling('pressed', self)

	-- Close closest closable
	local closedAnything = false
	if self._close then
		if self:canClose() then
			closedAnything = self:close()
		else
			for _, parent in self:parents() do
				if parent:canClose() then
					closedAnything = parent:close()
					break
				end
			end
		end
	end
	if not closedAnything then
		preparedSound() -- 'close' has its own sound.
	end

	return true
end

-- state = isPressed( )
function Cs.button:isPressed()
	return self._isPressed
end



-- OVERRIDE  reprocessTexts( )
function Cs.button:reprocessTexts()
	Cs.button.super.reprocessTexts(self)
	self:setText2(self._unprocessedText2)
end



-- REPLACE  _updateLayoutSize( )
function Cs.button:_updateLayoutSize()

	local font = self:getFont()
	self._textWidth1 = font:getWidth(self._text)
	self._textWidth2 = font:getWidth(self._text2)
	self._textWidth = self._textWidth1+self._textWidth2 -- This value is pretty useless...
	self._textHeight = font:getHeight()

	local w, h = nil, nil
	if not (self._width and self._height) then
		local iw, ih = self:getImageDimensions()
		w, h = themeGetSize(
			self, 'button', self._textWidth1, self._textWidth2, self._textHeight,
			iw*self._imageScaleX+2*self._imagePadding, ih*self._imageScaleX+2*self._imagePadding)
	end

	w = (self._width  or math.max(w, self._minWidth))
	h = (self._height or math.max(h, self._minHeight))

	self._layoutWidth,      self._layoutHeight      = w, h
	self._layoutInnerWidth, self._layoutInnerHeight = w, h

end



--==============================================================
--= Input ======================================================
--==============================================================



Cs.input = Cs.widget:extend('GuiInput', {

	_field = nil,
	_savedKeyRepeat = false,
	_savedValue = '',

	--[[OVERRIDE]] _mouseCursor = 'ibeam',
	--[[REPLACE]] _width = 0, -- Inputs always have a width.
	_mask = '',
	_placeholder = '',

})
registerEvents(Cs.input, {
	'change',
	'submit',
})

function Cs.input:init(gui, data, parent)
	Cs.input.super.init(self, gui, data, parent)

	-- retrieve(self, data, '_password') -- This is saved in the field instead.
	retrieve(self, data, '_mask')
	retrieve(self, data, '_placeholder')

	self._field = InputField()
	self._field:setFont(self:getFont())
	self._field:setFontFilteringActive(true)
	if data.value then
		self._field:setText(data.value)
	end
	if data.password then
		self._field:setPasswordActive(true)
	end

end



-- OVERRIDE  _update( deltaTime )
function Cs.input:_update(dt)
	Cs.input.super._update(self, dt)
	self._field:update(dt)
end



-- REPLACE  _draw( )
function Cs.input:_draw()
	if self._hidden then  return  end
	if self._gui.debug then  return self:_drawDebug(0, 180, 0)  end

	local inputIndent = themeGet(self._gui, 'inputIndentation')

	local x, y, w, h = xywh(self)

	triggerIncludingAnimations(self, 'beforedraw', x, y, w, h)

	drawLayoutBackground(self)
	themeRender(self, 'input', inputIndent, self:getFont():getHeight())

	triggerIncludingAnimations(self, 'afterdraw', x, y, w, h)

end



-- focus( )
function Cs.input:focus()
	local gui = self._gui
	if gui._keyboardFocus == self then
		return
	end

	self._savedValue = self:getValue()
	self._savedKeyRepeat = love.keyboard.hasKeyRepeat()

	gui:navigateTo(gui._navigationTarget and self or nil)
	gui._lockNavigation = true

	setKeyboardFocus(gui, self)
	setMouseFocus(gui, self, 0)

	love.keyboard.setKeyRepeat(true)

	self._field:resetBlinking()

	self:playSound('focus')

	self:triggerBubbling('focused', self)
end

-- success = blur( )
function Cs.input:blur()
	local gui = self._gui
	if gui._keyboardFocus ~= self then
		return false
	end

	setKeyboardFocus(gui, nil)
	setMouseFocus(gui, nil)

	gui._lockNavigation = false

	love.keyboard.setKeyRepeat(self._savedKeyRepeat)

	self._field:setScroll(0)

	local v = self:getValue()
	if v ~= self._savedValue then
		trigger(self, 'change', v)
	end

	self:triggerBubbling('blurred', self)

	return true
end

-- state = isFocused( )
function Cs.input:isFocused()
	return self:isKeyboardFocus()
end



-- getField
Cs.input:defget'_field'



-- value = getValue( )
function Cs.input:getValue()
	return self._field:getText()
end

-- setValue( value )
function Cs.input:setValue(value)
	return self._field:setText(value)
end

-- value = getVisibleValue( )
-- Will return "***" for passwords.
function Cs.input:getVisibleValue()
	return self._field:getVisibleText()
end

-- drawValue( x, y )
function Cs.input:drawValue(x, y)
	LG.print(self:getVisibleValue(), x+self._field:getTextOffset(), y)
end



-- state = isPasswordActive( )
function Cs.input:isPasswordActive()
	return self._field:isPasswordActive()
end

-- setPasswordActive( state )
function Cs.input:setPasswordActive(state)
	self._field:setPasswordActive(state)
end



-- REPLACE  handled, grabFocus = _keypressed( key, scancode, isRepeat )
function Cs.input:_keypressed(key, scancode, isRepeat)
	if not self:isKeyboardFocus() then  return false, false  end

	if key == 'escape' then
		if not isRepeat then
			self._field:setText(self._savedValue)
			self:blur()
			self:playSound('inputrevert')
		end

	elseif key == 'return' or key == 'kpenter' then
		if not isRepeat then
			self:blur()
			self:playSound('inputsubmit')
			trigger(self, 'submit')
		end

	else
		local oldValue = self:getValue()
		local handled  = self._field:keypressed(key, scancode, isRepeat)

		local mask     = self._mask
		local newValue = self:getValue()
		if handled and mask ~= '' and newValue ~= oldValue and not newValue:find(mask) then
			self:setValue(oldValue)
		end
	end

	return true, false
end

-- -- REPLACE  _keyreleased( key, scancode )
-- function Cs.input:_keyreleased(key, scancode)
-- end

-- REPLACE  handled = _textinput( text )
function Cs.input:_textinput(text)
	if not self:isKeyboardFocus() then return false end

	local oldValue = self:getValue()
	local handled  = self._field:textinput(text)

	local mask     = self._mask
	local newValue = self:getValue()
	if handled and mask ~= '' and newValue ~= oldValue and not newValue:find(mask) then
		self:setValue(oldValue)
	end

	return true
end



-- REPLACE  handled, grabFocus = _mousepressed( x, y, button )
function Cs.input:_mousepressed(x, y, buttonN)
	if not self._active then
		return true, false
	end
	if not self:isHovered() then
		self:blur()
		return true, false
	end
	self:focus()
	self._gui._mouseFocusSet[buttonN] = true
	self._field:mousepressed(x-self._layoutX-themeGet(self._gui, 'inputIndentation'), 0, buttonN)
	return true, false -- NOTE: We've set the focus ourselves
end

-- REPLACE  _mousemoved( x, y )
function Cs.input:_mousemoved(x, y)
	self._field:mousemoved(x-self._layoutX-themeGet(self._gui, 'inputIndentation'), 0)
end

-- REPLACE  _mousereleased( x, y, button )
function Cs.input:_mousereleased(x, y, buttonN)
	self._field:mousereleased(x-self._layoutX-themeGet(self._gui, 'inputIndentation'), 0, buttonN)
end



-- REPLACE  handled = _ok( )
function Cs.input:_ok()
	self._gui._ignoreKeyboardInputThisFrame = true
	if not self:isFocused() then
		self:focus()
	else
		self:blur()
	end
	return true
end



-- OVERRIDE  setActive( state )
function Cs.input:setActive(state)
	if state == false then
		self:blur()
	end
	Cs.input.super.setActive(self, state)
end



-- REPLACE  _updateLayoutSize( )
function Cs.input:_updateLayoutSize()

	local inputIndent = themeGet(self._gui, 'inputIndentation')

	local w, h = nil, nil
	if not self._height then
		-- We only care about the height returned from themeGetSize() as the width is always defined/fixed for inputs.
		w, h = themeGetSize(self, 'input', inputIndent, self:getFont():getHeight())
	end

	w = (self._width  or 0)
	h = (self._height or math.max(h, self._minHeight))

	self._layoutWidth,      self._layoutHeight      = w,               h
	self._layoutInnerWidth, self._layoutInnerHeight = w-2*inputIndent, h

end

-- OVERRIDE  _expandLayout( [ expandWidth, expandHeight ] )
function Cs.input:_expandLayout(expandW, expandH)
	Cs.input.super._expandLayout(self, expandW, expandH)

	local inputIndent = themeGet(self._gui, 'inputIndentation')

	self._layoutInnerWidth  = self._layoutWidth-2*inputIndent
	self._layoutInnerHeight = self._layoutHeight

	self._field:setWidth(self._layoutInnerWidth)

end



--==============================================================
--==============================================================
--==============================================================



-- Fast-forward the storage of this module so the default theme can access it
-- through require() right away - otherwise we'll get stuck in an infinite loop!
package.loaded[modulePath] = Gui

defaultTheme = require((moduleFolder..'.defaultTheme'):sub(2))

return Gui



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
