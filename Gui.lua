--[[============================================================
--=
--=  GuiLove v0.2 beta for LÖVE 0.10.2+
--=  - Written by Marcus 'ReFreezed' Thunström
--=  - MIT License (See the bottom of this file)
--=
--=  This file is generated from the source at:
--=  https://github.com/ReFreezed/GuiLove
--=
--==============================================================



	Basic usage
	----------------------------------------------------------------

	function love.load()
		local Gui = require("Gui")
		gui       = Gui()

		local tree = {"root",
			{"vbar", id="myContainer", width=200,
				{"text", text="I'm just a text."},
				{"button", id="myButton", text="Press Me!"},
			},
		}
		gui:load(tree)

		local myButton   = gui:find("myButton")
		local pressCount = 0

		myButton:on("press", function(myButton, event)
			pressCount = pressCount + 1

			local myContainer = gui:find("myContainer")
			myContainer:insert{ "text", text="Pressed button "..pressCount.." time(s)!" }

		end)

		gui:getRoot():setDimensions(love.graphics.getDimensions())
	end

	function love.keypressed(key, scancode, isRepeat)
		gui:keypressed(key, scancode, isRepeat)
	end
	function love.keyreleased(key, scancode)
		gui:keyreleased(key, scancode)
	end
	function love.textinput(text)
		gui:textinput(text)
	end

	function love.mousepressed(mx, my, mbutton, isTouch, pressCount)
		gui:mousepressed(mx, my, mbutton, pressCount)
	end
	function love.mousemoved(mx, my, dx, dy, isTouch)
		gui:mousemoved(mx, my)
	end
	function love.mousereleased(mx, my, mbutton, isTouch, pressCount)
		gui:mousereleased(mx, my, mbutton)
	end
	function love.wheelmoved(dx, dy)
		gui:wheelmoved(dx, dy)
	end

	function love.update(dt)
		gui:update(dt)
	end

	function love.draw()
		gui:draw()
	end



	Gui methods
	----------------------------------------------------------------

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
	- getMinDimensions, setMinDimensions, getMinWidth, setMinWidth, getMinHeight, setMinHeight
	- getMouseCursor, getResultingMouseCursor, setMouseCursor
	- getMousePosition, getMouseX, getMouseY
	- getOrigin, setOrigin, getOriginX, setOriginX, getOriginY, setOriginY
	- getParent, getParents, hasParent, getParentWithId, hasParentWithId, parents, parentsr, lineageUp
	- getPathDescription
	- getPosition, setPosition, getX, setX, getY, setY
	- getPositionOnScreen, getXOnScreen, getYOnScreen
	- getRoot, getNavigationRoot
	- getSibling
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
	- getMaxDimensions, setMaxDimensions, getMaxWidth, setMaxWidth, getMaxHeight, setMaxHeight
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
			- getBlinkPhase
			- getField
			- getSelectionOffset, getCursorOffset
			- getValue, setValue, getVisibleValue, drawValue, drawPlaceholder
			- isPasswordActive, setPasswordActive
			- Event: change
			- Event: submit
			- Event: valuechange



	Includes
	----------------------------------------------------------------

	imageMixin
	- drawImage
	- getImageBackgroundColor, setImageBackgroundColor, hasImageBackgroundColor, useImageBackgroundColor
	- getImageColor, setImageColor, hasImageColor, useImageColor
	- getImageDimensions, setImageSize, maximizeImageSize
	- getImageScale, getImageScaleX, getImageScaleY, setImageScale, setImageScaleX, setImageScaleY
	- getSprite, setSprite, hasSprite



	Tools
	----------------------------------------------------------------

	create9PartQuads
	draw9PartScaled
	newMonochromeImage, newImageUsingPalette



--============================================================]]



local setColor = love.graphics.setColor

if love.getVersion() < 11 then
	local _setColor = setColor
	function setColor(r, g, b, a)
		_setColor(r*255, g*255, b*255, (a and a*255))
	end
end

local class      = (function()
	--[[============================================================
	--=
	--=  Simple class library
	--=
	--==============================================================

		classLib = require("class")

		myClass  = classLib( className, baseTable ) -- Create a new class.
		subClass = myClass:extend( className, baseTable ) -- Create a subclass.

		subClass.super -- Access the parent class.

		instance = myClass(...) -- Create a new instance (which calls myClass:init(...)).
		bool     = instance:is( class ) -- Check if the instance inherits a class.

		instance.class -- Access the instance's class.

	--============================================================]]

	local classMt = {
		__call = function(C, ...)
			local instance = {class=C, __id=""}

			local id      = tostring(instance)
			instance.__id = id:match"0x(%x+)" or id:gsub("^table: ", "")

			setmetatable(instance, C)
			instance:init(...)

			return instance
		end,

		__tostring = function(C)
			return ("class(%s)"):format(C.__name)
		end,
	}

	-- class = newClass( name, classTable )
	local function newClass(name, C)
		-- Instances use their class as metatable.
		C.__index = C
		C.__name  = name
		return setmetatable(C, classMt)
	end

	local BaseClass = newClass("Class", {
		__tostring = function(self)
			return ("%s(%s)"):format(self.class.__name, self.__id)
		end,

		-- subClass = class:extend( name, subClassTable )
		extend = function(C, name, SubC)
			-- Subclasses do NOT use superclasses as metatables - we just copy everything over.
			for k, v in pairs(C) do
				if SubC[k] == nil then  SubC[k] = v  end
			end

			SubC.super = C

			return newClass(name, SubC)
		end,

		-- bool = instance:is( class )
		is = function(obj, C)
			local currentClass = obj.class

			-- Look through the whole inheritance.
			while currentClass do
				if currentClass == C then  return true  end
				currentClass = currentClass.super
			end

			return false
		end,

		init = function()end,
	})

	return function(...)
		return BaseClass:extend(...)
	end

       end)()
local InputField = (function()
	--[[============================================================
	--=
	--=  InputField v3.3 - text input handling library for LÖVE (0.10.2+)
	--=  - Written by Marcus 'ReFreezed' Thunström
	--=  - MIT License (See the bottom of this file)
	--=  - https://github.com/ReFreezed/InputField
	--=
	--==============================================================

		1. Functions
		2. Enums
		3. Basic usage



		1. Functions
		----------------------------------------------------------------

		-- Search through the file for more info about each individual function.

		-- Settings:
		getAlignment, setAlignment
		getDimensions, getWidth, getHeight, setDimensions, setWidth, setHeight
		getDoubleClickMaxDelay, setDoubleClickMaxDelay
		getFilter, setFilter
		getFont, setFont
		getMaxHistory, setMaxHistory
		getMouseScrollSpeed, getMouseScrollSpeedX, getMouseScrollSpeedY, setMouseScrollSpeed, setMouseScrollSpeedX, setMouseScrollSpeedY
		getType, setType, isPassword, isMultiline
		getWheelScrollSpeed, getWheelScrollSpeedX, getWheelScrollSpeedY, setWheelScrollSpeed, setWheelScrollSpeedX, setWheelScrollSpeedY
		isEditable, setEditable
		isFontFilteringActive, setFontFilteringActive

		-- Events:
		update
		mousepressed, mousemoved, mousereleased, wheelmoved
		keypressed, textinput

		-- Other:
		canScroll, canScrollHorizontally, canScrollVertically
		clearHistory
		eachVisibleLine, eachSelection, eachSelectionOptimized
		getBlinkPhase, resetBlinking
		getCursor, setCursor, moveCursor, getCursorSelectionSide, getAnchorSelectionSide
		getCursorLayout
		getInfoAtCoords, getInfoAtCursor, getInfoAtCharacter
		getScroll, getScrollX, getScrollY, setScroll, setScrollX, setScrollY, scroll, scrollToCursor
		getScrollHandles, getScrollHandleHorizontal, getScrollHandleVertical
		getScrollLimits
		getSelection, setSelection, selectAll, getSelectedText, getSelectedVisibleText
		getText, setText, getVisibleText, insert
		getTextDimensions, getTextWidth, getTextHeight
		getTextLength
		getTextOffset
		getVisibleLine, getVisibleLineCount
		isBusy
		releaseMouse
		reset



		2. Enums
		----------------------------------------------------------------

		InputFieldType
			"normal"      -- Simple single-line input.
			"password"    -- Single-line input where all characters are obscured.
			"multiwrap"   -- Multi-line input where text wraps by the width of the field.
			"multinowrap" -- Multi-line input with no wrapping.

		SelectionSide
			"start" -- The start (left side) of the text selection.
			"end"   -- The end (right side) of the text selection.

		TextCursorAlignment
			"left"  -- Align cursor to the left.
			"right" -- Align cursor to the right.

		TextAlignment
			"left"   -- Align text to the left.
			"right"  -- Align text to the right.
			"center" -- Align text to the center.



		3. Basic usage
		----------------------------------------------------------------

		local InputField = require("InputField")
		local field      = InputField("Initial text.")

		local fieldX = 80
		local fieldY = 50

		love.keyboard.setKeyRepeat(true)

		function love.keypressed(key, scancode, isRepeat)
			field:keypressed(key, isRepeat)
		end
		function love.textinput(text)
			field:textinput(text)
		end

		function love.mousepressed(mx, my, mbutton, pressCount)
			field:mousepressed(mx-fieldX, my-fieldY, mbutton, pressCount)
		end
		function love.mousemoved(mx, my)
			field:mousemoved(mx-fieldX, my-fieldY)
		end
		function love.mousereleased(mx, my, mbutton)
			field:mousereleased(mx-fieldX, my-fieldY, mbutton)
		end
		function love.wheelmoved(dx, dy)
			field:wheelmoved(dx, dy)
		end

		function love.draw()
			love.graphics.setColor(0, 0, 1)
			for _, x, y, w, h in field:eachSelection() do
				love.graphics.rectangle("fill", fieldX+x, fieldY+y, w, h)
			end

			love.graphics.setColor(1, 1, 1)
			for _, text, x, y in field:eachVisibleLine() do
				love.graphics.print(text, fieldX+x, fieldY+y)
			end

			local x, y, h = field:getCursorLayout()
			love.graphics.rectangle("fill", fieldX+x, fieldY+y, 1, h)
		end



	--============================================================]]

	local InputField = {
		_VERSION = "InputField 3.3.0",
	}



	local LK   = require"love.keyboard"
	local LS   = require"love.system"
	local LT   = require"love.timer"
	local utf8 = require"utf8"

	local isMac = (LS.getOS() == "OS X")

	local InputField   = {}
	InputField.__index = InputField



	--[[ @Debug macOS on Windows.
	isMac         = true
	local _isDown = LK.isDown

	function LK.isDown(...)
		for i = 1, select("#", ...) do
			local key = select(i, ...)

			if     key == "lgui"  then  key = "lctrl"
			elseif key == "rgui"  then  key = "rctrl"
			elseif key == "lctrl" then  key = "application"
			elseif key == "rctrl" then  key = "application"
			end

			if _isDown(key) then  return true  end
		end

		return false
	end
	--]]



	--==============================================================
	--= Internal functions =========================================
	--==============================================================



	local function noop() end



	local function clamp(n, min, max)
		return math.max(math.min(n, max), min)
	end



	local function nextCodepoint(s, i)
		if i > 0 then
			local b = s:byte(i)
			if not b then
				return
			elseif b >= 240 then
				i = i + 4
			elseif b >= 224 then
				i = i + 3
			elseif b >= 192 then
				i = i + 2
			else
				i = i + 1
			end
		elseif i == 0 then
			i = 1
		elseif i < 0 then
			return
		end
		if i > #s then  return  end

		return i, utf8.codepoint(s, i)
	end

	local function utf8Codes(s) -- We don't use utf8.codes() as it creates garbage!
		return nextCodepoint, s, 0
	end

	local function utf8GetEndOffset(line, pos)
		return (utf8.offset(line, pos+1) or #line+1) - 1
	end



	local function cleanString(field, s)
		s = s:gsub((field:isMultiline() and "[%z\1-\9\11-\31]+" or "[%z\1-\31]+"), "") -- Should we allow horizontal tab?

		if field.fontFilteringIsActive then
			local font      = field.font
			local hasGlyphs = font.hasGlyphs

			s = s:gsub(utf8.charpattern, function(c)
				if not hasGlyphs(font, c) then  return ""  end
			end)
		end

		return s
	end



	--
	-- boundPosition = getNextWordBound    ( string, startPosition, direction )
	-- boundPosition = getNextHardLineBound( string, startPosition, direction )
	-- direction     = -1 | 1
	--
	-- Cursor behavior examples when navigating by word:
	--   a|a bb  ->  aa| bb
	--   aa| bb  ->  aa bb|
	--   aa |bb  ->  aa bb|
	--   cc| = dd+ee  ->  cc =| dd+ee
	--   cc =| dd+ee  ->  cc = dd|+ee
	--   cc = dd|+ee  ->  cc = dd+|ee
	--   f|f(-88  ->  ff|(-88
	--   ff|(-88  ->  ff(-|88
	--   ff(|-88  ->  ff(-|88
	--
	local getNextWordBound, getNextHardLineBound
	do
		local function newSet(values)
			local set = {}
			for _, v in ipairs(values) do
				set[v] = true
			end
			return set
		end

		local ASCII_PUNCTUATION = "!\"#$%&'()*+,-./:;<=>?@[\\]^`{|}~"; ASCII_PUNCTUATION = newSet{ ASCII_PUNCTUATION:byte(1, #ASCII_PUNCTUATION) }
		local ASCII_WHITESPACE  = newSet{ 9--[[,10]],11,12,13,32 } -- Horizontal tab, line feed, vertical tab, form feed, carriage return, space.

		-- Generated by tools/generateUnicodeInfo.lua:

		-- PUNCTUATION (8330, 97+230)
		local UNICODE_PUNCTUATION = newSet{180,187,191,215,247,749,885,894,903,1014,1154,1470,1472,1475,1478,1563,1748,1758,1769,2142,2416,2557,2678,2928,3191,3199,3204,3407,3449,
			3572,3647,3663,3892,3894,3896,3973,4347,5120,6464,7379,8125,8468,8485,8487,8489,8494,8527,11632,12336,12448,12539,12880,42611,42622,43260,43359,43867,44011,64297,
			65952,66463,66512,66927,67671,67871,67903,68223,68296,69293,70093,70107,70313,70749,70854,71739,72162,73727,92917,94178,113820,113823,119365,120513,120539,120571,120597,120629,120655,120687,
			120713,120745,120771,123215,123647,126124,126128,126254}
		local ranges = {161,169,171,172,174,177,182,184,706,709,722,735,741,747,751,767,900,901,1370,1375,1417,1418,
			1421,1423,1523,1524,1542,1551,1566,1567,1642,1645,1789,1790,1792,1805,2038,2041,2046,2047,2096,2110,2404,2405,2546,2547,
			2554,2555,2800,2801,3059,3066,3674,3675,3841,3863,3866,3871,3898,3901,4030,4037,4039,4044,4046,4058,4170,4175,4254,4255,
			4960,4968,5008,5017,5741,5742,5787,5788,5867,5869,5941,5942,6100,6102,6104,6107,6144,6154,6468,6469,6622,6655,6686,6687,
			6816,6822,6824,6829,7002,7018,7028,7036,7164,7167,7227,7231,7294,7295,7360,7367,8127,8129,8141,8143,8157,8159,8173,8175,
			8189,8190,8208,8231,8240,8286,8314,8318,8330,8334,8352,8383,8448,8449,8451,8454,8456,8457,8470,8472,8478,8483,8506,8507,
			8512,8516,8522,8525,8586,8587,8592,9254,9280,9290,9372,9449,9472,10101,10132,11123,11126,11157,11159,11263,11493,11498,11513,11516,
			11518,11519,11776,11822,11824,11858,11904,11929,11931,12019,12032,12245,12272,12283,12289,12292,12296,12320,12342,12343,12349,12351,12443,12444,
			12688,12689,12694,12703,12736,12771,12800,12830,12842,12871,12896,12927,12938,12976,12992,13311,19904,19967,42128,42182,42238,42239,42509,42511,
			42738,42743,42752,42774,42784,42785,42889,42890,43048,43051,43062,43065,43124,43127,43214,43215,43256,43258,43310,43311,43457,43469,43486,43487,
			43612,43615,43639,43641,43742,43743,43760,43761,43882,43883,64434,64449,64830,64831,65020,65021,65040,65049,65072,65106,65108,65126,65128,65131,
			65281,65295,65306,65312,65339,65344,65371,65381,65504,65510,65512,65518,65532,65533,65792,65794,65847,65855,65913,65929,65932,65934,65936,65948,
			66000,66044,67703,67704,68176,68184,68336,68342,68409,68415,68505,68508,69461,69465,69703,69709,69819,69820,69822,69825,69952,69955,70004,70005,
			70085,70088,70109,70111,70200,70205,70731,70735,70746,70747,71105,71127,71233,71235,71264,71276,71484,71487,72004,72006,72255,72262,72346,72348,
			72350,72354,72769,72773,72816,72817,73463,73464,73685,73713,74864,74868,92782,92783,92983,92991,92996,92997,93847,93850,118784,119029,119040,119078,
			119081,119140,119146,119148,119171,119172,119180,119209,119214,119272,119296,119361,119552,119638,120832,121343,121399,121402,121453,121460,121462,121475,121477,121483,
			125278,125279,126704,126705,126976,127019,127024,127123,127136,127150,127153,127167,127169,127183,127185,127221,127245,127405,127462,127490,127504,127547,127552,127560,
			127568,127569,127584,127589,127744,128727,128736,128748,128752,128764,128768,128883,128896,128984,128992,129003,129024,129035,129040,129095,129104,129113,129120,129159,
			129168,129197,129200,129201,129280,129400,129402,129483,129485,129619,129632,129645,129648,129652,129656,129658,129664,129670,129680,129704,129712,129718,129728,129730,
			129744,129750,129792,129938,129940,129994}
		for i = 1, #ranges, 2 do  for cp = ranges[i], ranges[i+1] do UNICODE_PUNCTUATION[cp] = true end  end

		-- WHITESPACE (18, 5+2)
		local UNICODE_WHITESPACE = newSet{160,5760,8239,8287,12288}
		local ranges = {8192,8202,8232,8233}
		for i = 1, #ranges, 2 do  for cp = ranges[i], ranges[i+1] do UNICODE_WHITESPACE[cp] = true end  end



		local function getCodepointCharType(cp)
			return ASCII_PUNCTUATION[cp]   and "punctuation"
			    or cp == 10                and "newline"
			    or ASCII_WHITESPACE[cp]    and "whitespace"
			    or cp <= 127               and "word"
			    or UNICODE_PUNCTUATION[cp] and "punctuation"
			    or UNICODE_WHITESPACE[cp]  and "whitespace"
			    or                             "word"
		end

		local codepoints = {}

		function getNextWordBound(s, pos, direction)
			local len = 0

			for _, cp in utf8Codes(s) do
				len             = len + 1
				codepoints[len] = cp
			end
			for i = len+1, #codepoints do
				codepoints[i] = nil
			end

			pos = clamp(pos, 0, len)
			if direction < 0 then  pos = pos+1  end

			while true do
				pos = pos + direction

				-- Check for end of string.
				local prevCp = codepoints[pos]
				local nextCp = codepoints[pos+direction]

				if not (prevCp and nextCp) then
					pos = pos + direction
					break
				end

				-- Check for word bound.
				local prevType = getCodepointCharType(prevCp)
				local nextType = getCodepointCharType(nextCp)

				if (nextType ~= prevType and not (nextType ~= "whitespace" and prevType == "whitespace")) or nextType == "newline" then
					if direction < 0 then  pos = pos-1  end
					break
				end
			end

			return clamp(pos, 0, len)
		end

		function getNextHardLineBound(s, pos, direction)
			local len = 0

			for _, cp in utf8Codes(s) do
				len             = len + 1
				codepoints[len] = cp
			end
			for i = len+1, #codepoints do
				codepoints[i] = nil
			end

			while codepoints[pos] or codepoints[pos+direction] do
				pos = pos + direction

				if (codepoints[pos] or 10) == 10 then
					if direction > 0 then  pos = pos-1  end
					break
				end
			end

			return clamp(pos, 0, len)
		end
	end



	local function updateWrap(field)
		local text = field:getVisibleText()
		if field.lastWrappedText == text then  return  end

		field.lastWrappedText = text

		if field:isMultiline() then
			field.wrappedWidth = 0

			local wrapWidth = (field.type == "multiwrap") and field.width or 1/0
			local lineCount = 0
			local processed = 0

			for line, i in text:gmatch"([^\n]*)()" do
				if i > processed then
					processed = i

					if line == "" then
						lineCount                    = lineCount + 1
						field.wrappedText[lineCount] = ""
						field.softBreak[lineCount]   = false

					else
						local w, subLines  = field.font:getWrap(line, wrapWidth)
						local subLineCount = #subLines

						for subLineI, subLine in ipairs(subLines) do
							lineCount                    = lineCount + 1
							field.wrappedText[lineCount] = subLine
							field.softBreak[lineCount]   = subLineI < subLineCount
						end

						field.wrappedWidth = math.max(field.wrappedWidth, w)
					end
				end
			end

			for lineI = lineCount+1, #field.wrappedText do
				field.wrappedText[lineI] = nil
				field.softBreak[lineI]   = nil
			end

		else
			field.wrappedText[1] = text
			field.softBreak[1]   = false
			field.wrappedWidth   = field.font:getWidth(text)

			for lineI = 2, #field.wrappedText do
				field.wrappedText[lineI] = nil
				field.softBreak[lineI]   = nil
			end
		end

		--[[ @Debug
		print("--------------------------------")
		for i = 1, #field.wrappedText do
			print(i, field.softBreak[i], field.wrappedText[i])
		end
		--]]
	end



	local function getLineAlignmentOffset(field, line)
		if     field.alignment == "left"        then  return 0
		elseif field.width     == 1/0           then  return 0
		elseif field.type      == "multinowrap" then  return 0
		elseif field.alignment == "right"       then  return math.max(field.width-field.font:getWidth(line), 0)
		elseif field.alignment == "center"      then  return math.floor(.5 * math.max(field.width-field.font:getWidth(line), 0))
		else
			error(field.alignment)
		end
	end

	local function alignOnLine(field, line, x)
		return x + getLineAlignmentOffset(field, line)
	end

	local function unalignOnLine(field, line, x)
		return x - getLineAlignmentOffset(field, line)
	end

	-- cursorPosition, side = getCursorPositionAtX(field, line, x)
	-- side                 = -1 | 1
	local function getCursorPositionAtX(field, line, x)
		x = unalignOnLine(field, line, x)

		if line == "" or x <= 0 then
			return 0
		elseif x <= field.font:getWidth(line:sub(1, utf8GetEndOffset(line, 1)))/2 then
			return 0
		end

		local lineW = field.font:getWidth(line)
		if x >= lineW then
			return utf8.len(line)
		end

		-- Binary search.
		local posL = 1
		local posR = utf8.len(line)

		local closestDist = math.abs(x - lineW)
		local closestPos  = posR

		while posL < posR do
			local pos      = math.floor((posL+posR)/2)
			local linePart = line:sub(1, utf8GetEndOffset(line, pos)) -- @Memory (We could maybe use font:getKerning() in LÖVE 11.4+ to traverse one character at a time. Might be slower though.)

			local dx = x - field.font:getWidth(linePart)
			if dx == 0 then  return pos  end -- x is exactly at the cursor's position.

			local dist = math.abs(dx)

			if dist < closestDist then
				closestDist = dist
				closestPos  = pos
			end

			if dx < 0 then
				posR = pos
			else
				posL = pos
				if posL == posR-1 then  break  end -- Because pos is rounded down we'd get stuck without this (as pos would be posL again and again).
			end
		end

		return closestPos
	end

	local function getLineStartPosition(field, targetLineI)
		local linePos1 = 1

		for lineI = 1, targetLineI-1 do
			linePos1 = linePos1 + utf8.len(field.wrappedText[lineI])

			if not field.softBreak[lineI] then
				linePos1 = linePos1 + 1
			end
		end

		return linePos1
	end

	-- cursorPosition, visualLineIndex, visualLineIndexUnclamped = getCursorPositionAtCoordinates( field, x, y )
	local function getCursorPositionAtCoordinates(field, x, y)
		updateWrap(field)

		if not field:isMultiline() then
			return getCursorPositionAtX(field, field.wrappedText[1], x), 1, 1
		end

		local fontH          = field.font:getHeight()
		local lineDist       = math.ceil(fontH*field.font:getLineHeight())
		local lineSpace      = lineDist - fontH
		local lineIUnclamped = math.floor(1 + (y+lineSpace/2) / lineDist)
		local lineI          = clamp(lineIUnclamped, 1, #field.wrappedText)
		local line           = field.wrappedText[lineI]

		if not line then  return 0, 0, lineIUnclamped  end

		local linePos1  = getLineStartPosition(field, lineI)
		local posOnLine = getCursorPositionAtX(field, line, x)

		return linePos1+posOnLine-1, lineI, lineIUnclamped
	end

	-- line, positionOnLine, lineIndex, linePosition1, linePosition2 = getLineInfoAtPosition( field, position )
	local function getLineInfoAtPosition(field, pos)
		updateWrap(field)

		pos            = math.min(pos, utf8.len(field.text))
		local linePos1 = 1

		for lineI, line in ipairs(field.wrappedText) do
			local linePos2  = linePos1 + utf8.len(line) - 1
			local softBreak = field.softBreak[lineI]

			if pos <= (softBreak and linePos2-1 or linePos2) then -- Any trailing newline counts as being on the next line.
				return line, pos-linePos1+1, lineI, linePos1, linePos2
			end

			linePos1 = linePos2 + (softBreak and 1 or 2) -- Jump over any newline.
		end

		-- We should never get here!
		return getLineInfoAtPosition(field, 0)
	end



	local LCTRL = isMac and "lgui" or "lctrl"
	local RCTRL = isMac and "rgui" or "rctrl"

	-- modKeys = getModKeys( )
	-- modKeys = "cas" | "ca" | "cs" | "as" | "c" | "a" | "s" | "" | "^cas" | "^ca" | "^cs" | "^as" | "^c" | "^a" | "^s" | "^"
	local function getModKeys()
		local c = LK.isDown(LCTRL,    RCTRL   )
		local a = LK.isDown("lalt",   "ralt"  )
		local s = LK.isDown("lshift", "rshift")

		if isMac and LK.isDown("lctrl", "rctrl") then
			if     c and a and s then  return "^cas"
			elseif c and a       then  return "^ca"
			elseif c and s       then  return "^cs"
			elseif a and s       then  return "^as"
			elseif c             then  return "^c"
			elseif a             then  return "^a"
			elseif s             then  return "^s"
			else                       return "^"  end
		end

		if     c and a and s then  return "cas"
		elseif c and a       then  return "ca"
		elseif c and s       then  return "cs"
		elseif a and s       then  return "as"
		elseif c             then  return "c"
		elseif a             then  return "a"
		elseif s             then  return "s"
		else                       return ""  end
	end



	local function limitScroll(field)
		local limitX, limitY = field:getScrollLimits()
		field.scrollX        = clamp(field.scrollX, 0, limitX)
		field.scrollY        = clamp(field.scrollY, 0, limitY)
	end



	local function applyFilter(field, s)
		local filterFunc = field.filterFunction
		if not filterFunc then  return s  end

		s = s:gsub(utf8.charpattern, function(c)
			if filterFunc(c) then  return ""  end
		end)

		return s
	end



	-- pushHistory( field, group|nil )
	local function pushHistory(field, group)
		local history = field.editHistory
		local i, state

		-- Never save history for password fields.
		if field.type == "password" then
			i     = 1
			state = history[1]

		-- Update last entry if group matches.
		elseif group and group == field.editHistoryGroup then
			i     = field.editHistoryIndex
			state = history[i]

		-- History limit reached.
		elseif field.editHistoryIndex >= field.editHistoryMax then
			i          = field.editHistoryIndex
			state      = table.remove(history, 1)
			history[i] = state

		-- Expand history.
		else
			i          = field.editHistoryIndex + 1
			state      = {}
			history[i] = state
		end

		for i = i+1, #history do
			history[i] = nil
		end

		state.text           = field.text
		state.cursorPosition = field.cursorPosition
		state.selectionStart = field.selectionStart
		state.selectionEnd   = field.selectionEnd

		field.editHistoryIndex = i
		field.editHistoryGroup = group

		field.navigationTargetX = nil
	end



	local function finilizeHistoryGroup(field)
		field.editHistoryGroup = nil
	end



	local function applyHistoryState(field, offset)
		field.editHistoryIndex = field.editHistoryIndex + offset

		local state = field.editHistory[field.editHistoryIndex] or assert(false)

		field.text           = state.text
		field.cursorPosition = state.cursorPosition
		field.selectionStart = state.selectionStart
		field.selectionEnd   = state.selectionEnd

		field.navigationTargetX = nil
	end

	-- @UX: Improve how the cursor and selection are restored on undo.
	local function undoEdit(field)
		if field.editHistoryIndex == 1 then  return  end

		finilizeHistoryGroup(field)
		applyHistoryState(field, -1)

		field:resetBlinking()
		field:scrollToCursor()
	end

	local function redoEdit(field)
		if field.editHistoryIndex == #field.editHistory then  return  end

		finilizeHistoryGroup(field)
		applyHistoryState(field, 1)

		field:resetBlinking()
		field:scrollToCursor()
	end



	--==============================================================
	--= Exported functions =========================================
	--==============================================================



	-- InputField( [ initialText="", type:InputFieldType="normal" ] )
	local function newInputField(text, fieldType)
		if not (fieldType == nil or fieldType == "normal" or fieldType == "password" or fieldType == "multiwrap" or fieldType == "multinowrap") then
			error("[InputField] Invalid field type '"..tostring(fieldType).."'.", 2)
		end
		fieldType = fieldType or "normal"

		local field = setmetatable({
			type = fieldType,

			blinkTimer = LT.getTime(),

			cursorPosition = 0,
			selectionStart = 0,
			selectionEnd   = 0,

			clickCount               = 1, -- This and multiClickMaxDelay are only used if the 'pressCount' argument isn't supplied to mousepressed().
			multiClickMaxDelay       = 0.40,
			multiClickExpirationTime = 0.00,
			multiClickLastX          = 0.0,
			multiClickLastY          = 0.0,

			editHistoryMax   = 100,
			editHistory      = {},
			editHistoryIndex = 1,
			editHistoryGroup = nil, -- nil | "insert" | "remove"

			font                  = require"love.graphics".getFont(),
			fontFilteringIsActive = false,

			filterFunction = nil,

			mouseScrollSpeedX = 6.0, -- Per pixel per second.
			mouseScrollSpeedY = 8.0,

			wheelScrollSpeedX = 1.0, -- Per second. Relative to the font size.
			wheelScrollSpeedY = 1.0,

			dragMode           = "", -- "" | "character" | "word" | "line"
			dragStartPosition1 = 0,
			dragStartPosition2 = 0,
			dragLastX          = 0,
			dragLastY          = 0,

			editingEnabled = true,

			scrollX = 0.0,
			scrollY = 0.0,

			text = "",

			width  = 1/0,
			height = 1/0,

			alignment = "left",

			navigationTargetX = nil, -- Used when navigating vertically. Nil means need recalculation.

			-- These are updated by updateWrap():
			lastWrappedText = "",
			wrappedText     = {""}, -- []line
			softBreak       = {false}, -- []bool
			wrappedWidth    = 0,
		}, InputField)

		text       = cleanString(field, tostring(text == nil and "" or text))
		field.text = text
		local len  = utf8.len(text)

		field.editHistory[1] = {
			text           = text,
			cursorPosition = len,
			selectionStart = 0,
			selectionEnd   = len,
		}

		return field
	end



	-- phase = field:getBlinkPhase( )
	-- Get current phase for an animated cursor.
	-- The value is the time since the last blink reset.
	function InputField.getBlinkPhase(field)
		return LT.getTime() - field.blinkTimer
	end

	-- field:resetBlinking( )
	function InputField.resetBlinking(field)
		field.blinkTimer = LT.getTime()
	end



	-- position = field:getCursor( )
	-- Position 0 is before first character, position 1 is between first and second etc.
	function InputField.getCursor(field)
		return field.cursorPosition
	end

	-- field:setCursor( position [, selectionSideToAnchor:SelectionSide=none ] )
	-- Position 0 is before first character, position 1 is between first and second etc.
	function InputField.setCursor(field, pos, selSideAnchor)
		finilizeHistoryGroup(field)

		pos                  = clamp(pos, 0, field:getTextLength())
		field.cursorPosition = pos

		local selStart       = (selSideAnchor == "start" and field.selectionStart or pos)
		local selEnd         = (selSideAnchor == "end"   and field.selectionEnd   or pos)
		field.selectionStart = math.min(selStart, selEnd)
		field.selectionEnd   = math.max(selStart, selEnd)

		field:resetBlinking()
		field:scrollToCursor()
	end

	local function setCursorPosition(field, pos, selSideAnchor, eraseNavTargetX)
		field:setCursor(pos, selSideAnchor)
		if eraseNavTargetX then
			field.navigationTargetX = nil
		end
	end

	-- field:moveCursor( steps [, selectionSideToAnchor:SelectionSide=none ] )
	-- 'steps' may be positive or negative.
	function InputField.moveCursor(field, steps, selSideAnchor)
		setCursorPosition(field, field.cursorPosition+steps, selSideAnchor, true)
	end

	-- side:SelectionSide = field:getCursorSelectionSide( )
	function InputField.getCursorSelectionSide(field)
		return (field.cursorPosition < field.selectionEnd and "start" or "end")
	end

	-- side:SelectionSide = field:getAnchorSelectionSide( )
	function InputField.getAnchorSelectionSide(field)
		return (field.cursorPosition < field.selectionEnd and "end" or "start")
	end



	-- font = field:getFont( )
	function InputField.getFont(field)
		return field.font
	end

	-- field:setFont( font )
	-- The font is used for text measurements.
	function InputField.setFont(field, font)
		if field.font == font then  return  end

		if not font then  error("Missing font argument.", 2)  end

		field.font            = font
		field.lastWrappedText = "\0" -- Make sure wrappedText updates.

		limitScroll(field)
	end



	-- scrollX, scrollY = field:getScroll( )
	-- scrollX = field:getScrollX( )
	-- scrollY = field:getScrollY( )
	function InputField.getScroll(field)
		return field.scrollX, field.scrollY
	end
	function InputField.getScrollX(field)
		return field.scrollX
	end
	function InputField.getScrollY(field)
		return field.scrollY
	end

	-- field:setScroll( scrollX, scrollY )
	-- field:setScrollX( scrollX )
	-- field:setScrollY( scrollY )
	function InputField.setScroll(field, scrollX, scrollY)
		field.scrollX = scrollX
		field.scrollY = scrollY
		limitScroll(field)
	end
	function InputField.setScrollX(field, scrollX)
		field.scrollX = scrollX
		limitScroll(field)
	end
	function InputField.setScrollY(field, scrollY)
		field.scrollY = scrollY
		limitScroll(field)
	end

	-- field:scroll( deltaX, deltaY )
	function InputField.scroll(field, dx, dy)
		field.scrollX = field.scrollX + dx
		field.scrollY = field.scrollY + dy
		limitScroll(field)
	end

	-- field:scrollToCursor( )
	function InputField.scrollToCursor(field)
		local line, posOnLine, lineI = getLineInfoAtPosition(field, field.cursorPosition)

		do
			local fontH    = field.font:getHeight()
			local lineDist = math.ceil(fontH*field.font:getLineHeight())
			local y        = (lineI - 1) * lineDist
			field.scrollY  = clamp(field.scrollY, y-field.height+fontH, y)
		end

		if not field:isMultiline() then
			local visibleText = field:getVisibleText()
			local preText     = visibleText:sub(1, utf8GetEndOffset(visibleText, field.cursorPosition))
			local x           = field.font:getWidth(preText)
			field.scrollX     = clamp(field.scrollX, x-field.width, x)

		elseif field.type == "multinowrap" then
			local preText = line:sub(1, utf8GetEndOffset(line, posOnLine))
			local x       = field.font:getWidth(preText)
			field.scrollX = clamp(field.scrollX, x-field.width, x)
		end

		limitScroll(field)
	end



	-- limitX, limitY = field:getScrollLimits( )
	function InputField.getScrollLimits(field)
		updateWrap(field)

		local fontH    = field.font:getHeight()
		local lineDist = math.ceil(fontH*field.font:getLineHeight())

		return (field.type == "multiwrap") and 0 or math.max((field.wrappedWidth                   ) - field.width,  0),
		       (not field:isMultiline()  ) and 0 or math.max(((#field.wrappedText-1)*lineDist+fontH) - field.height, 0)
	end



	-- speedX, speedY = field:getMouseScrollSpeed( )
	-- speedX = field:getMouseScrollSpeedX( )
	-- speedY = field:getMouseScrollSpeedY( )
	function InputField.getMouseScrollSpeed(field)
		return field.mouseScrollSpeedX, field.mouseScrollSpeedY
	end
	function InputField.getMouseScrollSpeedX(field)
		return field.mouseScrollSpeedX
	end
	function InputField.getMouseScrollSpeedY(field)
		return field.mouseScrollSpeedY
	end

	--
	-- field:setMouseScrollSpeed( speedX [, speedY=speedX ] )
	-- field:setMouseScrollSpeedX( speedX )
	-- field:setMouseScrollSpeedY( speedY )
	--
	-- Also see setWheelScrollSpeed().
	--
	function InputField.setMouseScrollSpeed(field, speedX, speedY)
		speedY                  = speedY or speedX
		field.mouseScrollSpeedX = math.max(speedX, 0)
		field.mouseScrollSpeedY = math.max(speedY, 0)
	end
	function InputField.setMouseScrollSpeedX(field, speedX)
		field.mouseScrollSpeedX = math.max(speedX, 0)
	end
	function InputField.setMouseScrollSpeedY(field, speedY)
		field.mouseScrollSpeedY = math.max(speedY, 0)
	end



	-- speedX, speedY = field:getWheelScrollSpeed( )
	-- speedX = field:getWheelScrollSpeedX( )
	-- speedY = field:getWheelScrollSpeedY( )
	function InputField.getWheelScrollSpeed(field)
		return field.wheelScrollSpeedX, field.wheelScrollSpeedY
	end
	function InputField.getWheelScrollSpeedX(field)
		return field.wheelScrollSpeedX
	end
	function InputField.getWheelScrollSpeedY(field)
		return field.wheelScrollSpeedY
	end

	-- field:setWheelScrollSpeed( speedX [, speedY=speedX ] )
	-- field:setWheelScrollSpeedX( speedX )
	-- field:setWheelScrollSpeedY( speedY )
	function InputField.setWheelScrollSpeed(field, speedX, speedY)
		speedY                  = speedY or speedX
		field.wheelScrollSpeedX = math.max(speedX, 0)
		field.wheelScrollSpeedY = math.max(speedY, 0)
	end
	function InputField.setWheelScrollSpeedX(field, speedX)
		field.wheelScrollSpeedX = math.max(speedX, 0)
	end
	function InputField.setWheelScrollSpeedY(field, speedY)
		field.wheelScrollSpeedY = math.max(speedY, 0)
	end



	-- delay = field:getDoubleClickMaxDelay( )
	function InputField.getDoubleClickMaxDelay(field)
		return field.multiClickMaxDelay
	end

	-- field:setDoubleClickMaxDelay( delay )
	-- Note: This value is only used if the 'pressCount' argument isn't supplied to mousepressed().
	function InputField.setDoubleClickMaxDelay(field, delay)
		field.multiClickMaxDelay = math.max(delay, 0)
	end



	-- fromPosition, toPosition = field:getSelection( )
	-- Position 0 is before first character, position 1 is between first and second etc.
	function InputField.getSelection(field)
		return field.selectionStart, field.selectionEnd
	end

	-- field:setSelection( fromPosition, toPosition [, cursorAlign:TextCursorAlignment="right" ] )
	-- Position 0 is before first character, position 1 is between first and second etc.
	function InputField.setSelection(field, from, to, cursorAlign)
		finilizeHistoryGroup(field)

		local len = field:getTextLength()
		from = clamp(from, 0, len)
		to   = clamp(to,   0, len)

		from, to = math.min(from, to), math.max(from, to)

		field.selectionStart = from
		field.selectionEnd   = to
		field.cursorPosition = (cursorAlign == "left") and from or to

		field:resetBlinking()
		field:scrollToCursor()
	end

	-- field:selectAll( )
	function InputField.selectAll(field)
		field:setSelection(0, field:getTextLength())
	end

	-- text = field:getSelectedText( )
	function InputField.getSelectedText(field)
		local text = field.text
		return text:sub(
			utf8.offset(text, field.selectionStart+1),
			utf8GetEndOffset(text, field.selectionEnd)
		)
	end

	-- text = field:getSelectedVisibleText( )
	function InputField.getSelectedVisibleText(field)
		return (field.type == "password") and ("*"):rep(field.selectionEnd-field.selectionStart) or field:getSelectedText()
	end



	-- text = field:getText( )
	-- The text is the value of the field.
	-- Also see field:getVisibleText().
	function InputField.getText(field)
		return field.text
	end

	-- text = field:getVisibleText( )
	-- Returns asterisks for password fields instead of the actual text value.
	-- Also see field:getText().
	function InputField.getVisibleText(field)
		return (field.type == "password") and ("*"):rep(field:getTextLength()) or field.text -- @Speed: Maybe cache the repeated text.
	end

	-- field:setText( text )
	function InputField.setText(field, text)
		text = cleanString(field, tostring(text))
		if field.text == text then  return  end

		local len = utf8.len(text)

		field.text           = text
		field.cursorPosition = math.min(len, field.cursorPosition)
		field.selectionStart = math.min(len, field.selectionStart)
		field.selectionEnd   = math.min(len, field.selectionEnd)

		pushHistory(field, nil)
	end



	-- length = field:getTextLength( )
	-- Returns the number of characters in the UTF-8 text string.
	function InputField.getTextLength(field)
		return utf8.len(field.text)
	end



	-- offsetX, offsetY = field:getTextOffset( )
	-- Note: The coordinates are relative to the field's position.
	function InputField.getTextOffset(field)
		return -math.floor(field.scrollX),
		       -math.floor(field.scrollY)
	end



	-- x, y, height = field:getCursorLayout( )
	-- Note: The coordinates are relative to the field's position.
	function InputField.getCursorLayout(field)
		local line, posOnLine, lineI = getLineInfoAtPosition(field, field.cursorPosition)

		local preText  = line:sub(1, utf8GetEndOffset(line, posOnLine))
		local fontH    = field.font:getHeight()
		local lineDist = math.ceil(fontH*field.font:getLineHeight())

		return alignOnLine(field, line, field.font:getWidth(preText)) - math.floor(field.scrollX),
		       (lineI-1)*lineDist                                     - math.floor(field.scrollY),
		       fontH
	end



	-- width, height = field:getDimensions( )
	-- width  = field:getWidth( )
	-- height = field:getHeight( )
	function InputField.getDimensions(field)
		return field.width, field.height
	end
	function InputField.getWidth(field)
		return field.width
	end
	function InputField.getHeight(field)
		return field.height
	end

	-- field:setDimensions( width, height )
	-- field:setDimensions( nil, nil ) -- Disable scrolling on both axes.
	-- Enable/disable horizontal/vertical scrolling.
	function InputField.setDimensions(field, w, h)
		w = math.max((w or 1/0), 0)
		h = math.max((h or 1/0), 0)
		if field.width == w and field.height == h then  return  end

		field.width           = w
		field.height          = h
		field.lastWrappedText = "\0" -- Make sure wrappedText updates.

		limitScroll(field)
	end

	-- field:setWidth( width )
	-- field:setWidth( nil ) -- Disable scrolling on the x axis.
	-- Enable/disable horizontal scrolling.
	function InputField.setWidth(field, w)
		w = math.max((w or 1/0), 0)
		if field.width == w then  return  end

		field.width           = w
		field.lastWrappedText = "\0" -- Make sure wrappedText updates.

		limitScroll(field)
	end

	-- field:setHeight( height )
	-- field:setHeight( nil ) -- Disable scrolling on the y axis.
	-- Enable/disable vertical scrolling.
	function InputField.setHeight(field, h)
		h = math.max((h or 1/0), 0)
		if field.height == h then  return  end

		field.height = h -- Note: wrappedText does not need to update because of this change.

		limitScroll(field)
	end



	-- width, height = field:getTextDimensions( )
	function InputField.getTextDimensions(field)
		updateWrap(field)

		local fontH    = field.font:getHeight()
		local lineDist = math.ceil(fontH*field.font:getLineHeight())

		return field.wrappedWidth, (#field.wrappedText-1)*lineDist+fontH
	end

	-- width = field:getTextWidth( )
	function InputField.getTextWidth(field)
		updateWrap(field)
		return field.wrappedWidth
	end

	-- height = field:getTextHeight( )
	function InputField.getTextHeight(field)
		updateWrap(field)

		local fontH    = field.font:getHeight()
		local lineDist = math.ceil(fontH*field.font:getLineHeight())

		return (#field.wrappedText - 1) * lineDist + fontH
	end



	-- field:insert( text )
	-- Insert text at cursor, or replace selected text.
	function InputField.insert(field, newText)
		newText = cleanString(field, tostring(newText))

		local text     = field.text
		local selStart = field.selectionStart
		local iLeft    = utf8GetEndOffset(text, selStart)
		local iRight   = utf8.offset(text, field.selectionEnd+1)

		if newText == "" then
			field.text           = text:sub(1, iLeft) .. text:sub(iRight)
			field.cursorPosition = selStart
			field.selectionEnd   = selStart

			pushHistory(field, "remove")

		else
			field.text           = text:sub(1, iLeft) .. newText .. text:sub(iRight)
			field.cursorPosition = selStart + utf8.len(newText)
			field.selectionStart = field.cursorPosition
			field.selectionEnd   = field.cursorPosition

			pushHistory(field, "insert")
		end

		field:resetBlinking()
		field:scrollToCursor()
	end



	-- field:reset( [ initialText="" ] )
	function InputField.reset(field, text)
		field:releaseMouse()

		field.cursorPosition = 0
		field.selectionStart = 0
		field.selectionEnd   = 0

		field.clickCount               = 1
		field.multiClickExpirationTime = 0

		field.navigationTargetX = nil

		field:setText(text == nil and "" or text)
		field:clearHistory()
	end



	--
	-- bool = field:isFontFilteringActive( )
	-- field:setFontFilteringActive( bool )
	--
	-- Filter out characters that the font doesn't have glyphs for.
	--
	function InputField.isFontFilteringActive(field)          return field.fontFilteringIsActive   end
	function InputField.setFontFilteringActive(field, state)  field.fontFilteringIsActive = state  end

	-- bool = field:isEditable( )
	-- field:setEditable( bool )
	-- Enable/disable read-only mode.
	function InputField.isEditable(field)          return field.editingEnabled   end
	function InputField.setEditable(field, state)  field.editingEnabled = state  end



	-- type:InputFieldType = field:getType( )
	function InputField.getType(field)
		return field.type
	end

	-- field:setType( type:InputFieldType )
	function InputField.setType(field, fieldType)
		if field.type == fieldType then  return  end

		if not (fieldType == "normal" or fieldType == "password" or fieldType == "multiwrap" or fieldType == "multinowrap") then
			error("[InputField] Invalid field type '"..tostring(fieldType).."'.", 2)
		end

		local wasMultiline = field:isMultiline()

		field.type            = fieldType
		field.lastWrappedText = "\0" -- Make sure wrappedText updates.

		if wasMultiline and not field:isMultiline() then
			field:reset(cleanString(field, field.text)) -- Removes newlines (including from history).
		end
	end

	-- bool = field:isPassword( )
	-- bool = field:isMultiline( )
	function InputField.isPassword(field)   return field.type == "password"  end
	function InputField.isMultiline(field)  return field.type == "multiwrap" or field.type == "multinowrap"  end



	-- filterFunction = field:getFilter( )
	function InputField.getFilter(field)
		return field.filterFunction
	end

	--
	-- setFilter( filterFunction )
	-- setFilter( nil ) -- Remove filter.
	-- removeCharacter:bool = filterFunction( utf8Character )
	--
	-- Filter out entered characters.
	--
	-- Note: The filter is only applied in text input events, like textinput().
	-- Functions like setText() are unaffected (unlike with font filtering).
	--
	function InputField.setFilter(field, filterFunc)
		field.filterFunction = filterFunc
	end



	-- field:clearHistory( )
	function InputField.clearHistory(field)
		local history = field.editHistory

		history[1] = history[#history]
		for i = 2, #history do  history[i] = nil  end

		field.editHistoryGroup = nil
		field.editHistoryIndex = 1
	end



	-- maxHistory = field:getMaxHistory( )
	function InputField.getMaxHistory(field)
		return field.editHistoryMax
	end

	-- field:setMaxHistory( maxHistory )
	-- Limit entry count for the undo/redo history.
	function InputField.setMaxHistory(field, maxHistory)
		maxHistory = math.max(maxHistory, 1)
		if maxHistory == field.editHistoryMax then  return  end

		field:clearHistory()
		field.editHistoryMax = maxHistory
	end



	-- horizontally, vertically = field:canScroll( )
	-- Note: Scrolling is enabled/disabled by setDimensions() and company.
	function InputField.canScroll(field)
		return field:canScrollHorizontally(), field:canScrollVertically()
	end

	-- horizontally = field:canScrollHorizontally( )
	-- Note: Scrolling is enabled/disabled by setDimensions() or setWidth().
	function InputField.canScrollHorizontally(field)
		return field.type ~= "multiwrap"
	end

	-- vertically = field:canScrollVertically( )
	-- Note: Scrolling is enabled/disabled by setDimensions() or setHeight().
	function InputField.canScrollVertically(field)
		return field.type == "multiwrap" or field.type == "multinowrap"
	end



	-- horizontalOffset, horizontalCoverage, verticalOffset, verticalCoverage = field:getScrollHandles( )
	-- Values are between 0 and 1.
	function InputField.getScrollHandles(field)
		local textW,      textH      = field:getTextDimensions()
		local scrollX,    scrollY    = field:getScroll()
		local maxScrollX, maxScrollY = field:getScrollLimits()

		local hCoverage = math.min(field.width  / textW, 1)
		local vCoverage = math.min(field.height / textH, 1)
		local hOffset   = (maxScrollX == 0) and 0 or (scrollX / maxScrollX) * (1 - hCoverage)
		local vOffset   = (maxScrollY == 0) and 0 or (scrollY / maxScrollY) * (1 - vCoverage)

		return hOffset, hCoverage, vOffset, vCoverage
	end

	-- offset, coverage = field:getScrollHandleHorizontal( )
	-- The values (and their sum) are between 0 and 1.
	function InputField.getScrollHandleHorizontal(field)
		local hOffset, hCoverage, vOffset, vCoverage = field:getScrollHandles()
		return hOffset, hCoverage
	end

	-- offset, coverage = field:getScrollHandleVertical( )
	-- The values (and their sum) are between 0 and 1.
	function InputField.getScrollHandleVertical(field)
		local hOffset, hCoverage, vOffset, vCoverage = field:getScrollHandles()
		return vOffset, vCoverage
	end



	-- alignment:TextAlignment = field:getAlignment( )
	function InputField.getAlignment(field)
		return field.alignment
	end

	-- field:setAlignment( alignment:TextAlignment )
	-- Note: The field's width must be set for alignment to work. (See field:setDimensions() or field:setWidth().)
	-- Note: Alignment doesn't work for fields of type "multinowrap".
	function InputField.setAlignment(field, alignment)
		field.alignment = alignment
	end



	-- line = field:getVisibleLine( lineIndex )
	-- Returns nil if lineIndex is invalid.
	function InputField.getVisibleLine(field, lineI)
		updateWrap(field)
		return field.wrappedText[lineI]
	end

	-- count = field:getVisibleLineCount( )
	function InputField.getVisibleLineCount(field)
		updateWrap(field)
		return #field.wrappedText
	end



	--
	-- info = field:getInfoAtCoords( x, y [, info={} ] )
	--
	-- Info table fields:
	--   cursorPosition    -- integer  Cursor position.
	--   characterPosition -- integer  Character position. (Is set even if hasText is false.)
	--   hasText           -- boolean  Whether there's text directly at the coordinates.
	--   lineIndex         -- integer  Visible line index.
	--   linePosition      -- integer  Visible line start position.
	--
	-- Note: The coordinates must be relative to the field's position on the screen.
	--
	function InputField.getInfoAtCoords(field, x, y, info)
		updateWrap(field)

		info = info or {}

		if field.text == "" then
			info.cursorPosition    = 0
			info.characterPosition = 1
			info.hasText           = false
			info.lineIndex         = 1
			info.linePosition      = 1

		else
			local curPos, visualLineI, visualLineIUnclamped = getCursorPositionAtCoordinates(field, x+field.scrollX, y+field.scrollY)

			local line, curPosOnLine, lineI, linePos1, linePos2 = getLineInfoAtPosition(field, curPos)

			local preText              = line:sub(1, utf8GetEndOffset(line, curPosOnLine)) -- @Speed @Memory
			local preTextW             = field.font:getWidth(preText)
			local charStartIsLeftOfCur = (alignOnLine(field, line, preTextW-field.scrollX) <= x)
			local charPosOnLine        = clamp(curPosOnLine+(charStartIsLeftOfCur and 1 or 0), 1, linePos2-linePos1+1)

			if lineI > visualLineI then
				-- We're right before a soft wrap.
				line, posOnLine, lineI, linePos1, linePos2 = getLineInfoAtPosition(field, curPos-1)
				charPosOnLine                              = linePos2 - linePos1 + 1
			end

			local xInText = unalignOnLine(field, line, x+field.scrollX)

			info.cursorPosition    = curPos
			info.characterPosition = math.min(linePos1+charPosOnLine-1, utf8.len(field.text))
			info.hasText           = field.wrappedText[visualLineIUnclamped] ~= nil and xInText >= 0 and xInText < field.font:getWidth(line)
			info.lineIndex         = lineI
			info.linePosition      = linePos1
		end

		return info
	end

	--
	-- info = field:getInfoAtCursor( cursorPosition [, info={} ] )
	--
	-- Info table fields:
	--   x            -- integer  X position.
	--   y            -- integer  Y/top position.
	--   height       -- integer  Line height.
	--   lineIndex    -- integer  Visible line index.
	--   linePosition -- integer  Visible line start position.
	--
	-- Note: The coordinates are relative to the field's position.
	--
	function InputField.getInfoAtCursor(field, pos, info)
		updateWrap(field)

		info = info or {}

		if field.text == "" then
			info.x            = alignOnLine(field, "", 0)
			info.y            = 0
			info.height       = field.font:getHeight()
			info.lineIndex    = 1
			info.linePosition = 1

		else
			pos = clamp(pos, 0, utf8.len(field.text))

			local line, curPosOnLine, lineI, linePos1, linePos2 = getLineInfoAtPosition(field, pos)

			local savedCursorPosition = field.cursorPosition
			field.cursorPosition      = pos
			local x, y, h             = field:getCursorLayout()
			field.cursorPosition      = savedCursorPosition

			info.x            = x
			info.y            = y
			info.height       = h
			info.lineIndex    = lineI
			info.linePosition = linePos1
		end

		return info
	end

	--
	-- info = field:getInfoAtCharacter( characterPosition [, info={} ] )
	--
	-- Info table fields:
	--   character    -- string   The character (unobfuscated if field type is "password").
	--   x            -- integer  Character x/left position.
	--   y            -- integer  Character y/top position.
	--   width        -- integer  Character width.
	--   height       -- integer  Character/line height.
	--   lineIndex    -- integer  Visible line index.
	--   linePosition -- integer  Visible line start position.
	--
	-- Returns nil if characterPosition is invalid or points at a newline.
	-- Note: The coordinates are relative to the field's position.
	--
	function InputField.getInfoAtCharacter(field, pos, info)
		updateWrap(field)

		local text = field.text

		if
			text == "" or pos < 1 or pos > utf8.len(text) -- Error: Out-of-range!
			or utf8.codepoint(text, utf8.offset(text, pos)) == 10 -- Don't return info about newlines.
		then
			return nil
		end

		local line, curPosOnLine, lineI, linePos1, linePos2 = getLineInfoAtPosition(field, pos-1)

		local i1          = utf8.offset(line, curPosOnLine+1)
		local i2          = utf8GetEndOffset(line, curPosOnLine+1)
		local visibleChar = line:sub(i1, i2)

		local preText = line:sub(1, i1-1) -- @Speed @Memory
		local x       = alignOnLine(field, line, field.font:getWidth(preText))

		local fontH    = field.font:getHeight()
		local lineDist = math.ceil(fontH*field.font:getLineHeight())
		local y        = (lineI-1) * lineDist

		info              = info or {}
		info.character    = (field.type == "password") and text:sub(utf8.offset(text, pos), utf8GetEndOffset(text, pos)) or visibleChar
		info.x            = x
		info.y            = y
		info.width        = field.font:getWidth(visibleChar)
		info.height       = fontH
		info.lineIndex    = lineI
		info.linePosition = linePos1

		return info
	end



	----------------------------------------------------------------



	-- field:update( deltaTime )
	function InputField.update(field, dt)
		if field.dragMode ~= "" then
			local mx         = field.dragLastX
			local my         = field.dragLastY
			local oldScrollX = field.scrollX
			local oldScrollY = field.scrollY
			local scrollX    = oldScrollX
			local scrollY    = oldScrollY
			local w          = field.width
			local h          = field.height

			field.scrollX = (mx < 0 and scrollX+field.mouseScrollSpeedX*mx*dt) or (mx > w and scrollX+field.mouseScrollSpeedX*(mx-w)*dt) or (scrollX)
			field.scrollY = (my < 0 and scrollY+field.mouseScrollSpeedY*my*dt) or (my > h and scrollY+field.mouseScrollSpeedY*(my-h)*dt) or (scrollY)
			limitScroll(field)

			if not (field.scrollX == oldScrollX and field.scrollY == oldScrollY) then
				field:mousemoved(mx, my) -- This should only update selection stuff.
			end
		end
	end



	-- eventWasHandled = field:mousepressed( mouseX, mouseY, mouseButton [, pressCount=auto ] )
	-- Note: The coordinates must be relative to the field's position on the screen.
	function InputField.mousepressed(field, mx, my, mbutton, pressCount)
		if mbutton ~= 1 then  return false  end

		-- Check if double click.
		if mbutton == 1 then
			local time = LT.getTime()

			if pressCount then
				-- void
			elseif
				time < field.multiClickExpirationTime
				and math.abs(field.multiClickLastX-mx) <= 1 -- @Incomplete: Make max distance into a setting? Also, shoud we use max distance even if pressCount is supplied?
				and math.abs(field.multiClickLastY-my) <= 1
			then
				pressCount = field.clickCount + 1
			else
				pressCount = 1
			end

			field.clickCount               = (pressCount == 1) and 1 or 2+(pressCount%2)
			field.multiClickExpirationTime = time + field.multiClickMaxDelay
			field.multiClickLastX          = mx
			field.multiClickLastY          = my

		else
			field.clickCount               = 1
			field.multiClickExpirationTime = 0
		end

		-- Handle mouse press.
		local pos = getCursorPositionAtCoordinates(field, mx+field.scrollX, my+field.scrollY)

		if field.clickCount == 3 then
			local pos1 = getNextHardLineBound(field.text, pos+1, -1)
			local pos2 = getNextHardLineBound(field.text, pos1,   1)

			field:setSelection(pos1, pos2)

			field.dragMode           = "line"
			field.dragStartPosition1 = pos1
			field.dragStartPosition2 = pos2
			field.dragLastX          = mx
			field.dragLastY          = my

		elseif field.clickCount == 2 then
			local visibleText = field:getVisibleText()
			local pos1        = getNextWordBound(visibleText, pos+1, -1)
			local pos2        = getNextWordBound(visibleText, pos1,   1)

			field:setSelection(pos1, pos2)

			field.dragMode           = "word"
			field.dragStartPosition1 = pos1
			field.dragStartPosition2 = pos2
			field.dragLastX          = mx
			field.dragLastY          = my

		elseif LK.isDown("lshift","rshift") then
			local anchorPos = (field:getAnchorSelectionSide() == "start" and field.selectionStart or field.selectionEnd)

			field:setSelection(pos, anchorPos, (pos < anchorPos and "left" or "right"))

			field.dragMode           = "character"
			field.dragStartPosition1 = anchorPos
			field.dragLastX          = mx
			field.dragLastY          = my

		else
			setCursorPosition(field, pos, nil, true)

			field.dragMode           = "character"
			field.dragStartPosition1 = pos
			field.dragLastX          = mx
			field.dragLastY          = my
		end

		return true
	end

	-- eventWasHandled = field:mousemoved( mouseX, mouseY )
	-- Note: The coordinates must be relative to the field's position on the screen.
	function InputField.mousemoved(field, mx, my)
		if field.dragMode == "" then  return false  end

		local scrollX = field.scrollX
		local scrollY = field.scrollY
		local pos     = getCursorPositionAtCoordinates(field, mx+field.scrollX, my+field.scrollY)

		if field.dragMode == "line" then
			-- Note: Visibility doesn't matter when selecting lines.
			local pos1 = getNextHardLineBound(field.text, pos+1, -1)
			local pos2 = getNextHardLineBound(field.text, pos1,   1)

			if pos1 < field.dragStartPosition1 then
				field:setSelection(pos1, field.dragStartPosition2, "left")
			else
				field:setSelection(field.dragStartPosition1, pos2, "right")
			end

		elseif field.dragMode == "word" then
			local visibleText = field:getVisibleText()
			local pos1        = getNextWordBound(visibleText, pos+1, -1)
			local pos2        = getNextWordBound(visibleText, pos1,   1)

			if pos1 < field.dragStartPosition1 then
				field:setSelection(pos1, field.dragStartPosition2, "left")
			else
				field:setSelection(field.dragStartPosition1, pos2, "right")
			end

		else
			field:setSelection(field.dragStartPosition1, pos, (pos < field.dragStartPosition1 and "left" or "right"))
		end

		field.scrollX = scrollX -- Prevent scrolling to cursor while dragging.
		field.scrollY = scrollY

		field.dragLastX = mx
		field.dragLastY = my
		return true
	end

	-- eventWasHandled = field:mousereleased( mouseX, mouseY, mouseButton )
	-- Note: The coordinates must be relative to the field's position on the screen.
	function InputField.mousereleased(field, mx, my, mbutton)
		if mbutton ~= 1         then  return false  end
		if field.dragMode == "" then  return false  end

		field.dragMode = ""

		field:scrollToCursor()
		return true
	end

	-- eventWasHandled = field:wheelmoved( deltaX, deltaY )
	function InputField.wheelmoved(field, dx, dy)
		if LK.isDown("lshift","rshift") then
			dx, dy = dy, dx
		end

		local fontH = field.font:getHeight()
		field:scroll(
			-dx * field.wheelScrollSpeedX*fontH,
			-dy * field.wheelScrollSpeedY*fontH
		)

		return true -- Always handle event (for now).
	end



	-- field:releaseMouse( )
	-- Release mouse buttons that are held down (i.e. stop drag-selecting).
	function InputField.releaseMouse(field)
		field.dragMode = ""
	end



	-- bool = field:isBusy( )
	-- Returns true if the user is currently drag-selecting.
	function InputField.isBusy(field)
		return field.dragMode ~= ""
	end



	local function action_moveCursorCharacterLeft(field, isRepeat)
		if field.selectionStart ~= field.selectionEnd then
			setCursorPosition(field, field.selectionStart, nil, true)
		else
			field:moveCursor(-1)
		end
		return true, false
	end
	local function action_moveCursorCharacterLeftAnchored(field, isRepeat)
		field:moveCursor(-1, field:getAnchorSelectionSide())
		return true, false
	end
	local function action_moveCursorWordLeft(field, isRepeat)
		setCursorPosition(field, getNextWordBound(field:getVisibleText(), field.cursorPosition, -1), nil, true)
		return true, false
	end
	local function action_moveCursorWordLeftAnchored(field, isRepeat)
		setCursorPosition(field, getNextWordBound(field:getVisibleText(), field.cursorPosition, -1), field:getAnchorSelectionSide(), true)
		return true, false
	end

	local function action_moveCursorCharacterRight(field, isRepeat)
		if field.selectionStart ~= field.selectionEnd then
			setCursorPosition(field, field.selectionEnd, nil, true)
		else
			field:moveCursor(1)
		end
		return true, false
	end
	local function action_moveCursorCharacterRightAnchored(field, isRepeat)
		field:moveCursor(1, field:getAnchorSelectionSide())
		return true, false
	end
	local function action_moveCursorWordRight(field, isRepeat)
		setCursorPosition(field, getNextWordBound(field:getVisibleText(), field.cursorPosition, 1), nil, true)
		return true, false
	end
	local function action_moveCursorWordRightAnchored(field, isRepeat)
		setCursorPosition(field, getNextWordBound(field:getVisibleText(), field.cursorPosition, 1), field:getAnchorSelectionSide(), true)
		return true, false
	end

	local function action_moveCursorLineStart(field, isRepeat)
		local line, posOnLine, lineI, linePos1, linePos2 = getLineInfoAtPosition(field, field.cursorPosition)
		if field.cursorPosition == linePos1-1 and field.softBreak[lineI-1] then
			line, posOnLine, lineI, linePos1, linePos2 = getLineInfoAtPosition(field, field.cursorPosition-1)
		end
		setCursorPosition(field, linePos1-1, nil, true)
		return true, false
	end
	local function action_moveCursorLineStartAnchored(field, isRepeat)
		local line, posOnLine, lineI, linePos1, linePos2 = getLineInfoAtPosition(field, field.cursorPosition)
		if field.cursorPosition == linePos1-1 and field.softBreak[lineI-1] then
			line, posOnLine, lineI, linePos1, linePos2 = getLineInfoAtPosition(field, field.cursorPosition-1)
		end
		setCursorPosition(field, linePos1-1, field:getAnchorSelectionSide(), true)
		return true, false
	end
	local function action_moveCursorDocumentStart(field, isRepeat)
		setCursorPosition(field, 0, nil, true)
		return true, false
	end
	local function action_moveCursorDocumentStartAnchored(field, isRepeat)
		setCursorPosition(field, 0, field:getAnchorSelectionSide(), true)
		return true, false
	end

	local function action_moveCursorLineEnd(field, isRepeat)
		local line, posOnLine, lineI, linePos1, linePos2 = getLineInfoAtPosition(field, field.cursorPosition)
		setCursorPosition(field, linePos2, nil, true)
		return true, false
	end
	local function action_moveCursorLineEndAnchored(field, isRepeat)
		local line, posOnLine, lineI, linePos1, linePos2 = getLineInfoAtPosition(field, field.cursorPosition)
		setCursorPosition(field, linePos2, field:getAnchorSelectionSide(), true)
		return true, false
	end
	local function action_moveCursorDocumentEnd(field, isRepeat)
		setCursorPosition(field, field:getTextLength(), nil, true)
		return true, false
	end
	local function action_moveCursorDocumentEndAnchored(field, isRepeat)
		setCursorPosition(field, field:getTextLength(), field:getAnchorSelectionSide(), true)
		return true, false
	end

	local function navigateByLine(field, dirY, doAnchor)
		if not field:isMultiline() then  return false  end

		local anchorSide = (doAnchor and field:getAnchorSelectionSide() or nil)

		-- Get info about the current line.
		local oldLine, oldPosOnLine, oldLineI, oldLinePos1, oldLinePos2 = getLineInfoAtPosition(field, field.cursorPosition)

		if dirY < 0 and oldLineI == 1 then
			-- setCursorPosition(field, 0, anchorSide, false) -- Eh, not sure it's good to navigate horizontally during vertical navigation.
			return true
		elseif dirY > 0 and oldLineI >= #field.wrappedText then
			-- setCursorPosition(field, utf8.len(field.text), anchorSide, false)
			return true
		end

		if not field.navigationTargetX then
			local linePart          = oldLine:sub(1, utf8GetEndOffset(oldLine, oldPosOnLine))
			field.navigationTargetX = alignOnLine(field, oldLine, field.font:getWidth(linePart))
		end

		-- Get info about the target line.
		local newLine, newPosOnLine, newLineI, newLinePos1, newLinePos2
		if dirY < 0 then
			newLine, newPosOnLine, newLineI, newLinePos1, newLinePos2 = getLineInfoAtPosition(field, oldLinePos1-2)
		else
			newLine, newPosOnLine, newLineI, newLinePos1, newLinePos2 = getLineInfoAtPosition(field, oldLinePos2+1)
		end

		local posOnLine = getCursorPositionAtX(field, newLine, field.navigationTargetX)

		-- Going from the end of a long line to the end of a short soft-wrapped line would put
		-- the cursor at the start of the previous long line or two lines down. No good!
		if field.softBreak[newLineI] and posOnLine == utf8.len(newLine) then
			posOnLine = posOnLine - 1
		end

		setCursorPosition(field, newLinePos1+posOnLine-1, anchorSide, false)
		return true
	end

	local function navigateByPage(field, dirY, doAnchor)
		local fontH      = field.font:getHeight()
		local lineDist   = math.ceil(fontH*field.font:getLineHeight())
		local walkCount  = math.max(math.floor(field.height/lineDist), 1)
		local anyHandled = false

		for i = 1, walkCount do
			local handled, _targetX = navigateByLine(field, dirY, doAnchor) -- @Speed @Memory
			if not handled then  break  end
			anyHandled = true
		end

		return anyHandled
	end

	local function action_moveCursorLineUp          (field, isRepeat)  return navigateByLine(field, -1, false), false  end
	local function action_moveCursorLineDown        (field, isRepeat)  return navigateByLine(field,  1, false), false  end
	local function action_moveCursorLineUpAnchored  (field, isRepeat)  return navigateByLine(field, -1, true ), false  end
	local function action_moveCursorLineDownAnchored(field, isRepeat)  return navigateByLine(field,  1, true ), false  end

	local function action_moveCursorPageUp          (field, isRepeat)  return navigateByPage(field, -1, false), false  end
	local function action_moveCursorPageDown        (field, isRepeat)  return navigateByPage(field,  1, false), false  end
	local function action_moveCursorPageUpAnchored  (field, isRepeat)  return navigateByPage(field, -1, true ), false  end
	local function action_moveCursorPageDownAnchored(field, isRepeat)  return navigateByPage(field,  1, true ), false  end

	local function action_insertNewline(field, isRepeat)
		if not field.editingEnabled then  return false, false  end
		if not field:isMultiline()  then  return false, false  end

		field:insert("\n")
		return true, true
	end

	local function action_deleteCharacterLeft(field, isRepeat)
		if not field.editingEnabled then
			return false, false

		elseif field.selectionStart ~= field.selectionEnd then
			-- void

		elseif field.cursorPosition == 0 then
			field:resetBlinking()
			field:scrollToCursor()
			return true, false

		else
			field.selectionStart = field.cursorPosition - 1
			field.selectionEnd   = field.cursorPosition
		end

		field:insert("")
		return true, true
	end
	local function action_deleteWordLeft(field, isRepeat)
		if not field.editingEnabled then
			return false, false
		elseif field.selectionStart ~= field.selectionEnd then
			-- void
		else
			field.cursorPosition = getNextWordBound(field:getVisibleText(), field.cursorPosition, -1)
			field.selectionStart = field.cursorPosition
		end
		field:insert("")
		return true, true
	end

	local function action_deleteCharacterRight(field, isRepeat)
		if not field.editingEnabled then
			return false, false

		elseif field.selectionStart ~= field.selectionEnd then
			-- void

		elseif field.cursorPosition == field:getTextLength() then
			field:resetBlinking()
			field:scrollToCursor()
			return true, false

		else
			field.selectionStart = field.cursorPosition
			field.selectionEnd   = field.cursorPosition + 1
		end

		field:insert("")
		return true, true
	end
	local function action_deleteWordRight(field, isRepeat)
		if not field.editingEnabled then
			return false, false
		elseif field.selectionStart ~= field.selectionEnd then
			-- void
		else
			field.cursorPosition = getNextWordBound(field:getVisibleText(), field.cursorPosition, 1)
			field.selectionEnd   = field.cursorPosition
		end
		field:insert("")
		return true, true
	end

	local function action_selectAll(field, isRepeat)
		field:selectAll()
		return true, false
	end

	local function action_copy(field, isRepeat)
		local text = field:getSelectedVisibleText()

		if text ~= "" then
			LS.setClipboardText(text)
			field:resetBlinking()
		end

		return true, false
	end

	local function action_cut(field, isRepeat)
		local text = field:getSelectedVisibleText()
		if text == "" then  return true, false  end

		LS.setClipboardText(text)

		if field.editingEnabled then
			field:insert("")
			return true, true
		else
			field:resetBlinking()
			return true, false
		end
	end

	local function action_paste(field, isRepeat)
		if not field.editingEnabled then  return false, false  end

		local text = cleanString(field, LS.getClipboardText())
		if text ~= "" then
			field:insert(applyFilter(field, text))
		end

		field:resetBlinking()
		return true, true
	end

	local function action_undo(field, isRepeat)
		if not field.editingEnabled then  return false, false  end

		-- @Robustness: Filter and/or font filter could have changed after the last edit.
		if field.type ~= "password" then  undoEdit(field)  end

		return true, true
	end
	local function action_redo(field, isRepeat)
		if not field.editingEnabled then  return false, false  end

		-- @Robustness: Filter and/or font filter could have changed after the last edit.
		if field.type ~= "password" then  redoEdit(field)  end

		return true, true
	end



	local keyHandlers = {
		[ "cas"]={}, [ "ca"]={}, [ "cs"]={}, [ "as"]={}, [ "c"]={}, [ "a"]={}, [ "s"]={}, [ ""]={},
		["^cas"]={}, ["^ca"]={}, ["^cs"]={}, ["^as"]={}, ["^c"]={}, ["^a"]={}, ["^s"]={}, ["^"]={}, -- macOS only.
	}

	local function bind(system, modKeys, key, action)
		if system == "all" or (system == "macos") == isMac then
			keyHandlers[modKeys][key] = action
		end
	end

	-- (Ctrl means Cmd and Alt means Option in macOS.)

	bind("all"    , ""   , "left"     , action_moveCursorCharacterLeft)
	bind("all"    , "s"  , "left"     , action_moveCursorCharacterLeftAnchored)
	bind("all"    , ""   , "right"    , action_moveCursorCharacterRight)
	bind("all"    , "s"  , "right"    , action_moveCursorCharacterRightAnchored)
	bind("macos"  , "^"  , "b"        , action_moveCursorCharacterLeft)
	bind("macos"  , "^"  , "f"        , action_moveCursorCharacterRight)

	bind("windows", "c"  , "left"     , action_moveCursorWordLeft)
	bind("windows", "cs" , "left"     , action_moveCursorWordLeftAnchored)
	bind("windows", "c"  , "right"    , action_moveCursorWordRight)
	bind("windows", "cs" , "right"    , action_moveCursorWordRightAnchored)
	bind("macos"  , "a"  , "left"     , action_moveCursorWordLeft)
	bind("macos"  , "as" , "left"     , action_moveCursorWordLeftAnchored)
	bind("macos"  , "a"  , "right"    , action_moveCursorWordRight)
	bind("macos"  , "as" , "right"    , action_moveCursorWordRightAnchored)

	bind("all"    , ""   , "home"     , action_moveCursorLineStart)
	bind("all"    , "s"  , "home"     , action_moveCursorLineStartAnchored)
	bind("all"    , ""   , "end"      , action_moveCursorLineEnd)
	bind("all"    , "s"  , "end"      , action_moveCursorLineEndAnchored)
	bind("macos"  , "c"  , "left"     , action_moveCursorLineStart)
	bind("macos"  , "cs" , "left"     , action_moveCursorLineStartAnchored)
	bind("macos"  , "c"  , "right"    , action_moveCursorLineEnd)
	bind("macos"  , "cs" , "right"    , action_moveCursorLineEndAnchored)

	bind("all"    , "c"  , "home"     , action_moveCursorDocumentStart)
	bind("all"    , "cs" , "home"     , action_moveCursorDocumentStartAnchored)
	bind("all"    , "c"  , "end"      , action_moveCursorDocumentEnd)
	bind("all"    , "cs" , "end"      , action_moveCursorDocumentEndAnchored)
	bind("macos"  , "c"  , "up"       , action_moveCursorDocumentStart)
	bind("macos"  , "cs" , "up"       , action_moveCursorDocumentStartAnchored)
	bind("macos"  , "c"  , "down"     , action_moveCursorDocumentEnd)
	bind("macos"  , "cs" , "down"     , action_moveCursorDocumentEndAnchored)

	bind("all"    , ""   , "up"       , action_moveCursorLineUp)
	bind("all"    , "s"  , "up"       , action_moveCursorLineUpAnchored)
	bind("all"    , ""   , "down"     , action_moveCursorLineDown)
	bind("all"    , "s"  , "down"     , action_moveCursorLineDownAnchored)

	bind("all"    , ""   , "pageup"   , action_moveCursorPageUp)
	bind("all"    , "s"  , "pageup"   , action_moveCursorPageUpAnchored)
	bind("all"    , ""   , "pagedown" , action_moveCursorPageDown)
	bind("all"    , "s"  , "pagedown" , action_moveCursorPageDownAnchored)

	bind("all"    , ""   , "return"   , action_insertNewline)
	bind("all"    , ""   , "kpenter"  , action_insertNewline)
	bind("macos"  , "^"  , "o"        , action_insertNewline)

	bind("all"    , ""   , "backspace", action_deleteCharacterLeft)
	bind("all"    , ""   , "delete"   , action_deleteCharacterRight)
	bind("macos"  , "^"  , "h"        , action_deleteCharacterLeft)
	bind("macos"  , "^"  , "d"        , action_deleteCharacterRight)

	bind("windows", "c"  , "backspace", action_deleteWordLeft)
	bind("windows", "c"  , "delete"   , action_deleteWordRight)
	bind("macos"  , "a"  , "backspace", action_deleteWordLeft)
	bind("macos"  , "a"  , "delete"   , action_deleteWordRight) -- Guessed macOS equivalent.  @Incomplete: Handle keyboards with no 'right-delete' key.

	bind("all"    , "c"  , "a"        , action_selectAll)

	bind("all"    , "c"  , "c"        , action_copy)
	bind("windows", "c"  , "insert"   , action_copy)

	bind("all"    , "c"  , "x"        , action_cut)
	bind("windows", "s"  , "delete"   , action_cut)

	bind("all"    , "c"  , "v"        , action_paste)
	bind("windows", "s"  , "insert"   , action_paste)
	bind("macos"  , "cas", "v"        , action_paste)

	bind("all"    , "c"  , "z"        , action_undo)
	bind("all"    , "cs" , "z"        , action_redo)
	bind("windows", "c"  , "y"        , action_redo)

	-- @Incomplete: Bind 'delete from line start'. windows=ctrl+shift+backspace
	-- @Incomplete: Bind 'delete to line end'. windows=ctrl+shift+delete



	-- eventWasHandled, textWasEdited = field:keypressed( key, isRepeat )
	function InputField.keypressed(field, key, isRepeat)
		if field.dragMode ~= "" then
			-- Escape while dragging: Stop dragging.
			if key == "escape" then  field:releaseMouse()  end

			return true, false
		end

		local keyHandler = keyHandlers[getModKeys()][key]

		if keyHandler then
			return keyHandler(field, isRepeat)
		else
			return false, false
		end
	end

	-- eventWasHandled, textWasEdited = field:textinput( text )
	function InputField.textinput(field, text)
		if field.dragMode ~= ""     then  return true, false  end
		if not field.editingEnabled then  return true, false  end
		field:insert(applyFilter(field, text))
		return true, true
	end



	local function nextLine(field, lineI)
		lineI      = lineI + 1
		local line = field.wrappedText[lineI]

		if not line then  return nil  end

		local fontH    = field.font:getHeight()
		local lineDist = math.ceil(fontH*field.font:getLineHeight())

		return lineI,
			line,
			alignOnLine(field, line, 0) - math.floor(field.scrollX),
			(lineI - 1) * lineDist      - math.floor(field.scrollY),
			field.font:getWidth(line),
			fontH
	end

	-- for index, line, lineX, lineY, lineWidth, lineHeight in field:eachVisibleLine( )
	-- Note: The coordinates are relative to the field's position.
	function InputField.eachVisibleLine(field)
		updateWrap(field)
		return nextLine, field, 0
	end



	local versionMajor, versionMinor = love.getVersion()
	local hasGetKerningMethod        = false--(versionMajor > 11) or (versionMajor == 11 and versionMinor >= 4)
	local cache                      = {}

	local getSelectionLayoutOnLine = (
		hasGetKerningMethod and function(font, line, posOnLine1, posOnLine2) -- Currently worse than the fallback!
			local pos    = 0
			local x      = 0
			local x1     = 0
			local lastCp = 0

			for _, cp in utf8Codes(line) do
				pos = pos + 1

				if lastCp > 0 then
					x = x + font:getKerning(lastCp, cp)
				end
				cache[cp] = cache[cp] or utf8.char(cp) ; x = x + font:getWidth(cache[cp]) -- Not sure if the cache is doing anything...
				-- x = x + font:getWidth(utf8.char(cp))

				if pos == posOnLine1-1 then
					x1 = x
				end
				if pos == posOnLine2 then
					return x1, x -- @Polish: Handle kerning on the right end of the selection.
				end

				lastCp = cp
			end

			return x, x
		end

		or function(font, line, posOnLine1, posOnLine2)
			local preText       = line:sub(1, utf8.offset     (line, posOnLine1)-1) -- @Speed @Memory
			local preAndMidText = line:sub(1, utf8GetEndOffset(line, posOnLine2)  ) -- @Speed @Memory
			local x1            = font:getWidth(preText)
			local x2            = font:getWidth(preAndMidText) -- @Polish: Handle kerning on the right end of the selection.
			return x1, x2
		end
	)

	local function nextSelection(selections, i)
		i          = i + 1
		local line = selections[3*i-2]

		if not line then  return nil  end

		local field = selections.field
		local font  = field.font

		local posOnLine1 = selections[3*i-1]
		local posOnLine2 = selections[3*i  ]
		local x1, x2     = getSelectionLayoutOnLine(font, line, posOnLine1, posOnLine2)

		local fontH    = font:getHeight()
		local lineDist = math.ceil(fontH*font:getLineHeight())

		if selections[3*(i+1)] then
			x2 = x2 + font:getWidth(" ")
			-- x2 = math.min(x2, field.width) -- Eh, this is a bad idea. Any scissoring should be done by the user.
		end

		return i,
			alignOnLine(field, line, x1)           - math.floor(field.scrollX),
			(selections.lineOffset + i) * lineDist - math.floor(field.scrollY),
			x2 - x1,
			fontH
	end

	local selectionsReused = {field=nil, lineOffset=0, --[[ line1, startPositionOnLine1, endPositionOnLine1, ... ]]}

	local function _eachSelection(field, selections)
		-- updateWrap(field) -- getLineInfoAtPosition() calls this.

		local startLine, startPosOnLine, startLineI, startLinePos1, startLinePos2 = getLineInfoAtPosition(field, field.selectionStart)
		local   endLine,   endPosOnLine,   endLineI,   endLinePos1,   endLinePos2 = getLineInfoAtPosition(field, field.selectionEnd)

		-- Note: We include selections that are empty.
		selections.field      = field
		selections.lineOffset = startLineI - 2

		if startLineI == endLineI then
			selections[1] = startLine
			selections[2] = startPosOnLine + 1
			selections[3] = endPosOnLine

		else
			selections[1] = startLine
			selections[2] = startPosOnLine + 1
			selections[3] = startLinePos2 - startLinePos1 + 1

			for lineI = startLineI+1, endLineI-1 do
				local line = field.wrappedText[lineI]
				table.insert(selections, line)
				table.insert(selections, 1)
				table.insert(selections, utf8.len(line))
			end

			table.insert(selections, endLine)
			table.insert(selections, 1)
			table.insert(selections, endPosOnLine)
		end

		return nextSelection, selections, 0
	end



	--
	-- for index, selectionX, selectionY, selectionWidth, selectionHeight in field:eachSelection( )
	-- for index, selectionX, selectionY, selectionWidth, selectionHeight in field:eachSelectionOptimized( )
	--
	-- Note: The coordinates are relative to the field's position.
	--
	-- Note: It's possible for the right side of selections to extend slightly
	-- past the specified width of the field in multi-line fields.
	--
	-- Warning: field:eachSelection() may chew through lots of memory if many
	-- lines are selected! Consider using field:eachSelectionOptimized() instead.
	--
	-- Warning: field:eachSelectionOptimized() must not be called recursively!
	--

	function InputField.eachSelection(field)
		if field.selectionStart == field.selectionEnd then  return noop  end

		return _eachSelection(field, {}) -- @Speed @Memory: Don't create a new table every call!
	end

	function InputField.eachSelectionOptimized(field)
		if field.selectionStart == field.selectionEnd then  return noop  end

		for i = 4, #selectionsReused do -- selectionsReused will always have at least 3 items, so just ignore them here.
			selectionsReused[i] = nil
		end

		return _eachSelection(field, selectionsReused)
	end



	--==============================================================
	--==============================================================
	--==============================================================

	return setmetatable(InputField, {

		-- InputField( [ initialText="", type:InputFieldType="normal" ] )
		__call = function(InputField, text, fieldType)
			return newInputField(text, fieldType)
		end,

	})

	--==============================================================
	--=
	--=  MIT License
	--=
	--=  Copyright © 2017-2022 Marcus 'ReFreezed' Thunström
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

  end)()



local COLOR_TRANSPARENT = {1,1,1,0}
local COLOR_WHITE       = {1,1,1,1}

local _M = { -- The module.
	_VERSION = "0.2.0",
}

local Gui = class("Gui", {
	TOOLTIP_DELAY = 0.15,

	VALUE_MASK_INT    =  "^%-?%d+$",       -- Integer number.
	VALUE_MASK_UINT   =  "^%d+$",          -- Unsigned integer number.
	VALUE_MASK_FLOAT  =  "^%-?%d+%.?%d*$", -- Floating point number.
	VALUE_MASK_UFLOAT =  "^%d+%.?%d*$",    -- Unsigned floating point number.

	_allAnimations                = nil, _animationLockCount = 0,
	_currentMouseCursor           = nil,
	_defaultSounds                = nil,
	_elementScissorIsSet          = false,
	_font                         = nil, _fontBold = nil, _fontSmall = nil, _fontLarge = nil, _fontTooltip = nil,
	_heres                        = nil,
	_hoveredElement               = nil,
	_ignoreKeyboardInputThisFrame = false,
	_keyboardFocus                = nil,
	_lastAutomaticId              = 0,
	_layoutNeedsUpdate            = false,
	_lockNavigation               = false,
	_mouseFocus                   = nil, _mouseFocusSet = nil,
	_mouseIsGrabbed               = false,
	_mouseX                       = nil, _mouseY = nil,
	_navigationTarget             = nil, _timeSinceNavigation = 0.0,
	_root                         = nil,
	_scissorCoordsConverter       = nil,
	_scrollSpeedX                 = 1.0, _scrollSpeedY = 1.0,
	_soundPlayer                  = nil,
	_spriteLoader                 = nil,
	_standardKeysAreActive        = true,
	_styles                       = nil,
	_textPreprocessor             = nil,
	_theme                        = nil,
	_time                         = 0.0,
	_tooltipTime                  = 0.0,

	debug = false,
})

local Cs = {} -- gui element Classes.
local Ms = {} -- gui element Mixins.

local validSoundKeys = {
	-- Generic
	["close"]  = true, -- Usually containers, but any element can be a closable.
	["focus"]  = true, -- Only used by Inputs so far.
	["press"]  = true, -- Buttons.
	["scroll"] = true, -- Containers.

	-- Element specific
	["inputsubmit"] = true, ["inputrevert"] = true,
}

local defaultTheme



--==============================================================
--= Local functions ============================================
--==============================================================

local F = string.format



-- printf( formatString, ... )
local function printf(s, ...)
	print(F(s, ...))
end

-- printerr( depth, formatString, ... )
local function printerr(depth, s, ...)
	local time    = require"socket".gettime()
	local timeStr = os.date("%H:%M:%S", time)
	local msStr   = F("%.3f", time%1):sub(2)

	printf("[%s%s] ERROR: "..s, timeStr, msStr, ...)

	-- Traceback.
	for line in debug.traceback("", 1+depth):gmatch"[^\n]+" do
		local fileAndLine, inside = line:match"\t(%w.-): in (.+)"

		if fileAndLine then
			inside = inside:gsub("^function ", ""):gsub("^['<](.+)['>]$", "%1")
			printf("\t%s  (%s)", fileAndLine, inside)
		end
	end

	print()
end



-- errorf( [ level=1, ] formatString, ... )
local function errorf(i, s, ...)
	if type(i) == "number" then
		error(F(s, ...), 1+i)
	else
		error(F(i, s, ...), 2)
	end
end

local function argerror(errLevel, argN, argName, v, ...)
	errorf(
		1+errLevel,
		"Bad argument #%d (%s) to '%s'. (Expected %s, got %s)",
		argN,
		argName,
		debug.getinfo(errLevel, "n").name or "?",
		table.concat({...}, " or "),
		type(v)
	)
end



-- class = newElementClass( className, parentClass|nil, includes, classTable, events )
local function newElementClass(className, parentClass, includes, classTable, events)
	local C = parentClass and parentClass:extend(className, classTable) or class(className, classTable)

	-- Include mixins.
	for _, mixinName in ipairs(includes) do
		for k, v in pairs(Ms[mixinName]) do
			if not (C[k] == nil) then  error((k))  end -- A mixin should only add new stuff to classes, not override anything.
			C[k] = v
		end
	end

	-- Register events.
	for i, event in ipairs(C._events) do
		table.insert(events, i, event)
	end
	for i, event in ipairs(events) do
		events[event] = true
	end
	C._events = events

	return C
end



local function applyStyle(elData, styleData)
	for i, childStyleData in ipairs(styleData) do
		if elData[i] == nil then
			error("Cannot apply style. (Missing children.)")
		end
		applyStyle(elData[i], childStyleData)
	end
	for k, v in pairs(styleData) do
		if elData[k] == nil then  elData[k] = v  end
	end
end



local function checkValidSoundKey(soundK, errLevel)
	if soundK == nil or validSoundKeys[soundK] then  return  end

	local keys = {}
	for soundK in pairs(validSoundKeys) do
		table.insert(keys, soundK)
	end
	table.sort(keys)

	errorf(1+errLevel, "Bad sound key '%s'. (Must be any of '%s'.)", soundK, table.concat(keys, "', '"))
end



-- @Memory: Don't use this, yo!
-- iterator, coroutine = newIteratorCoroutine( callback, argument1, ... )
local newIteratorCoroutine
do
	-- ... = coroutineIterator( coroutine )
	local function coroutineIterator(co)
		return select(2, assert(coroutine.resume(co)))
	end
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



-- x, y, width, height = xywh( element )
local function xywh(el)
	return el:getXOnScreen(), el:getYOnScreen(), el._layoutWidth, el._layoutHeight
end



-- drawImage( image, quad, ... )
-- drawImage( image, nil, ... )
-- drawImage( nil, image, ... )
local function drawImage(image, quadOrImage, ...)
	if image and quadOrImage then
		love.graphics.draw(image, quadOrImage, ...)
	else
		love.graphics.draw((image or quadOrImage), ...)
	end
end



-- width, height = getTextDimensions( font, text [, wrapLimit=none ] )
local function getTextDimensions(font, text, wrapLimit)
	local w, lines = font:getWrap(text, (wrapLimit or 1/0))
	local h        = font:getHeight()
	return w, h + math.floor(h*font:getLineHeight()) * (math.max(#lines, 1)-1)
end



-- elementType = getTypeFromElementData( elementData )
local function getTypeFromElementData(elData)
	if not elData.type and type(elData[1]) == "string" then
		elData.type = table.remove(elData, 1)
	end
	return elData.type
end



-- index = indexOf( array, value )
-- index = indexOf( container, element )
local function indexOf(arr, v)
	for i, item in ipairs(arr) do
		if item == v then  return i  end
	end
	return nil
end



-- for index, item in ipairsr( table )
local ipairsr
do
	local function iprev(arr, i)
		i       = i - 1
		local v = arr[i]
		if v ~= nil then  return i, v  end
	end
	function ipairsr(arr)
		return iprev, arr, #arr+1
	end
end



-- value = lerp( v1, v2, t )
local function lerp(v1, v2, t)
	return v1+t*(v2-v1)
end



-- matches = matchAll( string, pattern )
local function matchAll(s, pat)
	local matches, i = {}, 0
	for match in s:gmatch(pat) do
		i = i+1
		matches[i] = match
	end
	return matches
end



-- sprite = newSprite( image [, quad ] )
-- sprite = newSprite( image, frames )
-- frames = { frame1, ... }
-- frame  = { duration=duration, quad=quad }
local function newSprite(image, framesOrQuad)
	if type(image)~="userdata" then argerror(1,1,"image",image,"userdata") end
	if not(type(framesOrQuad)=="userdata" or type(framesOrQuad)=="table" or framesOrQuad==nil) then argerror(1,2,"framesOrQuad",framesOrQuad,"userdata","table","nil") end
	local frames

	if not framesOrQuad then
		local iw, ih = image:getDimensions()
		frames = {{duration=1/0, quad=love.graphics.newQuad(0, 0, iw, ih, iw, ih)}}

	elseif type(framesOrQuad) == "userdata" then
		frames = {{duration=1/0, quad=framesOrQuad}}

	else
		frames = framesOrQuad
		if not frames[1] then
			error("The frames table is empty. We need at least one frame!", 2)
		end
		for i, frame in ipairs(frames) do
			if not frame.duration then  errorf(2, "Frame %d is missing a duration.", i)  end
			if not frame.quad     then  errorf(2, "Frame %d is missing a quad."    , i)  end
		end
	end

	local duration = 0
	for _, frame in ipairs(frames) do
		duration = duration + frame.duration
	end

	local _, _, iw, ih = frames[1].quad:getViewport()

	local sprite = {
		image        = image,

		frames       = frames,

		width        = iw,
		height       = ih,

		length       = #frames,
		duration     = duration,

		currentFrame = 1,
		currentTime  = 0.0,
	}

	return sprite
end

-- -- clone = cloneSprite( sprite )
-- local function cloneSprite(sprite)
-- 	return (newSprite(sprite.image, sprite.frames))
-- end

-- image, quad, width, height = getCurrentViewOfSprite( sprite )
local function getCurrentViewOfSprite(sprite)
	local quad = sprite.frames[sprite.currentFrame].quad
	local _, _, w, h = quad:getViewport()
	return sprite.image, quad, w, h
end

-- updateSprite( sprite, deltaTime )
local function updateSprite(sprite, dt)
	if sprite.length == 1 then  return  end

	local frames = sprite.frames

	local i      = sprite.currentFrame
	local time   = sprite.currentTime+dt

	while time >= frames[i].duration do
		time = time-frames[i].duration
		i    = i%sprite.length+1
	end

	sprite.currentFrame = i
	sprite.currentTime  = time
end



-- selectorPath = parseSelector( selector )
-- selector     = "elementType #id .tag" -- Sequence of space-separated element types, IDs and tags.
-- Returns nil if the selector is empty or invalid.
local parseSelector
do
	local selPathCache = {}

	function parseSelector(selector)
		local selPath = selPathCache[selector]
		if selPath then
			return selPath
		end

		selPath = {}

		for section in selector:gmatch"[^ ]+" do
			local selPathSection = {}
			local i = 1
			while true do

				local c = section:sub(i, i)
				if c == "" then
					break
				end

				local selPathSegment

				-- ID
				if c == "#" then
					local id
					id, i = section:match("^([^#.]+)()", i+1)
					if not id then
						printerr(1, "Bad format in selector at '%s'.", section:sub(i))
						return nil
					end
					selPathSegment = {type="id", value=id}

				-- Tag
				elseif c == "." then
					local tag
					tag, i = section:match("^([^#.]+)()", i+1)
					if not tag then
						printerr(1, "Bad format in selector at '%s'.", section:sub(i))
						return nil
					end
					selPathSegment = {type="tag", value=tag}

				-- Element type
				else
					local elType
					elType, i = section:match("^([^#.]+)()", i)
					if not elType then
						printerr(1, "Bad format in selector at '%s'.", section:sub(i))
						return nil
					elseif not Cs[elType] then
						printerr(1, "Unknown element type '%s' in selector.", elType)
						return nil
					end
					selPathSegment = {type="type", value=elType}

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
local isElementMatchingSelectorPath
do
	local function isMatchingSection(el, selPathSection)
		for _, selPathSegment in ipairs(selPathSection) do

			-- ID
			if selPathSegment.type == "id" then
				if not el:hasId(selPathSegment.value) then
					return false
				end

			-- Tag
			elseif selPathSegment.type == "tag" then
				if not el:hasTag(selPathSegment.value) then
					return false
				end

			-- Element type
			else--if selPathSegment.type == "type" then
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
local function prepareSound(el, soundK)
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
local function preprocessText(gui, unprocessedText, el, hasMnemonics)
	if unprocessedText == "" then  return ""  end

	local preprocessor = gui._textPreprocessor
	if not preprocessor then  return unprocessedText  end

	local text = preprocessor(unprocessedText, el, hasMnemonics)
	if text == nil then  return unprocessedText  end

	return tostring(text)
end



local function printHere(el0)
	local ids = {}
	local el  = el0

	repeat
		if not el._automaticId then  table.insert(ids, 1, el._id)  end
		el = el._parent
	until not el

	ids[1] = ids[1] or el0:getPathDescription()
	print("[Gui] HERE:  "..table.concat(ids, "."))
	-- ids[1] = ids[1] or "~"
	-- printf("[Gui] HERE:  %s  (%s)", table.concat(ids, "."), el0:getPathDescription())
end

local function printHeres(gui)
	local heres = gui._heres
	for i, el in ipairs(heres) do
		printHere(el)
		heres[i] = nil
	end
end



-- class = requireElementClass( elType )
local function requireElementClass(elType)
	return Cs[elType] or errorf(2, "Unknown element type '%s'.", elType)
end



-- retrieve( element, elementData, property1, ... )
local function retrieve(el, elData, _k, ...)
	local v = elData[_k:sub(2)]
	if v ~= nil then
		el[_k] = v
	end
	if ... then
		return retrieve(el, elData, ...)
	end
end



local function reverseArray(arr)
	local lenPlusOne = #arr + 1

	for i1 = 1, #arr/2 do
		local i2         = lenPlusOne - i1
		arr[i1], arr[i2] = arr[i2], arr[i1]
	end
end



-- integer = round( number )
local function round(n)
	return math.floor(n+0.5)
end



-- setMouseFocus( gui, element, mouseButton )
-- setMouseFocus( gui, nil ) -- Blur.
local function setMouseFocus(gui, el, mbutton)
	if el then
		if next(gui._mouseFocusSet) then
			error("mouseFocusSet must be empty for mouse focus to change.")
		end
		gui._mouseFocus             = el
		gui._mouseFocusSet[mbutton] = true
		love.mouse.setGrabbed(true)
	else
		gui._mouseFocus    = nil
		gui._mouseFocusSet = {}
		love.mouse.setGrabbed(gui._mouseIsGrabbed)
	end
end

-- setKeyboardFocus( gui, element|nil )
local function setKeyboardFocus(gui, el)
	gui._keyboardFocus = el
end



-- setScissor( gui, x, y, width, height ) -- Push scissor.
-- setScissor( gui, nil ) -- Pop scissor.
-- Must be called twice - first with arguments, then without!
local function setScissor(gui, x, y, w, h)
	if not x then
		love.graphics.pop()
		return
	end

	local convert = gui._scissorCoordsConverter
	if convert then
		x, y, w, h = convert(x, y, w, h)
	end

	love.graphics.push("all")
	love.graphics.intersectScissor(x, y, math.max(w, 0), math.max(h, 0))
end

-- Note: Does not push or pop state like setScissor()!
local function intersectScissor(gui, x, y, w, h)
	local convert = gui._scissorCoordsConverter
	if convert then
		x, y, w, h = convert(x, y, w, h)
	end
	love.graphics.intersectScissor(x, y, w, h)
end



-- value1, ... = themeCallBack( gui, sectionKey, what, argument1, ... )
local function themeCallBack(gui, k, what, ...)
	local section = gui._theme and gui._theme[k]
	local cb      = (section and section[what] or defaultTheme[k][what]) or errorf(2, "Missing default theme callback for '%s.%s'.", k, what)
	return cb(...)
end

-- value = themeGet( gui, key )
local function themeGet(gui, k)
	local v = gui._theme and gui._theme[k]
	if v == nil then
		return defaultTheme[k]
	end
	return v
end

-- themeRenderOnScreen( element, what, x, y, w, h, extraArgument1, ... )
local function themeRenderOnScreen(el, what, x, y, w, h, ...)
	local gui = el._gui
	if x+w < 0 or y+h < 0 then  return  end

	local rootW, rootH = gui._root:getDimensions()
	if x >= rootW or y >= rootH then  return  end

	love.graphics.push("all")
	love.graphics.translate(x, y)

	themeCallBack(gui, "draw", what, el, w, h, ...)
	el:unsetScissor()

	love.graphics.pop()
end

-- themeRenderArea( element, what, areaX, areaY, areaWidth, areaHeight, extraArgument1, ... )
local function themeRenderArea(el, what, areaX, areaY, areaW, areaH, ...)
	local x = round(el:getXOnScreen()+areaX)
	local y = round(el:getYOnScreen()+areaY)
	return themeRenderOnScreen(el, what, x, y, areaW, areaH, ...)
end

-- themeRender( element, what, extraArgument1, ... )
local function themeRender(el, what, ...)
	return themeRenderArea(el, what, 0, 0, el._layoutWidth, el._layoutHeight, ...)
end

-- width, height = themeGetSize( element, what, extraArgument1, ... )
local function themeGetSize(el, what, ...)
	local w, h = themeCallBack(el._gui, "size", what, el, ...)
	if not (type(w) == "number" and type(h) == "number") then
		errorf(2, "Theme (or default theme) did not return width and height for '%s', instead we got: %s, %s", what, tostring(w), tostring(h))
	end
	return w, h
end



local function drawLayoutBackground(el)
	local bg = el._background
	if bg then
		if el._gui.debug then
			setColor(.27, .27, .27, .86)
			love.graphics.rectangle("fill", xywh(el))
		else
			themeRender(el, "background", bg)
		end
	end
end



-- value = trigger( element, event, value1, ... )
local function trigger(el, event, ...)
	local cb = el._callbacks[event]
	if not cb then  return nil   end

	return cb(el, event, ...)
end

-- value = triggerIncludingAnimations( element, event, value, ... )
local function triggerIncludingAnimations(el, event, ...)
	local time = el._gui._time

	for _, anim in ipairs(el._animations) do
		local cb = anim.callbacks[event]
		if cb then  cb(el, event, (time-anim.startTime)/anim.duration, ...)  end
	end

	local cb = el._callbacks[event]
	if not cb then  return nil  end

	return cb(el, event, ...)
end



-- updateHoveredElement( gui )
local function updateHoveredElement(gui)
	local el = (gui._mouseX and gui:getElementAt(gui._mouseX, gui._mouseY))
	if gui._hoveredElement == el then
		return
	end
	local oldEl = gui._hoveredElement
	gui._hoveredElement = el
	if not (el and el._tooltip ~= "" and oldEl and oldEl._tooltip ~= "" and gui._tooltipTime >= gui.TOOLTIP_DELAY) then
		-- @Incomplete: Don't reset tooltip time instantly - add a delay.
		gui._tooltipTime = 0
	end
end

-- Removes current navigation target if it isn't a valid target anymore.
local function validateNavigationTarget(gui)
	local nav = gui._navigationTarget
	if nav and not gui:canNavigateTo(nav) then
		gui:navigateTo(nil)
	end
end



-- didUpdate = updateLayout( element )
local function updateLayout(el)
	local gui = el._gui
	if gui.debug then
		print("Gui: Updating layout.")
	end

	local container = el:getRoot() -- @Incomplete: Make any element able to update it's layout.
	if container._hidden then  return false  end

	container:_updateLayoutSize()
	container:_expandLayout(nil, nil) -- (Currently, most likely only works correctly if 'container' is the root.)
	container:_updateLayoutPosition()

	gui._layoutNeedsUpdate = false

	for innerEl in container:traverseVisible() do
		triggerIncludingAnimations(innerEl, "layout")
	end

	updateHoveredElement(gui)

	return true
end

-- didUpdate = updateLayoutIfNeeded( gui )
local function updateLayoutIfNeeded(gui)
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

local function scheduleLayoutUpdateIfDisplayed(el)
	local gui = el._gui
	if gui._layoutNeedsUpdate then  return  end

	gui._layoutNeedsUpdate = el:isDisplayed()
	if gui.debug and gui._layoutNeedsUpdate then
		print("Gui: Scheduling layout update.")
	end
end



local function setVisualScroll(container, scrollX, scrollY)
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

	if not didScroll then  return  end

	for el in container:traverse() do
		el._layoutOffsetX = el._layoutOffsetX+dx
		el._layoutOffsetY = el._layoutOffsetY+dy
	end

	updateHoveredElement(container._gui)
end



-- useColor( color [, alphaMultiplier=1 ] )
local function useColor(color, opacity)
	if not opacity then
		setColor(color)
	else
		local r, g, b, a = unpack(color)
		setColor(r, g, b, (a or 1)*opacity)
	end
end



--==============================================================



-- updateContainerChildLayoutSizes( container )
local function updateContainerChildLayoutSizes(container)
	for _, child in ipairs(container) do
		if not child._hidden then
			child:_updateLayoutSize()
		end
	end
end



-- <see_return_statement> = getContainerLayoutSizeValues( bar )
local function getContainerLayoutSizeValues(bar)
	local staticW, dynamicW, highestW, highestDynamicW, expandablesX = 0, 0, 0, 0, 0
	local staticH, dynamicH, highestH, highestDynamicH, expandablesY = 0, 0, 0, 0, 0

	local currentSx = 0
	local currentSy = 0
	local sumSx     = 0
	local sumSy     = 0
	local first     = true

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
local function updateContainerLayoutSize(container)
	local w = container._width
	if not w then
		w = math.min(
			math.max(container._layoutInnerWidth+container:getInnerSpaceX(), container._minWidth),
			(container._maxWidth or 1/0)
		)
	end
	container._layoutWidth = w
	-- container._layoutInnerWidth = w-container:getInnerSpaceX() -- No! The inner size is the size of the contents.

	local h = container._height
	if not h then
		h = math.min(
			math.max(container._layoutInnerHeight+container:getInnerSpaceY(), container._minHeight),
			(container._maxHeight or 1/0)
		)
	end
	container._layoutHeight = h
	-- container._layoutInnerHeight = h-container:getInnerSpaceY() -- No! The inner size is the size of the contents.
end

-- expandContainer( container [, expandWidth, expandHeight ] )
local function expandContainer(container, expandW, expandH)
	local parent = container._parent

	if (expandW or container._expandX) and not container._width then
		container._layoutWidth = math.max(
			math.min((expandW or parent._layoutInnerWidth+container:getInnerSpaceX()), (container._maxWidth or 1/0)),
			container._minWidth
		)
		container._layoutInnerWidth = container._layoutWidth-container:getInnerSpaceX()
	end

	if (expandH or container._expandY) and not container._height then
		container._layoutHeight = math.max(
			math.min((expandH or parent._layoutInnerHeight+container:getInnerSpaceY()), (container._maxHeight or 1/0)),
			container._minHeight
		)
		container._layoutInnerHeight = container._layoutHeight-container:getInnerSpaceY()
	end
end



-- updateFloatingElementPosition( element )
local function updateFloatingElementPosition(child)
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



local font = nil

local function getDefaultFont()
	font = font or love.graphics.newFont(12)
	return font
end



--==============================================================
--= Library functions ==========================================
--==============================================================



-- quads = create9PartQuads( image, leftColumnSize, topRowSize [, rightColumnSize=leftColumnSize, bottomRowSize=topRowSize ] )
-- quads = {
--     topLeftQuad,    topCenterQuad,    topRightQuad,
--     middleLeftQuad, middleCenterQuad, middleRightQuad,
--     bottomLeftQuad, bottomCenterQuad, bottomRightQuad,
-- }
function _M.create9PartQuads(image, l, t, r, b)
	r = r or l
	b = b or t
	local iw, ih = image:getDimensions()
	return {
		love.graphics.newQuad(   0,    0,      l,      t, iw, ih),
		love.graphics.newQuad(   l,    0, iw-l-r,      t, iw, ih),
		love.graphics.newQuad(iw-r,    0,      r,      t, iw, ih),
		love.graphics.newQuad(   0,    t,      l, ih-t-b, iw, ih),
		love.graphics.newQuad(   l,    t, iw-l-r, ih-t-b, iw, ih),
		love.graphics.newQuad(iw-r,    t,      r, ih-t-b, iw, ih),
		love.graphics.newQuad(   0, ih-b,      l,      b, iw, ih),
		love.graphics.newQuad(   l, ih-b, iw-l-r,      b, iw, ih),
		love.graphics.newQuad(iw-r, ih-b,      r,      b, iw, ih),
	}
end



-- draw9PartScaled(
--     x, y, width, height,
--     topLeftImage,    topCenterImage,    topRightImage,
--     middleLeftImage, middleCenterImage, middleRightImage,
--     bottomLeftImage, bottomCenterImage, bottomRightImage
-- )
-- draw9PartScaled(
--     x, y, width, height, image,
--     topLeftQuad,    topCenterQuad,    topRightQuad,
--     middleLeftQuad, middleCenterQuad, middleRightQuad,
--     bottomLeftQuad, bottomCenterQuad, bottomRightQuad
-- )
function _M.draw9PartScaled(x, y, w, h, image, obj11, obj12, obj13, obj21, obj22, obj23, obj31, obj32, obj33)
	if not obj33 then
		image, obj11, obj12, obj13, obj21, obj22, obj23, obj31, obj32, obj33
			= nil, image, obj11, obj12, obj13, obj21, obj22, obj23, obj31, obj32
	end

	local t, l, r, b, sx, sy
	if image then
		local _, objW, objH
		_, _, l, objH = obj21:getViewport()
		_, _, r       = obj23:getViewport()
		_, _, objW, t = obj12:getViewport()
		_, _, _,    b = obj32:getViewport()
		sx = (w-l-r) / objW
		sy = (h-t-b) / objH
	else
		l  = obj21:getWidth()
		r  = obj23:getWidth()
		t  = obj12:getHeight()
		b  = obj32:getHeight()
		sx = (w-l-r) / obj12:getWidth()
		sy = (h-t-b) / obj21:getHeight()
	end

	love.graphics.push()
	love.graphics.translate(x, y)

	-- Fill.
	drawImage(image, obj22, l, t, 0, sx, sy)

	-- Sides.
	drawImage(image, obj12,   l,   0, 0, sx,  1)
	drawImage(image, obj23, w-r,   t, 0,  1, sy)
	drawImage(image, obj32,   l, h-b, 0, sx,  1)
	drawImage(image, obj21,   0,   t, 0,  1, sy)

	-- Corners.
	drawImage(image, obj11,   0,   0)
	drawImage(image, obj13, w-r,   0)
	drawImage(image, obj31,   0, h-b)
	drawImage(image, obj33, w-r, h-b)

	love.graphics.pop()
end



--
-- image     = Gui.newMonochromeImage( pixelRows [, red=1, green=1, blue=1 ] )
-- pixelRows = { pixelRow1, ... }
-- pixelRow: String with single-digit hexadecimal numbers. Invalid characters counts as 0.
--
-- Example:
--     blurryDiagonalLine = Gui.newMonochromeImage{
--         " 5F",
--         "5F5",
--         "F5 ",
--     }
--
function _M.newMonochromeImage(pixelRows, r, g, b)
	r = r or 1
	g = g or 1
	b = b or 1

	local imageData = love.image.newImageData(#pixelRows[1], #pixelRows)

	for row, pixelRow in ipairs(pixelRows) do
		for col = 1, #pixelRow do
			local pixel = tonumber(pixelRow:sub(col, col), 16) or 0
			imageData:setPixel(col-1, row-1, r, g, b, pixel/15) -- @Speed
		end
	end

	return love.graphics.newImage(imageData)
end

--
-- image     = Gui.newImageUsingPalette( pixelRows, palette )
-- pixelRows = { pixelRow1, ... }
-- pixelRow: String with single-character palette indices. Invalid indices counts as transparent pixels.
-- palette   = { ["index"]=color... }
-- color     = { red, green, blue [, alpha=1 ] }
--
-- Example:
--     doubleWideRainbow = Gui.newImageUsingPalette(
--         {
--             "rygcbp",
--             "rygcbp",
--         },
--         {
--             ["r"] = {1,0,0}, -- red
--             ["y"] = {1,1,0}, -- yellow
--             ["g"] = {0,1,0}, -- green
--             ["c"] = {0,1,1}, -- cyan
--             ["b"] = {0,0,1}, -- blue
--             ["p"] = {1,0,1}, -- purple
--         }
--     )
--
function _M.newImageUsingPalette(pixelRows, palette)
	local imageData = love.image.newImageData(#pixelRows[1], #pixelRows)

	for row, pixelRow in ipairs(pixelRows) do
		for col = 1, #pixelRow do
			local pixel      = (palette[pixelRow:sub(col, col)] or COLOR_TRANSPARENT)
			local r, g, b, a = unpack(pixel)
			imageData:setPixel(col-1, row-1, r, g, b, (a or 1)) -- @Speed
		end
	end

	return love.graphics.newImage(imageData)
end



--==============================================================
--= GUI class ==================================================
--==============================================================



-- Gui( )
function Gui:init()
	self._allAnimations = {}
	self._defaultSounds = {}
	self._heres         = {}
	self._mouseFocusSet = {}

	self._styles = {
		["_MENU"] = {},
	}
end



-- gui:update( deltaTime )
function Gui:update(dt)
	local time                = self._time + dt
	self._time                = time
	self._tooltipTime         = self._tooltipTime + dt
	self._timeSinceNavigation = self._timeSinceNavigation + dt

	local allAnims = self._allAnimations

	if allAnims[1] then
		for i, anim in ipairsr(allAnims) do
			local el = anim.element

			if time >= anim.endTime then
				local cb = anim.callbacks["update"]
				if cb then  cb(el, "update", 1)  end -- Make sure 'update' gets progress=1

				cb = anim.callbacks["done"]
				if cb then  cb(el, "done")  end

				local anims = el._animations
				table.remove(allAnims, i)
				table.remove(anims, assert(indexOf(anims, anim)))

				if anim.lockInteraction then
					self._animationLockCount = self._animationLockCount-1
				end

			else
				local cb = anim.callbacks["update"]
				if cb then
					cb(el, "update", (time-anim.startTime)/anim.duration)
				end
			end

		end

		if self._animationLockCount == 0 then
			updateHoveredElement(self)
		end
	end

	if self._root then
		self._root:_update(dt)

		if self._root:isVisible() then
			trigger(self._root, "update", dt)

			for el in self._root:traverseVisible() do
				trigger(el, "update", dt)
			end
		end
	end

	-- The navigation target has a special additional update event.
	local nav = self._navigationTarget
	if nav then  trigger(nav, "navupdate", dt)  end

	-- Check if mouse is inside window
	if self._mouseX and not love.window.hasMouseFocus() then
		self:mousemoved(nil, nil)
	end



	-- Update mouse cursor.

	local lastCursor = self._currentMouseCursor
	self._currentMouseCursor = nil

	local el = self._mouseFocus or self._hoveredElement
	if el
		and not (el:isType"widget"   and not el:isActive())
		and not (self._keyboardFocus and not el:isKeyboardFocus())
		and not (self._mouseFocus    and not el:isMouseFocus())
		and (el:isHovered() or self._mouseFocusSet[1] or self._mouseFocusSet[2] or self._mouseFocusSet[3])
	then
		self._currentMouseCursor = el:getResultingMouseCursor()
	end

	if self._currentMouseCursor ~= lastCursor then
		if self._currentMouseCursor then
			love.mouse.setCursor(self._currentMouseCursor)
		else
			love.mouse.setCursor()
		end
	end



	self._ignoreKeyboardInputThisFrame = false
end



-- gui:draw( )
function Gui:draw()
	if self._root and not self._root._hidden then
		updateLayoutIfNeeded(self)

		-- Elements
		self._root:_draw()

		-- Navigation target
		if not self.debug then
			local nav = self._navigationTarget
			if nav then  themeRender(nav, "navigation", self._timeSinceNavigation)  end
		end

		-- Tooltip
		local el = self._hoveredElement
		if el and not self._mouseFocus then
			el:_drawTooltip()
		end
	end
end



--==============================================================



-- handled = gui:keypressed( key, scancode, isRepeat )
function Gui:keypressed(key, scancode, isRepeat)
	if type(key)~="string" then argerror(2,1,"key",key,"string") end
	if type(scancode)~="string" then argerror(2,2,"scancode",scancode,"string") end
	if type(isRepeat)~="boolean" then argerror(2,3,"isRepeat",isRepeat,"boolean") end

	if self._animationLockCount > 0 then  return true  end

	local focus = (self._keyboardFocus or self._mouseFocus)
	local el = (focus or self._hoveredElement)

	if self._ignoreKeyboardInputThisFrame then
		return (el ~= nil)
	end

	el = (el or self._navigationTarget) -- Can this be on the 'el' declaration line?

	if el then
		if focus then
			if trigger(focus,     "keypressed", key, scancode, isRepeat) then  return true  end
		else
			if el:triggerBubbling("keypressed", key, scancode, isRepeat) then  return true  end
		end
		local handled, grabFocus = el:_keypressed(key, scancode, isRepeat)
		if handled then
			if grabFocus then
				setKeyboardFocus(self, el)
			end
			return true
		end
	end

	if focus then  return true  end

	local root = self._root
	if root and not root._hidden then
		for el in root:traverseVisible() do
			if key == "escape" and el:canClose() then
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

-- handled = gui:keyreleased( key, scancode )
function Gui:keyreleased(key, scancode)
	if type(key)~="string" then argerror(2,1,"key",key,"string") end
	if type(scancode)~="string" then argerror(2,2,"scancode",scancode,"string") end

	local focus = self._keyboardFocus
	if focus then
		focus:_keyreleased(key, scancode)
		return true
	end

	return false
end

-- handled = gui:textinput( text )
function Gui:textinput(text)
	if type(text)~="string" then argerror(2,1,"text",text,"string") end

	if self._animationLockCount > 0 then  return true  end

	local focus = self._keyboardFocus or self._mouseFocus
	local el    = focus or self._hoveredElement

	if self._ignoreKeyboardInputThisFrame then
		return (el ~= nil)
	end

	el = (el or self._navigationTarget) -- Can this be on the 'el' declaration line?

	if el then
		if not focus and el:triggerBubbling("textinput", text) then  return true  end

		if el:_textinput(text) then  return true  end
	end

	if focus then  return true  end

	local root = self._root
	if root and not root._hidden then
		for el in root:traverseVisible() do
			if el._captureInput    then  return true  end
			if el._captureGuiInput then  break        end
		end
	end

	return false
end



-- handled = gui:mousepressed( mouseX, mouseY, mouseButton, pressCount )
function Gui:mousepressed(mx, my, mbutton, pressCount)
	if type(mx)~="number" then argerror(2,1,"mx",mx,"number") end
	if type(my)~="number" then argerror(2,2,"my",my,"number") end
	if type(mbutton)~="number" then argerror(2,3,"mbutton",mbutton,"number") end
	if type(pressCount)~="number" then argerror(2,4,"pressCount",pressCount,"number") end

	self._mouseX = mx
	self._mouseY = my

	if self._animationLockCount > 0 then  return true  end

	if self._mouseFocusSet[mbutton] then
		-- The mouse button got pressed twice or more with no release inbetween.
		-- Should be an error, but it's not really an issue.
		return true
	end

	local focus = self._mouseFocus
	if focus then  self._mouseFocusSet[mbutton] = true  end

	updateLayoutIfNeeded(self) -- Updates hovered element.

	local el = (focus or self._hoveredElement)
	while el do

		-- Trigger any custom mousepressed event handler.
		-- Returning true from the handler suppresses the default built-in behavior.
		local screenX, screenY = el:getPositionOnScreen()
		if el:trigger("mousepressed", mx-screenX, my-screenY, mbutton, pressCount) then
			return true
		end

		-- Trigger the internal mousepressed event handler.
		local handled, grabFocus = el:_mousepressed(mx, my, mbutton, pressCount)
		if handled then
			if grabFocus and not next(self._mouseFocusSet) then
				setMouseFocus(self, el, mbutton)
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

-- handled = gui:mousemoved( mouseX, mouseY )
function Gui:mousemoved(mx, my)
	if not(type(mx)=="number" or mx==nil) then argerror(2,1,"mx",mx,"number","nil") end
	if not(type(my)=="number" or my==nil) then argerror(2,2,"my",my,"number","nil") end

	self._mouseX = mx
	self._mouseY = my

	if self._animationLockCount > 0 then  return true  end

	if not updateLayoutIfNeeded(self) then
		updateHoveredElement(self) -- Make sure hovered element updates whenever mouse moves.
	end

	local focus = self._mouseFocus
	if not focus then  return false  end

	local el = (mx and focus or self._hoveredElement)
	if el then
		el:_mousemoved(mx, my)
		trigger(el, "mousemoved", mx-el:getXOnScreen(), my-el:getYOnScreen())
	end

	return true
end

-- handled = gui:mousereleased( mouseX, mouseY, mouseButton )
function Gui:mousereleased(mx, my, mbutton)
	if type(mx)~="number" then argerror(2,1,"mx",mx,"number") end
	if type(my)~="number" then argerror(2,2,"my",my,"number") end
	if type(mbutton)~="number" then argerror(2,3,"mbutton",mbutton,"number") end

	self._mouseX = mx
	self._mouseY = my

	local focus = self._mouseFocus
	if not (focus and self._mouseFocusSet[mbutton]) then
		return false
	end

	self._mouseFocusSet[mbutton] = nil

	updateLayoutIfNeeded(self) -- Updates hovered element.

	local el = (focus or self._hoveredElement)
	if el then
		el:_mousereleased(mx, my, mbutton)
	end

	if not next(self._mouseFocusSet) then
		setMouseFocus(self, nil)
	end

	if el then
		trigger(el, "mousereleased", mx-el:getXOnScreen(), my-el:getYOnScreen(), mbutton)
	end

	return true
end

-- handled = gui:wheelmoved( dx, dy )
function Gui:wheelmoved(dx, dy)
	if type(dx)~="number" then argerror(2,1,"dx",dx,"number") end
	if type(dy)~="number" then argerror(2,2,"dy",dy,"number") end

	if self._animationLockCount > 0 then  return true  end

	local isScroll = (dx ~= 0 or dy ~= 0)

	-- Shift key swaps X and Y scrolling.
	if love.keyboard.isDown("lshift","rshift") then
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
			if el:trigger("wheelmoved", dx, dy) then  return true  end

			if el:_wheelmoved(dx, dy) then  return true  end
		end

		if focus then  return focus:isSolid()  end

		anyIsSolid = anyIsSolid or el:isSolid()
		el         = el._parent
	end

	return anyIsSolid
end



--==============================================================



-- bool = gui:areStandardKeysActive( )
function Gui:areStandardKeysActive()
	return self._standardKeysAreActive
end

-- gui:setStandardKeysActive( bool )
function Gui:setStandardKeysActive(active)
	self._standardKeysAreActive = active
end



-- gui:blur( )
function Gui:blur()
	if self._mouseFocus then
		for mbutton in pairs(self._mouseFocusSet) do
			self:mousereleased(-99999, -99999, mbutton)
		end
	end

	setMouseFocus(self, nil)

	self._hoveredElement = nil
	self._mouseX         = nil
	self._mouseY         = nil
end



--
-- gui:defineStyle( styleName, styleData )
-- styleData = { parameter1=value, ..., [1]=child1StyleData, ... }
--
-- Examples:
--     gui:defineStyle("centered", {originX=.5, originY=.5, anchorX=.5, anchorY=.5})
--     gui:defineStyle("dialogHeader", {background="header",
--         [2] = {bold=true, textColor={1,1,1,.86}}, -- Style data for the second child.
--     })
--
function Gui:defineStyle(styleName, styleData)
	if type(styleName)~="string" then argerror(2,1,"styleName",styleName,"string") end
	if type(styleData)~="table" then argerror(2,2,"styleData",styleData,"table") end
	self._styles[styleName] = styleData
end



-- element = gui:find( id )
function Gui:find(id)
	local root = self._root
	if root then
		return (root._id == id and root or root:find(id))
	end
	return nil
end

-- elements = gui:findAll( id )
function Gui:findAll(id)
	local root = self._root
	if not root then  return {}  end

	local els = root:findAll(id)
	if root._id == id then
		table.insert(els, 1, root)
	end

	return els
end

-- element = gui:findActive( )
function Gui:findActive()
	local root = self._root
	return (root and root:findActive())
end

-- element = gui:findToggled( )
function Gui:findToggled()
	local root = self._root
	return (root and root:findToggled())
end

-- Match an element using a CSS-like selector.
-- element  = gui:match( selector )
-- selector = "elementType #id .tag" -- Sequence of space-separated element types, IDs and tags.
-- Note: Element types include subtypes (e.g. 'bar' includes both 'vbar' and 'hbar').
function Gui:match(selector)
	local root = self._root
	if not root then  return nil  end
	return root:match(selector, true)
end

-- Match elements using a CSS-like selector.
-- elements = gui:matchAll( selector )
-- selector = "elementType #id .tag" -- Sequence of space-separated element types, IDs and tags.
-- Note: Element types include subtypes (e.g. 'bar' includes both 'vbar' and 'hbar').
function Gui:matchAll(selector)
	local root = self._root
	if not root then  return {}  end
	return root:matchAll(selector, true)
end



-- sound = gui:getDefaultSound( soundKey )
function Gui:getDefaultSound(soundK)
	if type(soundK)~="string" then argerror(2,1,"soundK",soundK,"string") end
	checkValidSoundKey(soundK, 2)
	return self._defaultSounds[soundK]
end

-- gui:setDefaultSound( soundKey, sound )
-- gui:setDefaultSound( soundKey, nil ) -- Remove default sound.
-- Note: 'sound' is the value sent to the GUI sound player callback.
function Gui:setDefaultSound(soundK, sound)
	if type(soundK)~="string" then argerror(2,1,"soundK",soundK,"string") end
	checkValidSoundKey(soundK, 2)
	self._defaultSounds[soundK] = sound
end



-- element = gui:getElementAt( x, y [, includeNonSolid=false ] )
function Gui:getElementAt(x, y, nonSolid)
	local root = self._root
	if root and not root._hidden then
		return root:getElementAt(x, y, nonSolid)
	end
	return nil
end



-- font = gui:getFont( )
function Gui:getFont()
	return self._font
end

-- gui:setFont( font )
function Gui:setFont(font)
	if self._font == font then  return  end
	self._font = font
	self._layoutNeedsUpdate = true
end

-- font = gui:getBoldFont( )
function Gui:getBoldFont()
	return self._fontBold
end

-- gui:setBoldFont( font )
function Gui:setBoldFont(font)
	if self._fontBold == font then  return  end
	self._fontBold = font
	self._layoutNeedsUpdate = true
end

-- font = gui:getSmallFont( )
function Gui:getSmallFont()
	return self._fontSmall
end

-- gui:setSmallFont( font )
function Gui:setSmallFont(font)
	if self._fontSmall == font then  return  end
	self._fontSmall = font
	self._layoutNeedsUpdate = true
end

-- font = gui:getLargeFont( )
function Gui:getLargeFont()
	return self._fontLarge
end

-- gui:setLargeFont( font )
function Gui:setLargeFont(font)
	if self._fontLarge == font then  return  end
	self._fontLarge = font
	self._layoutNeedsUpdate = true
end

-- font = gui:getTooltipFont( )
function Gui:getTooltipFont()
	return self._fontTooltip
end

-- gui:setTooltipFont( font )
function Gui:setTooltipFont(font)
	self._fontTooltip = font
end



-- element = gui:getHoveredElement( )
function Gui:getHoveredElement()
	return self._hoveredElement
end



do
	local function setNavigationTarget(self, widget)
		if self._navigationTarget == widget then
			return false -- no change
		end
		self._navigationTarget    = widget
		self._timeSinceNavigation = 0
		if widget then
			widget:scrollIntoView()
		end
		;(widget or self._root):triggerBubbling("navigated", widget)
		return true -- change happened!
	end

	-- widget = gui:getNavigationTarget( )
	function Gui:getNavigationTarget()
		return self._navigationTarget
	end

	-- success = gui:navigateTo( widget )
	function Gui:navigateTo(widget)
		if self._navigationTarget == widget then  return true   end
		if self._lockNavigation             then  return false  end
		if not self:canNavigateTo(widget)   then  return false  end
		setNavigationTarget(self, widget)
		return true
	end

	do
		local function navigateToNextOrPrevious(self, id, allowNone, usePrev)
			local root = self._root
			if not root or root._hidden then  return nil  end

			local nav = self._navigationTarget
			if not nav and not usePrev then  return self:navigateToFirst()  end

			local foundNav   = false
			local lastWidget = nil

			for el in (nav and nav:getNavigationRoot() or root):traverseVisible() do
				-- Note: Remember that we're traversing backwards.
				local elIsValid = el:is(Cs.widget) and (not id or el._id == id)

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

				if elIsValid then  lastWidget = el  end

				if el._captureInput or el._captureGuiInput then  break  end
			end

			if not allowNone then  return nav  end

			setNavigationTarget(self, nil)
			return nil
		end

		-- element = gui:navigateToNext( [ id=any, allowNone=false ] )
		-- Note: Calls gui:navigateToFirst() if there's no current navigation target.
		function Gui:navigateToNext(id, allowNone)
			return navigateToNextOrPrevious(self, id, allowNone, false)
		end

		-- element = gui:navigateToPrevious( [ id=any, allowNone=false ] )
		function Gui:navigateToPrevious(id, allowNone)
			return navigateToNextOrPrevious(self, id, allowNone, true)
		end
	end

	-- element = gui:navigateToFirst( )
	function Gui:navigateToFirst()
		if self._lockNavigation then  return nil  end

		local root = self._root
		if not root or root._hidden then  return nil  end

		local first = nil

		for el in root:traverseVisible() do
			if el:is(Cs.widget) and not (first and first._priority > el._priority) then
				first = el
			end
			if el._captureInput or el._captureGuiInput then
				break
			end
		end

		setNavigationTarget(self, first)
		return first
	end

	-- landingElement = gui:navigate( angle )
	function Gui:navigate(angle)
		if self._lockNavigation then  return nil  end

		local root = self._root
		if not root or root._hidden then  return nil  end

		local nav = self._navigationTarget
		if not nav then  return self:navigateToFirst()  end

		if trigger(nav, "navigate", angle) then
			return self._navigationTarget -- Suppress default behavior.
		end

		local closestEl = nav:getClosestInDirection(angle)
		if closestEl then
			setNavigationTarget(self, closestEl)
		end

		return (closestEl or nav)
	end

	-- bool = gui:canNavigateTo( element|nil )
	-- Note: Does not check if navigation is locked.
	function Gui:canNavigateTo(widget)
		if widget == nil            then  return true   end -- Navigation target can always be nothing.
		if not widget:is(Cs.widget) then  return false  end
		if not widget:isDisplayed() then  return false  end

		local root = self._root
		if not root or root._hidden then  return false  end

		for el in root:traverseVisible() do
			if el == widget then
				return true
			elseif (el._captureInput or el._captureGuiInput) then
				return false
			end
		end

		error("Somehow the element is a displayed active widget but not among the visible elements under the root.")
	end
end



-- root = gui:getRoot( )
function Gui:getRoot()
	return self._root
end



-- converter = gui:getScissorCoordsConverter( )
function Gui:getScissorCoordsConverter()
	return self._scissorCoordsConverter
end

-- gui:setScissorCoordsConverter( converter|nil )
function Gui:setScissorCoordsConverter(converter)
	self._scissorCoordsConverter = converter
end



-- speedX, speedY = gui:getScrollSpeed( )
function Gui:getScrollSpeed()
	return self._scrollSpeedX, self._scrollSpeedY
end

-- gui:setScrollSpeed( speedX [, speedY=speedX ] )
function Gui:setScrollSpeed(speedX, speedY)
	if type(speedX)~="number" then argerror(2,1,"speedX",speedX,"number") end
	if not(type(speedY)=="number" or speedY==nil) then argerror(2,2,"speedY",speedY,"number","nil") end
	self._scrollSpeedX = speedX
	self._scrollSpeedY = speedY or speedX
end



-- soundPlayer = gui:getSoundPlayer( )
function Gui:getSoundPlayer()
	return self._soundPlayer
end

-- gui:setSoundPlayer( soundPlayer|nil )
-- soundPlayer = function( sound )
function Gui:setSoundPlayer(soundPlayer)
	self._soundPlayer = soundPlayer
end



-- spriteLoader = gui:getSpriteLoader( )
function Gui:getSpriteLoader()
	return self._spriteLoader
end

-- gui:setSpriteLoader( spriteLoader|nil )
-- image, frames = spriteLoader( spriteName )
-- frames        = { frame1, ... }
-- frame         = { duration=duration, quad=quad }
function Gui:setSpriteLoader(spriteLoader)
	self._spriteLoader = spriteLoader
end



-- targetElement = gui:getTarget( target )
-- target        = "ID.subID.anotherSubID" -- Sequence of dot-separated IDs.
-- Returns nil and a message on error.
function Gui:getTarget(target)
	local el = self._root
	if not el then  return nil, "There is no root element."  end

	local ids = matchAll(target, "[^.]+") -- @Memory

	for i = 1, #ids do
		if not el:is(Cs.container) then
			return false, F("'%s' is not a container.", el._id)
		end

		el = el:find(ids[i])
		if not el then
			return nil, F("'%s' does not exist in '%s'.", ids[i], (ids[i-1] or "root"))
		end
	end

	return el
end

-- target, event  = gui:parseTargetAndEvent( targetAndEvent )
-- targetAndEvent = "ID.subID.anotherSubID.event" -- Sequence of dot-separated IDs followed by a dot and an event name.
-- Returns nil and a message on error.
function Gui:parseTargetAndEvent(targetAndEvent) -- @Cleanup: This shouldn't be a method!
	local target, event = targetAndEvent:match"^(.-)%.?([^.]+)$"
	if not target then
		return nil, F("Bad targetAndEvent format '%s'.", targetAndEvent)
	end

	return target, event
end

-- callback       = gui:getTargetCallback( targetAndEvent )
-- targetAndEvent = "ID.subID.anotherSubID.event" -- Sequence of dot-separated IDs followed by a dot and an event name.
-- Returns nil and a message on error.
-- Returns nil (and no message) if there's no callback.
function Gui:getTargetCallback(targetAndEvent)
	local target, eventOrErr = self:parseTargetAndEvent(targetAndEvent)
	if not target then  return nil, eventOrErr  end

	local el, err = self:getTarget(target)
	if not el then  return nil, err  end

	return el:getCallback(eventOrErr)
end

-- targetElement  = gui:setTargetCallback( targetAndEvent, callback|nil )
-- targetAndEvent = "ID.subID.anotherSubID.event" -- Sequence of dot-separated IDs followed by a dot and an event name.
-- Returns nil and a message on error.
function Gui:setTargetCallback(targetAndEvent, cb)
	local target, eventOrErr = self:parseTargetAndEvent(targetAndEvent)
	if not target then  return nil, eventOrErr  end

	local el, err = self:getTarget(target)
	if not el then  return nil, err  end

	el:on(eventOrErr, cb)
	return el
end



-- textPreprocessor|nil = gui:getTextPreprocessor( )
function Gui:getTextPreprocessor()
	return self._textPreprocessor
end

-- gui:setTextPreprocessor( textPreprocessor|nil )
-- newText = textPreprocessor( text, element, mnemonicsAreEnabled )
function Gui:setTextPreprocessor(f)
	if not(type(f)=="function" or f==nil) then argerror(2,1,"f",f,"function","nil") end
	self._textPreprocessor = f
end

-- gui:reprocessTexts( )
-- Manually re-preprocess texts. Useful if e.g. the program's language has changed.
function Gui:reprocessTexts()
	local root = self._root
	if root then
		root:reprocessTexts()
	end
end



-- theme|nil = gui:getTheme( )
function Gui:getTheme()
	return self._theme
end

-- gui:setTheme( theme|nil )
function Gui:setTheme(theme)
	if not(type(theme)=="table" or theme==nil) then argerror(2,1,"theme",theme,"table","nil") end
	if self._theme == theme then  return  end
	self._theme             = theme
	self._layoutNeedsUpdate = true
end



-- time = gui:getTime( )
function Gui:getTime()
	return self._time
end

-- time = gui:getTimeSinceNavigation( )
function Gui:getTimeSinceNavigation()
	return self._timeSinceNavigation
end



-- bool = gui:isBusy( )
function Gui:isBusy()
	return (self:isKeyboardBusy() or self:isMouseBusy())
end

-- bool = gui:isKeyboardBusy( )
function Gui:isKeyboardBusy()
	return (self._keyboardFocus ~= nil)
end

-- bool = gui:isMouseBusy( )
function Gui:isMouseBusy()
	return (self._mouseFocus ~= nil)
end



-- bool = gui:isIgnoringKeyboardInput( )
function Gui:isIgnoringKeyboardInput()
	return self._ignoreKeyboardInputThisFrame
end



-- bool = gui:isInputCaptured( [ includeGuiInput=false ] )
function Gui:isInputCaptured(includeGuiInput)
	local root = self._root
	if not root or root._hidden then  return false  end

	for el in root:traverseVisible() do
		if el._captureInput or (includeGuiInput and el._captureGuiInput) then
			return true
		end
	end

	return false
end



-- bool = gui:isInteractionLocked( )
function Gui:isInteractionLocked()
	return (self._animationLockCount > 0)
end



-- bool = gui:isMouseGrabbed( )
function Gui:isMouseGrabbed()
	return self._mouseIsGrabbed
end

-- gui:setMouseIsGrabbed( bool )
function Gui:setMouseIsGrabbed(grabbed)
	self._mouseIsGrabbed = grabbed
end



-- gui:load( elementData )
-- elementData = { type=elementType, parameter1=value, ..., [1]=child1Data, ... }
-- elementData = {      elementType, parameter1=value, ..., [1]=child1Data, ... }
function Gui:load(elData)
	if getTypeFromElementData(elData) ~= "root" then
		errorf(2, "Gui root element must be of type 'root'.")
	end

	local root = Cs.root(self, elData, nil)
	self._root = root

	printHeres(self)

	local themeInit = themeGet(self, "init")
	themeInit(root)
	for el in root:traverse() do
		themeInit(el)
	end

	self._layoutNeedsUpdate = true
end



-- handled = gui:ok( )
-- Trigger 'ok' action.
function Gui:ok()
	local nav = self._navigationTarget
	if nav and nav._active then  return nav:_ok()  end
	return false
end

-- handled = gui:back( )
-- Trigger 'back' action.
function Gui:back()
	local root = self._root
	if not root or root._hidden then  return false  end

	-- Close closable (like Escape does).
	for el in root:traverseVisible() do
		if el:canClose() then
			el:close()
			return true
		elseif el._captureInput or el._captureGuiInput then
			break
		end
	end

	return false
end



-- gui:updateLayout( )
-- Force a layout update. (Should never be needed as it's done automatically.)
function Gui:updateLayout()
	local root = self._root
	if root and not root._hidden then
		return updateLayout(root)
	end
end



--==============================================================
--= Image mixin ================================================
--==============================================================



Ms.imageMixin = {
	-- Parameters.
	_imageBackgroundColor = nil,
	_imageColor           = nil,
	_imageScaleX          = 1.0, _imageScaleY = 1.0,
	_sprite               = nil,

	_spriteName = nil,
}

local function initImageMixin(self, elData)
	retrieve(self, elData, "_imageBackgroundColor")
	retrieve(self, elData, "_imageColor")
	-- retrieve(self, elData, "_imageScaleX","_imageScaleY")
	-- retrieve(self, elData, "_sprite")

	self._imageScaleX = elData.imageScaleX or elData.imageScale or self._imageScaleX
	self._imageScaleY = elData.imageScaleY or elData.imageScale or self._imageScaleY

	self:setSprite(elData.sprite)
end



-- imageMixinElement:drawImage( x, y )
function Ms.imageMixin:drawImage(x, y)
	if not self._sprite then  return  end
	local image, quad = getCurrentViewOfSprite(self._sprite)
	local padding = (self:is(Cs.button) and self._imagePadding or 0)
	love.graphics.draw(image, quad, x+padding, y+padding, 0, self._imageScaleX, self._imageScaleY)
end



-- colorTable|nil = imageMixinElement:getImageBackgroundColor( )
function Ms.imageMixin:getImageBackgroundColor()
	return self._imageBackgroundColor
end

-- imageMixinElement:setImageBackgroundColor( colorTable|nil )
function Ms.imageMixin:setImageBackgroundColor(color)
	self._imageBackgroundColor = color
end

-- bool = imageMixinElement:hasImageBackgroundColor( )
function Ms.imageMixin:hasImageBackgroundColor()
	return (self._imageBackgroundColor ~= nil)
end

-- hasImageBackgroundColor = imageMixinElement:useImageBackgroundColor( [ alphaMultiplier=1 ] )
-- Tell LÖVE to use the image background color.
function Ms.imageMixin:useImageBackgroundColor(opacity)
	local color = self._imageBackgroundColor
	useColor((color or COLOR_TRANSPARENT), opacity)
	return (color ~= nil)
end



-- colorTable|nil = imageMixinElement:getImageColor( )
function Ms.imageMixin:getImageColor()
	return self._imageColor
end

-- imageMixinElement:setImageColor( colorTable|nil )
function Ms.imageMixin:setImageColor(color)
	self._imageColor = color
end

-- bool = imageMixinElement:hasImageColor( )
function Ms.imageMixin:hasImageColor()
	return (self._imageColor ~= nil)
end

-- hasImageColor = imageMixinElement:useImageColor( [ alphaMultiplier=1 ] )
-- Tell LÖVE to use the image color.
function Ms.imageMixin:useImageColor(opacity)
	local color = self._imageColor
	useColor((color or COLOR_WHITE), opacity)
	return (color ~= nil)
end



-- width, height = imageMixinElement:getImageDimensions( )
function Ms.imageMixin:getImageDimensions()
	local sprite = self._sprite
	if not sprite then  return 0, 0  end
	return sprite.width, sprite.height
end

-- Sets the scale of the image by specifying a size. Does nothing if there's no image.
-- imageMixinElement:setImageSize( width, height )
function Ms.imageMixin:setImageSize(w, h)
	local sprite = self._sprite
	if not sprite then  return  end
	self:setImageScale(w/sprite.width, h/sprite.height)
end

-- Scales the image so it fills the element. Does nothing if there's no image or if no dimensions are set.
-- imageMixinElement:maximizeImageSize( [ extraWidth=0, extraHeight=0 ] )
function Ms.imageMixin:maximizeImageSize(extraWidth, extraHeight)
	local sprite = self._sprite
	if not sprite then  return  end

	local paddingSum = (self:is(Cs.button) and 2*self._imagePadding or 0)

	local scaleX = (self._width  and (self._width -paddingSum+(extraHeight or 0))/sprite.width  or self._imageScaleX)
	local scaleY = (self._height and (self._height-paddingSum+(extraWidth  or 0))/sprite.height or self._imageScaleY)
	self:setImageScale(scaleX, scaleY)
end



-- scaleX, scaleY = imageMixinElement:getImageScale( )
-- scale = imageMixinElement:getImageScaleX( )
-- scale = imageMixinElement:getImageScaleY( )
function Ms.imageMixin:getImageScale()
	return self._imageScaleX, self._imageScaleY
end
function Ms.imageMixin:getImageScaleX()
	return self._imageScaleX
end
function Ms.imageMixin:getImageScaleY()
	return self._imageScaleY
end

-- imageMixinElement:setImageScale( scaleX [, scaleY=scaleX ] )
-- imageMixinElement:setImageScaleX( scale )
-- imageMixinElement:setImageScaleY( scale )
function Ms.imageMixin:setImageScale(sx, sy)
	if type(sx)~="number" then argerror(2,1,"sx",sx,"number") end
	if not(type(sy)=="number" or sy==nil) then argerror(2,2,"sy",sy,"number","nil") end

	sy = sy or sx
	if self._imageScaleX == sx and self._imageScaleY == sy then  return  end

	self._imageScaleX = sx
	self._imageScaleY = sy
	if self._sprite then  scheduleLayoutUpdateIfDisplayed(self)  end
end
function Ms.imageMixin:setImageScaleX(sx)
	if type(sx)~="number" then argerror(2,1,"sx",sx,"number") end
	if self._imageScaleX == sx then  return  end

	self:setImageScale(sx, self._imageScaleY)
	if self._sprite then  scheduleLayoutUpdateIfDisplayed(self)  end
end
function Ms.imageMixin:setImageScaleY(sy)
	if type(sy)~="number" then argerror(2,1,"sy",sy,"number") end
	if self._imageScaleY == sy then  return  end

	self:setImageScale(self._imageScaleY, sy)
	if self._sprite then  scheduleLayoutUpdateIfDisplayed(self)  end
end



-- spriteName|nil = imageMixinElement:getSprite( )
function Ms.imageMixin:getSprite()
	return self._spriteName
end

-- imageMixinElement:setSprite( image [, quad ] )
-- imageMixinElement:setSprite( image, frames )
-- imageMixinElement:setSprite( spriteName )
-- imageMixinElement:setSprite( nil ) -- Remove sprite.
-- frames = { frame1, ... }
-- frame  = { duration=duration, quad=quad }
function Ms.imageMixin:setSprite(imageOrName, framesOrQuad)
	if not(type(imageOrName)=="userdata" or type(imageOrName)=="string" or imageOrName==nil) then argerror(2,1,"imageOrName",imageOrName,"userdata","string","nil") end

	local image      = nil
	local spriteName = ""

	if type(imageOrName) == "string" then
		spriteName = imageOrName
		if spriteName ~= "" and spriteName == self._spriteName then  return  end

		local spriteLoader = self._gui._spriteLoader
		if not spriteLoader then
			printerr(2, "There is no sprite loader to convert the sprite name %q to a sprite.", spriteName)
			return
		end

		image, framesOrQuad = spriteLoader(spriteName)
		if not image then
			printerr(2, "The sprite loader did not return a required image for sprite name %q.", spriteName)
			return
		end

	elseif imageOrName then
		if not(type(framesOrQuad)=="userdata" or type(framesOrQuad)=="table" or framesOrQuad==nil) then argerror(2,2,"framesOrQuad",framesOrQuad,"userdata","table","nil") end
		image = imageOrName
	end

	local oldIw, oldIh = 0, 0
	if self._sprite then
		oldIw, oldIh = self._sprite.width, self._sprite.height
	end

	self._sprite     = image and newSprite(image, framesOrQuad)
	self._spriteName = spriteName

	local iw, ih = 0, 0
	if self._sprite then
		iw, ih = self._sprite.width, self._sprite.height
	end

	if not (iw == oldIw and ih == oldIh) then
		scheduleLayoutUpdateIfDisplayed(self)
	end
end

-- bool = imageMixinElement:hasSprite( )
function Ms.imageMixin:hasSprite()
	return (self._sprite ~= nil)
end



--==============================================================
--= Element class (virtual) ====================================
--==============================================================



Cs.element = newElementClass("GuiElement", nil, {}, {
	--[[STATIC]] _events = {--[[ event1, [event1]=true, ... ]]},

	-- Parameters.
	_anchorX      = 0.0, _anchorY = 0.0, -- where in self to base off x and y
	_background   = nil,
	_captureInput = false, --[[all input]] _captureGuiInput = false, --[[all input affecting GUI]]
	_closable     = false,
	_data         = nil,
	_floating     = false, -- disables natural positioning in certain parents (e.g. bars)
	_hidden       = false,
	_id           = "",
	_minWidth     = 0, _minHeight = 0,
	_mouseCursor  = nil,
	_originX      = 0.0, _originY = 0.0, -- where in the parent to base x and y off
	_sounds       = nil,
	_spacing      = 0,   _spacingVertical = nil, _spacingHorizontal = nil,
	_spacingTop   = nil, _spacingRight    = nil, _spacingBottom     = nil, _spacingLeft = nil,
	_style        = "",
	_tags         = nil,
	_tooltip      = "", _unprocessedTooltip = "",
	_width        = nil, _height = nil,
	_x            = 0, _y = 0, -- offset from origin

	_animations             = nil,
	_automaticId            = false,
	_callbacks              = nil,
	_gui                    = nil,
	_layoutExpandablesX     = 0,   _layoutExpandablesY      = 0,
	_layoutImmediateOffsetX = 0,   _layoutImmediateOffsetY  = 0, -- Sum of parents' scrolling, excluding smooth scrolling.
	_layoutInnerSpacingsX   = 0,   _layoutInnerSpacingsY    = 0,
	_layoutInnerStaticWidth = 0,   _layoutInnerStaticHeight = 0,
	_layoutInnerWidth       = 0,   _layoutInnerHeight       = 0,
	_layoutOffsetX          = 0.0, _layoutOffsetY           = 0.0, -- Sum of parents' scrolling.
	_layoutWidth            = 0,   _layoutHeight            = 0,
	_layoutX                = 0,   _layoutY                 = 0,
	_parent                 = nil,
	_timeBecomingVisible    = 0.00,

	data = nil,
}, {
	"beforedraw"   , --            function( self, event, x, y, w, h )
	"afterdraw"    , --            function( self, event, x, y, w, h )

	"close"        , -- suppress = function( self, event )
	"closed"       , --            function( self, event )

	"focused"      , --            function( self, event )
	"blurred"      , --            function( self, event )

	"init"         , --            function( self, event )

	"keypressed"   , -- suppress = function( self, event, key, scancode, isRepeat )

	"layout"       , --            function( self, event )

	"mousepressed" , --            function( self, event, mx, my, mbutton, pressCount )
	"mousemoved"   , --            function( self, event, mx, my )
	"mousereleased", --            function( self, event, mx, my, mbutton )

	"navigated"    , --            function( self, event )

	"pressed"      , --            function( self, event )

	"refresh"      , --            function( self, event )

	"show"         , --            function( self, event )
	"hide"         , --            function( self, event )

	"textinput"    , -- suppress = function( self, event, text )

	"update"       , --            function( self, event, dt )

	"wheelmoved"   , -- suppress = function( self, event, dx, dy )
})

function Cs.element:init(gui, elData, parent)
	self._gui    = gui or error("Missing gui object argument.")
	self._parent = parent

	self._animations = {}
	self._callbacks  = {}

	local styleName = elData.style

	if styleName then
		local styleData = gui._styles[styleName] or errorf("No style with name '%s' exist.", styleName)
		applyStyle(elData, styleData)
		self._style = styleName
	end

	retrieve(self, elData, "_anchorX", "_anchorY")
	retrieve(self, elData, "_background")
	retrieve(self, elData, "_captureInput", "_captureGuiInput")
	retrieve(self, elData, "_closable")
	-- retrieve(self, elData, "_data")
	retrieve(self, elData, "_floating")
	retrieve(self, elData, "_hidden")
	retrieve(self, elData, "_id")
	retrieve(self, elData, "_minWidth", "_minHeight")
	-- retrieve(self, elData, "_mouseCursor")
	retrieve(self, elData, "_originX", "_originY")
	-- retrieve(self, elData, "_sounds")
	retrieve(self, elData, "_spacing", "_spacingVertical", "_spacingHorizontal")
	retrieve(self, elData, "_spacingTop", "_spacingRight", "_spacingBottom", "_spacingLeft")
	-- retrieve(self, elData, "_style")
	-- retrieve(self, elData, "_tags")
	-- retrieve(self, elData, "_tooltip")
	retrieve(self, elData, "_width", "_height")
	retrieve(self, elData, "_x", "_y")

	self._timeBecomingVisible = gui._time

	-- Set data table.
	if not (elData.data == nil or type(elData.data) == "table") then  error("Assertion failed: elData.data == nil or type(elData.data) == \"table\"")  end
	self._data = elData.data or {}
	self.data  = self._data -- element.data is exposed for easy access.

	-- Make sure the element has an ID.
	if self._id == "" then
		local numId          = gui._lastAutomaticId + 1
		gui._lastAutomaticId = numId
		self._id             = "__"..numId
		self._automaticId    = true
	end

	-- Set sounds table.
	self._sounds = {}
	if elData.sounds ~= nil then
		if not (type(elData.sounds) == "table") then  error("Assertion failed: type(elData.sounds) == \"table\"")  end
		for soundK, sound in pairs(elData.sounds) do
			checkValidSoundKey(soundK, 2)
			self._sounds[soundK] = sound
		end
	end

	-- Add tags.
	self._tags = {}
	if elData.tags ~= nil then
		if not (type(elData.tags) == "table") then  error("Assertion failed: type(elData.tags) == \"table\"")  end
		for _, tag in ipairs(elData.tags) do
			self._tags[tag] = true
		end
	end

	if elData.mouseCursor ~= nil then  self:setMouseCursor(elData.mouseCursor)  end
	if elData.tooltip     ~= nil then  self:setTooltip(elData.tooltip)          end

	-- Set initial offset.
	if parent then
		self._layoutImmediateOffsetX = parent._layoutImmediateOffsetX+parent._scrollX
		self._layoutImmediateOffsetY = parent._layoutImmediateOffsetY+parent._scrollY
		self._layoutOffsetX = parent._layoutOffsetX+parent._visualScrollX
		self._layoutOffsetY = parent._layoutOffsetY+parent._visualScrollY
	end

	-- The 'here' debug attribute prints the path to the element.
	if elData.here then  table.insert(gui._heres, self)  end

	if elData.debug then  gui.debug = true  end
end



-- INTERNAL  element:_update( deltaTime )
function Cs.element:_update(dt)
	-- void
end



-- INTERNAL  element:_draw( )
function Cs.element:_draw()
	local x, y, w, h = xywh(self)

	if not self._gui.debug then
		triggerIncludingAnimations(self, "beforedraw", x, y, w, h)
	end

	drawLayoutBackground(self)

	if not self._gui.debug then
		triggerIncludingAnimations(self, "afterdraw", x, y, w, h)
	end
end

-- INTERNAL  element:_drawDebug( red, green, blue [, backgroundOpacity=1 ] )
function Cs.element:_drawDebug(r, g, b, bgOpacity)
	local gui = self._gui
	if not gui.debug then  return  end

	local isContainer = self:is(Cs.container)

	local x, y, w, h = xywh(self)
	local innerW, innerH = self._layoutInnerWidth, self._layoutInnerHeight
	local padding = (isContainer and self._padding or 0)
	local lw = math.max(padding, 1)

	local sbW = themeGet(gui, "scrollbarWidth")

	if self:isKeyboardFocus() then
		r, g, b = 1, 1, 0
	elseif self:isNavigationTarget() then
		r, g, b = 1, 1, 1
	end

	love.graphics.push("all")

	love.graphics.translate(x, y)

	-- Background and center line
	setColor(r, g, b, .24*(bgOpacity or 1))
	love.graphics.rectangle("fill", 0, 0, w, h)
	love.graphics.line(padding, padding, w/2, h/2)

	-- Border
	love.graphics.setLineWidth(lw)
	setColor(r, g, b, .4)
	love.graphics.rectangle("line", lw/2, lw/2, w-lw, h-lw)
	if isContainer then
		if self:hasScrollbarOnRight()  then  love.graphics.rectangle("fill", w-lw-sbW, lw, sbW, h-2*lw)  end
		if self:hasScrollbarOnBottom() then  love.graphics.rectangle("fill", lw, h-lw-sbW, w-w*lw, sbW)  end
	end
	love.graphics.setLineWidth(1)
	setColor(r, g, b, .6)
	love.graphics.rectangle("line", 0.5, 0.5, w-1, h-1)

	-- Info
	r, g, b = lerp(r, 1, 0.5), lerp(g, 1, 0.5), lerp(b, 1, 0.5)
	love.graphics.setFont(gui._font or getDefaultFont())
	setColor(r, g, b, .8)
	if self._automaticId then
		love.graphics.print(F("%d.%d"   , self:getDepth(), (self:getIndex() or 0)          ), 2, 1)
	else
		love.graphics.print(F("%d.%d:%s", self:getDepth(), (self:getIndex() or 0), self._id), 2, 1)
	end

	love.graphics.pop()
end

-- INTERNAL  element:_drawTooltip( )
function Cs.element:_drawTooltip()
	local gui  = self._gui
	local text = self._tooltip

	if text == "" or gui._tooltipTime < gui.TOOLTIP_DELAY then  return  end

	local root = gui._root

	local font         = gui._font or getDefaultFont()
	local textW, textH = getTextDimensions(font, text)

	local w, h = themeGetSize(self, "tooltip", textW, textH) -- @Speed: Get tooltip size when tooltip text changes.

	local x = math.max(math.min(self._layoutX+self._layoutImmediateOffsetX, root._width-w), 0)
	local y = self._layoutY + self._layoutHeight + self._layoutImmediateOffsetY

	if y+h > root._height then
		y = math.max(y-h-self._layoutHeight, 0)
	end

	themeRenderOnScreen(self, "tooltip", x, y, w, h, text, textW, textH, gui._tooltipTime-gui.TOOLTIP_DELAY)
end



--
-- element:animate( duration, [ lockInteraction=false, ] callbackTable )
-- callbackTable = { [event1]=callback, ... }
-- callback      = function( element, event, progress, ... )
--
-- Example:
--     myGui:find("myButton"):animate(1, true, {
--         afterdraw = function(myButton, event, progress, x, y, w, h)
--             -- Fade in and out a green cover over the button.
--             setColor(0, 1, 0, .5+.5*math.sin(progress*math.pi))
--             love.graphics.rectangle("fill", x, y, w, h)
--         end,
--     })
--
function Cs.element:animate(duration, lockInteraction, callbacks)
	if type(duration)~="number" then argerror(2,1,"duration",duration,"number") end

	if type(lockInteraction) == "table" then
		lockInteraction, callbacks = false, lockInteraction
	else
		if type(lockInteraction)~="boolean" then argerror(2,2,"lockInteraction",lockInteraction,"boolean") end
	end

	local gui = self._gui

	local anim = {
		element         = self,
		lockInteraction = lockInteraction,
		callbacks       = callbacks,

		startTime       = gui._time,
		endTime         = gui._time+duration,
		duration        = duration,
	}

	table.insert(self._animations, anim)
	table.insert(gui._allAnimations, anim)

	if lockInteraction then
		gui._animationLockCount = gui._animationLockCount+1
	end
end



-- success = element:close( )
-- Trigger 'close' action, if possible.
function Cs.element:close()
	if not self:canClose() then
		return false
	end

	local preparedSound = prepareSound(self, "close")
	if trigger(self, "close") then
		return false -- Suppress default behavior.
	end

	preparedSound()
	self:hide()
	self:triggerBubbling("closed", self)

	return true
end

-- result = element:canClose( )
function Cs.element:canClose()
	return (self._closable and not self._gui._lockNavigation and self:isDisplayed())
end



-- bool = element:exists( )
function Cs.element:exists()
	return (self._parent ~= nil or self == self._gui._root)
end



-- anchorX, anchorY = element:getAnchor( )
-- anchor = element:getAnchorX( )
-- anchor = element:getAnchorY( )
function Cs.element:getAnchor()
	return self._anchorX, self._anchorY
end
function Cs.element:getAnchorX()
	return self._anchorX
end
function Cs.element:getAnchorY()
	return self._anchorY
end

-- element:setAnchor( anchorX, anchorY )
-- element:setAnchorX( anchor )
-- element:setAnchorY( anchor )
function Cs.element:setAnchor(anchorX, anchorY)
	if self._anchorX == anchorX and self._anchorY == anchorY then  return  end
	self._anchorX, self._anchorY = anchorY
	scheduleLayoutUpdateIfDisplayed(self)
end
function Cs.element:setAnchorX(anchor)
	if self._anchorX == anchor then  return  end
	self._anchorX = anchor
	scheduleLayoutUpdateIfDisplayed(self)
end
function Cs.element:setAnchorY(anchor)
	if self._anchorY == anchor then  return  end
	self._anchorY = anchor
	scheduleLayoutUpdateIfDisplayed(self)
end



-- callback|nil = element:getCallback( event )
function Cs.element:getCallback(event)
	return self._callbacks[event]
end

-- element:setCallback( event, callback|nil )
function Cs.element:setCallback(event, cb)
	if type(event)~="string" then argerror(2,1,"event",event,"string") end
	if not(type(cb)=="function" or cb==nil) then argerror(2,2,"cb",cb,"function","nil") end

	if not self._events[event] then
		printerr(2, "Unknown event '%s'. (%s)", event, self:getPathDescription())
		return
	end

	self._callbacks[event] = cb

	-- Since callbacks can only be attached to elements after the actual
	-- initialization has happened we instead trigger the init event here.
	if cb and event == "init" then
		trigger(self, "init")
	end
end

-- element:on( event, callback|nil )
-- Alias for element:setCallback().
Cs.element.on = Cs.element.setCallback

-- element:off( event )
function Cs.element:off(event)
	self:on(event, nil)
end

-- value = element:trigger( event [, extraArgument1, ... ] )
function Cs.element:trigger(event, ...)
	if type(event)~="string" then argerror(2,1,"event",event,"string") end
	if not self._events[event] then
		printerr(2, "Unknown event '%s'. (%s)", event, self:getPathDescription())
		return nil
	end
	return trigger(self, event, ...)
end

-- value = element:triggerBubbling( event [, extraArgument1, ... ] )
function Cs.element.triggerBubbling(el, event, ...)
	if type(event)~="string" then argerror(2,1,"event",event,"string") end

	if not el._events[event] then
		printerr(2, "Unknown event '%s'. (%s)", event, el:getPathDescription())
		return nil
	end

	local returnV = nil
	repeat
		returnV = trigger(el, event, ...)
		el      = el._parent
	until returnV or not el

	return returnV
end



-- closestElement|nil = element:getClosest( elementType )
-- Returns closest ancestor matching elementType (including self).
function Cs.element.getClosest(el, elType)
	local C = requireElementClass(elType)
	repeat
		if el:is(C) then  return el  end
		el = el._parent
	until not el
	return nil
end



do


	local function _getClosestInDirection(navRoot, C, fromX, fromY, angle, ignoreCapture, elToIgnore)
		local closestEl      = nil
		local closestDistSqr = 1/0
		local closestAngDiff = 1/0

		for el in navRoot:traverseVisible() do
			if el ~= elToIgnore and el:is(C) then
				local x, y = el:getPositionOnScreen()
				x          = math.min(math.max(fromX, x+.01), x+el._layoutWidth -.01)
				y          = math.min(math.max(fromY, y+.01), y+el._layoutHeight-.01)

				local dx = x - fromX
				local dy = y - fromY

				local distSqr = dx*dx+dy*dy

				if distSqr <= closestDistSqr then
					local angDiff = math.atan2(dy, dx) - angle
					angDiff       = math.abs(math.atan2(math.sin(angDiff), math.cos(angDiff))) -- Normalize.

					if angDiff < 1.5707963267949 then
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

	-- otherElement|nil = element:getClosestInDirection( angle [, elementType="widget", ignoreInputCaptureState=false, ignoreConfinement=false ] )
	function Cs.element:getClosestInDirection(angle, elType, ignoreCapture, ignoreConfinement)
		if type(angle)~="number" then argerror(2,1,"angle",angle,"number") end
		if not(type(elType)=="string" or elType==nil) then argerror(2,2,"elType",elType,"string","nil") end
		if not(type(ignoreCapture)=="boolean" or ignoreCapture==nil) then argerror(2,3,"ignoreCapture",ignoreCapture,"boolean","nil") end
		if not(type(ignoreConfinement)=="boolean" or ignoreConfinement==nil) then argerror(2,4,"ignoreConfinement",ignoreConfinement,"boolean","nil") end

		local C = elType and requireElementClass(elType) or Cs.widget

		local gui = self._gui
		updateLayoutIfNeeded(gui)

		local navRoot = (ignoreConfinement and gui._root or self:getNavigationRoot())

		local centerX, centerY = self:getLayoutCenterPosition()

		local fromX = centerX+self._layoutOffsetX+0.495*self._layoutWidth *math.cos(angle)
		local fromY = centerY+self._layoutOffsetY+0.495*self._layoutHeight*math.sin(angle)
		local closestEl = _getClosestInDirection(navRoot, C, fromX, fromY, angle, ignoreCapture, self)

		if not closestEl and not ignoreConfinement and navRoot._confineNavigation then
			fromX = centerX+self._layoutOffsetX-10000*math.cos(angle)
			fromY = centerY+self._layoutOffsetY-10000*math.sin(angle)
			closestEl = _getClosestInDirection(navRoot, C, fromX, fromY, angle, ignoreCapture, nil)
		end

		return closestEl
	end
end

do
	local function getNextOrPrevious(self, elType, ignoreCapture, usePrev)
		local C = elType and requireElementClass(elType) or Cs.widget

		local root = self._gui._root
		if not root or root._hidden then  return nil  end

		local foundSelf = false
		local lastMatch = nil

		for el in self:getNavigationRoot():traverseVisible() do
			-- Note: Remember that we're traversing backwards.

			local elIsValid = el:is(C)
			if elIsValid and usePrev and foundSelf then  return el  end

			foundSelf = (foundSelf or el == self)
			if not usePrev and foundSelf then
				return lastMatch -- May be nil.
			end

			if elIsValid then  lastMatch = el  end

			if not ignoreCapture and (el._captureInput or el._captureGuiInput) then
				break
			end

		end
		return nil
	end

	-- otherElement = element:getNext( [ elType="widget", ignoreInputCaptureState=false ] )
	function Cs.element:getNext(elType, ignoreCapture)
		return (getNextOrPrevious(self, elType, ignoreCapture, false))
	end

	-- otherElement = element:getPrevious( [ elType="widget", ignoreInputCaptureState=false ] )
	function Cs.element:getPrevious(elType, ignoreCapture)
		return (getNextOrPrevious(self, elType, ignoreCapture, true))
	end
end



-- value = element:getData( key )
-- Note: element:getData(k) is the same as element.data[k]
function Cs.element:getData(k)
	-- @Memory: We probably don't need _data to always be set, but we'd probably
	-- have to remove the element.data property and change some other things.
	return self._data[k]
end

-- element:setData( key, value )
-- Note: element:setData(key, value) is the same as element.data[key]=value
function Cs.element:setData(k, v)
	self._data[k] = v
end

-- oldDataTable = element:swapData( newDataTable )
function Cs.element:swapData(data)
	if type(data)~="table" then argerror(2,1,"data",data,"table") end
	local oldData = self._data
	self._data    = data
	self.data     = data
	return oldData
end



-- width, height = element:getDimensions( )
-- width  = element:getWidth( )
-- height = element:getHeight( )
function Cs.element:getDimensions()
	return self._width, self._height
end
function Cs.element:getWidth()
	return self._width
end
function Cs.element:getHeight()
	return self._height
end

-- element:setDimensions( width, height )
-- element:setWidth( width )
-- element:setHeight( height )
function Cs.element:setDimensions(w, h)
	if self._width == w and self._height == h then  return  end
	self._width, self._height = w, h
	scheduleLayoutUpdateIfDisplayed(self)
end
function Cs.element:setWidth(w)
	if self._width == w then  return  end
	self._width = w
	scheduleLayoutUpdateIfDisplayed(self)
end
function Cs.element:setHeight(h)
	if self._height == h then  return  end
	self._height = h
	scheduleLayoutUpdateIfDisplayed(self)
end



-- gui = element:getGui( )
function Cs.element:getGui()
	return self._gui
end



-- time = element:getGuiTime( )
-- Alias for element:getGui():getTime().
function Cs.element:getGuiTime()
	return self._gui._time
end



-- id = element:getId( )
function Cs.element:getId()
	return self._id
end

-- bool = element:hasId( id [, id2, ... ] )
function Cs.element:hasId(id, ...)
	if self._id == id then
		return true
	elseif ... then
		return self:hasId(...)
	end
	return false
end



-- index|nil = element:getIndex( )
-- Get the child index in the parent, if there is a parent.
function Cs.element:getIndex()
	local parent = self._parent
	return (parent and parent:indexOf(self))
end

-- depth = element:getDepth( )
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



-- x, y, width, height = element:getLayout( )
function Cs.element:getLayout()
	updateLayoutIfNeeded(self._gui)
	return self._layoutX, self._layoutY, self._layoutWidth, self._layoutHeight
end

-- width, height = element:getLayoutDimensions( )
-- width  = element:getLayoutWidth( )
-- height = element:getLayoutHeight( )
function Cs.element:getLayoutDimensions()
	updateLayoutIfNeeded(self._gui)
	return self._layoutWidth, self._layoutHeight
end
function Cs.element:getLayoutWidth()
	updateLayoutIfNeeded(self._gui)
	return self._layoutWidth
end
function Cs.element:getLayoutHeight()
	updateLayoutIfNeeded(self._gui)
	return self._layoutHeight
end

-- x, y = element:getLayoutPosition( )
-- x = element:getLayoutX( )
-- y = element:getLayoutY( )
function Cs.element:getLayoutPosition()
	updateLayoutIfNeeded(self._gui)
	return self._layoutX, self._layoutY
end
function Cs.element:getLayoutX()
	updateLayoutIfNeeded(self._gui)
	return self._layoutX
end
function Cs.element:getLayoutY()
	updateLayoutIfNeeded(self._gui)
	return self._layoutY
end

-- x, y = element:getLayoutCenterPosition( )
function Cs.element:getLayoutCenterPosition()
	updateLayoutIfNeeded(self._gui)
	return self._layoutX + .5*self._layoutWidth,
	       self._layoutY + .5*self._layoutHeight
end



-- width, height = element:getMinDimensions( )
-- width  = element:getMinWidth( )
-- height = element:getMinHeight( )
function Cs.element:getMinDimensions()
	return self._minWidth, self._minHeight
end
function Cs.element:getMinWidth()
	return self._minWidth
end
function Cs.element:getMinHeight()
	return self._minHeight
end

-- element:setMinDimensions( width, height )
-- element:setMinWidth( width )
-- element:setMinHeight( height )
function Cs.element:setMinDimensions(w, h)
	w = math.max(w or 0, 0)
	h = math.max(h or 0, 0)
	if self._minWidth == w and self._minHeight == h then  return  end
	self._minWidth  = w
	self._minHeight = h
	scheduleLayoutUpdateIfDisplayed(self)
end
function Cs.element:setMinWidth(w)
	w = math.max(w or 0, 0)
	if self._minWidth == w then  return  end
	self._minWidth = w
	scheduleLayoutUpdateIfDisplayed(self)
end
function Cs.element:setMinHeight(h)
	h = math.max(h or 0, 0)
	if self._minHeight == h then  return  end
	self._minHeight = h
	scheduleLayoutUpdateIfDisplayed(self)
end



-- cursor|systemCursorType|nil = element:getMouseCursor( )
function Cs.element:getMouseCursor()
	return self._mouseCursor
end

-- cursor|nil = getResultingMouseCursor( )
function Cs.element:getResultingMouseCursor()
	local cur = self._mouseCursor
	if type(cur) ~= "string" then  return cur  end
	return love.mouse.getSystemCursor(cur)
end

-- element:setMouseCursor( cursor|systemCursorType|nil )
function Cs.element:setMouseCursor(cur)
	if not(type(cur)=="userdata" or type(cur)=="string" or cur==nil) then argerror(2,1,"cur",cur,"userdata","string","nil") end

	if type(cur) == "string" and not pcall(love.mouse.getSystemCursor, cur) then
		errorf(2, "Invalid system cursor type '%s'.", cur)
	end

	self._mouseCursor = cur
end



-- x, y = element:getMousePosition( )
-- x = element:getMouseX( )
-- y = element:getMouseY( )
-- Get the mouse position relative the element.
-- Returns nil if the mouse position is unknown.
function Cs.element:getMousePosition()
	local gui = self._gui
	if not gui._mouseX then  return nil  end

	local x, y = self:getPositionOnScreen()
	return gui._mouseX-x, gui._mouseY-y
end
function Cs.element:getMouseX()
	local x = self._gui._mouseX
	return x and x-self:getXOnScreen()
end
function Cs.element:getMouseY()
	local y = self._gui._mouseY
	return y and y-self:getYOnScreen()
end



-- originX, originY = element:getOrigin( )
-- origin = element:getOriginX( )
-- origin = element:getOriginY( )
function Cs.element:getOrigin()
	return self._originX, self._originY
end
function Cs.element:getOriginX()
	return self._originX
end
function Cs.element:getOriginY()
	return self._originY
end

-- element:setOrigin( originX, originY )
-- element:setOriginX( origin )
-- element:setOriginY( origin )
function Cs.element:setOrigin(originX, originY)
	if self._originX == originX and self._originY == originY then  return  end
	self._originX, self._originY = originX, originY
	scheduleLayoutUpdateIfDisplayed(self)
end
function Cs.element:setOriginX(originX)
	if self._originX == originX then  return  end
	self._originX = originX
	scheduleLayoutUpdateIfDisplayed(self)
end
function Cs.element:setOriginY(originY)
	if self._originY == originY then  return  end
	self._originY = originY
	scheduleLayoutUpdateIfDisplayed(self)
end



-- container|nil = element:getParent( )
function Cs.element:getParent()
	return self._parent
end

-- containers = element:getParents( )
-- Returns an array of parents, with the closest parent first.
-- @Cleanup: Rename to getAllParents().
function Cs.element:getParents()
	local el      = self
	local parents = {} -- @Memory
	local i       = 0

	while true do
		el = el._parent
		if not el then  return parents  end

		i          = i + 1
		parents[i] = el
	end
end

-- bool = element:hasParent( parent )
-- Note: Checks all grandparents too.
function Cs.element.hasParent(el, parent)
	while true do
		el = el._parent
		if not el       then  return false  end
		if el == parent then  return true   end
	end
	return false
end

-- container = element:getParentWithId( id )
function Cs.element.getParentWithId(el, id)
	while true do
		el = el._parent
		if not el       then  return nil  end
		if el._id == id then  return el   end
	end
	return nil
end

-- bool = element:hasParentWithId( id )
function Cs.element:hasParentWithId(id)
	return self:getParentWithId() ~= nil
end

-- for index, container in element:parents( )
-- Iterate over parents, from parent to grandparent.
function Cs.element.parents(el)
	local i = 0

	return function()
		el = el._parent
		if not el then  return  end

		i = i + 1
		return i, el
	end
end

-- for index, container in element:parentsr( )
-- Iterate over parents in reverse, from grandparent to parent.
function Cs.element:parentsr()
	return ipairsr(self:getParents())
end

-- for index, element in element:lineageUp( )
-- Traverse from self to the grandest parent.
function Cs.element.lineageUp(el)
	local i = 0

	return function()
		if not el then  return  end

		local current = el

		i  = i + 1
		el = el._parent

		return i, current
	end
end



local parts = {}

-- description = element:getPathDescription( )
function Cs.element.getPathDescription(el)
	for i = 1, #parts do  parts[i] = nil  end

	while true do
		-- Note that we construct the description in reverse.
		if not el._automaticId then
			table.insert(parts, ")")
			table.insert(parts, el._id)
			table.insert(parts, "(")
		end

		table.insert(parts, el.__name:sub(4)) -- Remove the "Gui" prefix from the class name.

		local i = el:getIndex()
		if i then
			table.insert(parts, ":")
			table.insert(parts, i)
		end

		el = el._parent
		if not el then  break  end

		table.insert(parts, "/")
	end

	reverseArray(parts)
	return table.concat(parts)
end



-- x, y = element:getPosition( )
-- x = element:getX( )
-- y = element:getY( )
function Cs.element:getPosition()
	return self._x, self._y
end
function Cs.element:getX()
	return self._x
end
function Cs.element:getY()
	return self._y
end

-- element:setPosition( x, y )
-- element:setX( x )
-- element:setY( y )
function Cs.element:setPosition(x, y)
	if self._x == x and self._y == y then  return  end
	self._x, self._y = x, y
	scheduleLayoutUpdateIfDisplayed(self)
end
function Cs.element:setX(x)
	if self._x == x then  return  end
	self._x = x
	scheduleLayoutUpdateIfDisplayed(self)
end
function Cs.element:setY(y)
	if self._y == y then  return  end
	self._y = y
	scheduleLayoutUpdateIfDisplayed(self)
end



-- x, y = element:getPositionOnScreen( [ ignoreSmoothScrolling=false ] )
-- x = element:getXOnScreen( [ ignoreSmoothScrolling=false ] )
-- y = element:getYOnScreen( [ ignoreSmoothScrolling=false ] )
function Cs.element:getPositionOnScreen(ignoreSmoothScrolling)
	updateLayoutIfNeeded(self._gui)
	if ignoreSmoothScrolling then
		return self._layoutX+self._layoutImmediateOffsetX, self._layoutY+self._layoutImmediateOffsetY
	else
		return self._layoutX+self._layoutOffsetX, self._layoutY+self._layoutOffsetY
	end
end
function Cs.element:getXOnScreen(ignoreSmoothScrolling)
	updateLayoutIfNeeded(self._gui)
	if ignoreSmoothScrolling then
		return self._layoutX+self._layoutImmediateOffsetX
	else
		return self._layoutX+self._layoutOffsetX
	end
end
function Cs.element:getYOnScreen(ignoreSmoothScrolling)
	updateLayoutIfNeeded(self._gui)
	if ignoreSmoothScrolling then
		return self._layoutY+self._layoutImmediateOffsetY
	else
		return self._layoutY+self._layoutOffsetY
	end
end



-- root|nil = element:getRoot( )
-- Note: Returns the root the element knows of, which itself may have been
-- removed from the GUI. So this function differs slightly from gui:getRoot().
function Cs.element.getRoot(el)
	repeat
		if el.class == Cs.root then  return el  end
		el = el._parent
	until not el
	return nil -- We've been removed from the root.
end

-- container = element:getNavigationRoot( )
function Cs.element:getNavigationRoot()
	local container = self._parent
	if not container then  return nil  end -- Should we allow returning self if we're a container?

	while container._parent do
		if container._confineNavigation then  return container  end
		container = container._parent
	end

	return container -- We've reached the top container we know of.
end



-- sibling = element:getSibling( offset )
-- getSibling(1) returns the next sibling etc.
function Cs.element:getSibling(offset)
	local i = self:getIndex()
	return i and self._parent[i+offset]
end



-- sound|nil = element:getSound( soundKey )
function Cs.element:getSound(soundK)
	if type(soundK)~="string" then argerror(2,1,"soundK",soundK,"string") end
	checkValidSoundKey(soundK, 2)
	return self._sounds[soundK]
end

-- sound|nil = element:getResultingSound( soundKey )
function Cs.element:getResultingSound(soundK)
	if type(soundK)~="string" then argerror(2,1,"soundK",soundK,"string") end
	checkValidSoundKey(soundK, 2)

	local sound = self._sounds[soundK]

	if sound == nil then
		for _, parent in self:parents() do
			sound = parent._sounds[soundK]
			if sound ~= nil then  break  end
		end
		if sound == nil and self._gui then
			sound = self._gui._defaultSounds[soundK]
		end
	end

	if sound == "" then  sound = nil  end -- Special case: An empty string intercepts the bubbling and tells that no sound should be played.

	return sound
end

-- element:setSound( soundKey, sound )
-- element:setSound( soundKey, nil ) -- Remove sound.
function Cs.element:setSound(soundK, sound)
	if type(soundK)~="string" then argerror(2,1,"soundK",soundK,"string") end
	checkValidSoundKey(soundK, 2)
	self._sounds[soundK] = sound
end



-- style = element:getStyle( )
function Cs.element:getStyle()
	return self._style
end

-- @Incomplete: Should there be a element:setStyle()?



-- duration = element:getTimeSinceBecomingVisible( )
function Cs.element:getTimeSinceBecomingVisible()
	return self._gui._time-self._timeBecomingVisible
end



-- tooltip = element:getTooltip( )
function Cs.element:getTooltip()
	return self._tooltip
end

-- element:setTooltip( text )
function Cs.element:setTooltip(unprocessedText)
	unprocessedText = tostring(unprocessedText == nil and "" or unprocessedText)

	local text = preprocessText(self._gui, unprocessedText, self, false)
	if self._tooltip == text then  return  end

	self._tooltip            = text
	self._unprocessedTooltip = unprocessedText
end

-- element:drawTooltip( x, y )
function Cs.element:drawTooltip(x, y)
	love.graphics.print(self._tooltip, x, y)
end



-- font = element:getTooltipFont( )
function Cs.element:getTooltipFont()
	return (self._gui._fontTooltip or getDefaultFont())
end

-- element:useTooltipFont( )
-- Tell LÖVE to use the tooltip font.
function Cs.element:useTooltipFont()
	love.graphics.setFont(self:getTooltipFont())
end



-- bool = element:hasTag( tag )
function Cs.element:hasTag(tag)
	return self._tags[tag] ~= nil -- @Memory: _tags probably don't need to be set at all times. :NilTagsTable
end

-- element:addTag( tag )
function Cs.element:addTag(tag)
	self._tags[tag] = true
end

-- element:removeTag( tag )
-- element:removeAllTags( )
function Cs.element:removeTag(tag)
	self._tags[tag] = nil
end
function Cs.element:removeAllTags()
	self._tags = {} -- @Memory :NilTagsTable
end

-- element:setTag( tag, bool )
function Cs.element:setTag(tag, state)
	if state then
		self:addTag(tag)
	else
		self:removeTag(tag)
	end
end



-- bool = element:isAt( x, y )
function Cs.element:isAt(x, y)
	updateLayoutIfNeeded(self._gui)

	x = x - self._layoutOffsetX
	y = y - self._layoutOffsetY

	return x >= self._layoutX
	   and y >= self._layoutY
	   and x <  self._layoutX + self._layoutWidth
	   and y <  self._layoutY + self._layoutHeight
end



-- handled, grabFocus = element:_keypressed( key, scancode, isRepeat )
function Cs.element:_keypressed(key, scancode, isRepeat)
	return false, false
end

-- INTERNAL  element:_keyreleased( key, scancode )
function Cs.element:_keyreleased(key, scancode)
	-- void
end

-- handled = element:_textinput( text )
function Cs.element:_textinput(text)
	return false
end



-- handled, grabFocus = element:_mousepressed( mouseX, mouseY, mouseButton, pressCount )
function Cs.element:_mousepressed(mx, my, mbutton, pressCount)
	return false, false
end

-- INTERNAL  element:_mousemoved( mouseX, mouseY )
function Cs.element:_mousemoved(mx, my)
	-- void
end

-- INTERNAL  element:_mousereleased( mouseX, mouseY, mouseButton )
function Cs.element:_mousereleased(mx, my, mbutton)
	-- void
end

-- handled = element:_wheelmoved( deltaX, deltaY )
function Cs.element:_wheelmoved(dx, dy)
	return false
end



-- bool = element:isDisplayed( )
-- Returns true if the element and its parents are visible (and the element exists).
function Cs.element.isDisplayed(el)
	if not el:exists() then  return false  end
	repeat
		if el._hidden then  return false  end
		el = el._parent
	until not el
	return true
end

-- hiddenElement|nil = element:getClosestHiddenElement( )
-- hiddenElement|nil = element:getFarthestHiddenElement( )
function Cs.element:getClosestHiddenElement()
	local el = self
	repeat
		if el._hidden then  return el  end
		el = el._parent
	until not el
	return nil
end
function Cs.element:getFarthestHiddenElement()
	local el, hiddenEl = self, nil
	repeat
		if el._hidden then  hiddenEl = el  end
		el = el._parent
	until not el
	return hiddenEl
end



-- bool = element:isFirst( )
-- bool = element:isLast( )
function Cs.element:isFirst()
	return (not self._parent or self:getIndex() == 1)
end
function Cs.element:isLast()
	local parent = self._parent
	return (not parent or self:getIndex() == #parent)
end



-- bool = element:isHidden( )
-- bool = element:isVisible( )
function Cs.element:isHidden()
	return self._hidden
end
function Cs.element:isVisible()
	return (not self._hidden)
end

-- stateChanged = element:setHidden( bool )
function Cs.element:setHidden(hidden)
	if type(hidden)~="boolean" then argerror(2,1,"hidden",hidden,"boolean") end
	if self._hidden == hidden then  return false  end

	local wasDisplayed = self:isDisplayed()
	self._hidden       = hidden
	local isDisplayed  = self:isDisplayed()
	local gui          = self._gui

	if wasDisplayed or isDisplayed then
		if wasDisplayed then  validateNavigationTarget(gui)  end

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

	trigger(self, (hidden and "hide" or "show"))
	return true
end

-- stateChanged = element:setVisible( bool )
function Cs.element:setVisible(visible)
	return self:setHidden(not visible)
end

-- stateChanged = element:show( )
-- stateChanged = element:hide( )
-- stateChanged = element:toggleHidden( )
function Cs.element:show()
	return self:setHidden(false)
end
function Cs.element:hide()
	return self:setHidden(true)
end
function Cs.element:toggleHidden()
	return self:setHidden(not self._hidden)
end



-- bool = element:isHovered( [ checkMouseFocus=false ] )
function Cs.element:isHovered(checkMouseFocus)
	local gui = self._gui
	updateLayoutIfNeeded(gui) -- Updates hovered element.
	return (self == gui._hoveredElement) and not (checkMouseFocus and self ~= (gui._mouseFocus or self))
end



-- bool = element:isMouseFocus( )
-- bool = element:isKeyboardFocus( )
function Cs.element:isMouseFocus()
	return (self == self._gui._mouseFocus)
end
function Cs.element:isKeyboardFocus()
	return (self == self._gui._keyboardFocus)
end



-- bool = element:isNavigationTarget( )
function Cs.element:isNavigationTarget()
	return (self == self._gui._navigationTarget)
end



-- bool = element:isScrollbarXHovered( )
-- bool = element:isScrollbarYHovered( )
function Cs.element:isScrollbarXHovered()
	local gui = self._gui
	local x, y = gui._mouseX, gui._mouseY
	if not x then  return false  end

	local x1, y1 = self:getPositionOnScreen()
	local x2, y2 = x1+self:getChildAreaWidth(), y1+self._layoutHeight
	y1 = y2-themeGet(self._gui, "scrollbarWidth")

	return (x >= x1 and x < x2 and y >= y1 and y < y2)
end
function Cs.element:isScrollbarYHovered()
	local gui = self._gui
	local x, y = gui._mouseX, gui._mouseY
	if not x then  return false  end

	local x1, y1 = self:getPositionOnScreen()
	local x2, y2 = x1+self._layoutWidth, y1+self:getChildAreaHeight()
	x1 = x2-themeGet(self._gui, "scrollbarWidth")

	return (x >= x1 and x < x2 and y >= y1 and y < y2)
end

-- bool = element:isScrollbarXHandleHovered( )
-- bool = element:isScrollbarYHandleHovered( )
function Cs.element:isScrollbarXHandleHovered()
	local gui = self._gui
	local x, y = gui._mouseX, gui._mouseY
	if not x then  return false  end

	local handlePos, handleLen = self:getScrollHandleX()
	local x1, y1 = self:getPositionOnScreen()

	x1 = x1+handlePos
	local x2 = x1+handleLen

	local y2 = y1+self._layoutHeight
	y1 = y2-themeGet(self._gui, "scrollbarWidth")

	return (x >= x1 and x < x2 and y >= y1 and y < y2)
end
function Cs.element:isScrollbarYHandleHovered()
	local gui = self._gui
	local x, y = gui._mouseX, gui._mouseY
	if not x then  return false  end

	local handlePos, handleLen = self:getScrollHandleY()
	local x1, y1 = self:getPositionOnScreen()

	local x2 = x1+self._layoutWidth
	x1 = x2-themeGet(self._gui, "scrollbarWidth")

	y1 = y1+handlePos
	local y2 = y1+handleLen

	return (x >= x1 and x < x2 and y >= y1 and y < y2)
end



-- bool = element:isScrollingX( )
-- bool = element:isScrollingY( )
function Cs.element:isScrollingX()
	return (self._mouseScrollDirection == "x")
end
function Cs.element:isScrollingY()
	return (self._mouseScrollDirection == "y")
end



-- bool = element:isSolid( )
-- If the element has collision or not.
function Cs.element:isSolid()
	return false
end



-- bool = element:isType( elementType )
function Cs.element:isType(elType)
	return self:is(requireElementClass(elType))
end



-- element:playSound( soundKey )
function Cs.element:playSound(soundK)
	if type(soundK)~="string" then argerror(2,1,"soundK",soundK,"string") end
	checkValidSoundKey(soundK, 2)

	local soundPlayer = self._gui   and self._gui._soundPlayer
	local sound       = soundPlayer and self:getResultingSound(soundK)

	if sound ~= nil then  soundPlayer(sound)  end
end



-- element:refresh( )
-- Trigger helper event "refresh".
function Cs.element:refresh()
	trigger(self, "refresh")
end



-- handled = element:_ok( )
function Cs.element:_ok()
	return false
end



-- element:remove( )
-- Remove element from parent.
function Cs.element:remove()
	local parent = self._parent
	if parent then
		parent:removeAt(parent:indexOf(self))
	end
end



-- element:reprocessTexts( )
-- Manually re-preprocess texts. Also see gui:reprocessTexts().
function Cs.element:reprocessTexts()
	self:setTooltip(self._unprocessedTooltip)
end



-- element:scrollIntoView( )
function Cs.element.scrollIntoView(el)
	updateLayoutIfNeeded(el._gui)

	local sbW     = themeGet(el._gui, "scrollbarWidth")
	local navSize = themeGet(el._gui, "navigationSize")

	local x1, y1 = el:getPositionOnScreen(true)
	local x2, y2 = x1+el._layoutWidth, y1+el._layoutHeight

	x1, y1 = x1-navSize, y1-navSize
	x2, y2 = x2+navSize, y2+navSize

	-- @Incomplete: navSize should probably be applied in places here below,
	-- (though it only matters if there are scrollables inside scrollables).

	repeat
		local parent = el._parent
		local maxW, maxH = parent._maxWidth, parent._maxHeight

		if maxW or maxH then
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



-- element:setScissor( relativeX, relativeY, width, height [, ignoreParentScrollables=false ] )
-- element:setScissor( ) -- Only applies scissors from parent scrollables.
-- Helper function for themes' drawing functions.
-- Note that each call replaces the previous scissor.
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

			if not parent then  break  end

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

-- element:unsetScissor( )
-- Remove scissor set by element:setScissor().
-- Helper function for themes' drawing functions.
function Cs.element:unsetScissor()
	local gui = self._gui
	if gui._elementScissorIsSet then
		setScissor(gui, nil)
		gui._elementScissorIsSet = false
	end
end



-- menuElement = element:showMenu( items, [ highlightedIndex,   ] [ offsetX=0, offsetY=0, ] callback )
-- menuElement = element:showMenu( items, [ highlightedIndices, ] [ offsetX=0, offsetY=0, ] callback )
-- items       = { itemText1, ... }
-- items       = { { itemText1, itemExtraText1 }, ... }
-- callback    = function( index, itemText ) -- 'index' will be 0 if no item was chosen.
function Cs.element:showMenu(items, hlIndices, offsetX, offsetY, cb)
	if type(items)~="table" then argerror(2,1,"items",items,"table") end

	-- showMenu( items, highlightedIndex,   offsetX, offsetY, callback )
	-- showMenu( items, highlightedIndices, offsetX, offsetY, callback )
	if (type(hlIndices) == "number" or type(hlIndices) == "table") and type(offsetX) == "number" and type(offsetY) == "number" then
		-- void

	-- showMenu( items, offsetX, offsetY, callback )
	elseif (type(hlIndices) == "number" or type(hlIndices) == "table") and type(offsetX) == "number" then
		hlIndices, offsetX, offsetY, cb = nil, hlIndices, offsetX, offsetY

	-- showMenu( items, highlightedIndex,   callback )
	-- showMenu( items, highlightedIndices, callback )
	elseif type(hlIndices) == "number" or type(hlIndices) == "table" then
		offsetX, offsetY, cb = 0, 0, offsetX

	-- showMenu( items, callback )
	else
		hlIndices, offsetX, offsetY, cb = nil, 0, 0, hlIndices

	end
	if type(cb) ~= "function" then
		error("Missing callback argument.", 2)
	end

	if type(hlIndices) == "number" then
		hlIndices = {hlIndices}
	end


	local gui  = self._gui
	local root = self:getRoot()

	updateLayoutIfNeeded(gui) -- So we get the correct self size and position here below.

	-- Create menu.

	local menu = root:insert{
		type="container", style="_MENU", expandX=true, expandY=true,
		closable=true, captureGuiInput=true, confineNavigation=true,
		[1] = {type="vbar", minWidth=self._layoutWidth, maxHeight=root._height},
	}

	menu:on("closed", function(button, event)
		local _cb = cb
		cb        = nil

		menu:remove()

		if _cb then  _cb(0, "")  end
	end)

	menu:on("mousepressed", function(button, event, mx, my, mbutton, pressCount)
		menu:close()
	end)

	-- Add menu items.
	local buttons = menu[1]

	for i, text in ipairs(items) do
		local text2 = nil
		if type(text) == "table" then  text, text2 = unpack(text)  end

		local isToggled = (hlIndices ~= nil and indexOf(hlIndices, i) ~= nil)
		local button = buttons:insert{ type="button", text=text, text2=text2, align="left", toggled=isToggled }

		button:on("mousepressed", function(button, event, mx, my, mbutton, pressCount)
			if mbutton == 1 then  button:press()  end
			return true -- Prevent the menu from receiving the mousepressed event.
		end)

		button:on("press", function(button, event)
			local _cb = cb
			cb = nil

			menu:remove()

			if _cb then  _cb(i, text)  end
		end)

		button:on("navigated", function(button, event)
			buttons:setToggledChild(button._id)
		end)
	end

	local searchTerm       = ""
	local searchStartIndex = 1
	local lastInputTime    = -99

	if gui._standardKeysAreActive then
		menu:on("keypressed", function(button, event, key, scancode, isRepeat)
			if key == "up" then
				local button     = buttons:getToggledChild()
				searchStartIndex = button and (button:getIndex()-2)%#buttons+1 or 1
				lastInputTime    = -99
				gui:navigateTo(buttons[searchStartIndex])
				return true

			elseif key == "down" then
				local button     = buttons:getToggledChild()
				searchStartIndex = button and button:getIndex()%#buttons+1 or 1
				lastInputTime    = -99
				gui:navigateTo(buttons[searchStartIndex])
				return true

			elseif key == "home" or key == "pageup" then
				searchStartIndex = 1
				lastInputTime    = -99
				gui:navigateTo(buttons[searchStartIndex])
				return true

			elseif key == "end" or key == "pagedown" then
				searchStartIndex = #buttons
				lastInputTime    = -99
				gui:navigateTo(buttons[searchStartIndex])
				return true

			elseif key == "return" or key == "kpenter" then
				local button = buttons:getToggledChild()
				if button then  button:press()  end
				return true

			end
		end)
	end

	menu:on("textinput", function(button, event, text)
		-- Append to old or start a new term.
		local time = gui._time
		if time-lastInputTime > 1.00 then
			searchTerm       = text:lower()
			local button     = buttons:getToggledChild()
			searchStartIndex = button and button:getIndex() or 1
		else
			searchTerm = searchTerm..text:lower()
		end
		lastInputTime = time

		-- Pressing the same letter over and over should just cycle through all items starting with that letter.
		if #searchTerm > 1 then -- @Robustness: Use UTF-8 character length - not byte length!
			local firstChar = searchTerm:match("^[%z\1-\127\194-\244][\128-\191]*") -- utf8.charpattern
			local reps      = #searchTerm / #firstChar

			if reps == math.floor(reps) and searchTerm == firstChar:rep(reps) then
				local i        = searchStartIndex
				local foundAny = false

				while true do
					i            = i % #buttons + 1
					local button = buttons[i]

					if button._text:lower():find(firstChar, 1, true) == 1 then
						reps     = reps - 1
						foundAny = true

						if reps <= 0 then
							gui:navigateTo(button)
							return
						end

					elseif i == searchStartIndex and not foundAny then
						return
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
	if button then  gui:navigateTo(button)  end

	return menu
end



-- FINAL  element:updateLayout( )
-- Force a layout update. (Should never be needed as it's done automatically.)
-- Also see gui:updateLayout().
function Cs.element:updateLayout()
	return updateLayout(self)
end

-- INTERNAL  element:_updateLayoutSize( )
function Cs.element:_updateLayoutSize()
	-- void (subclasses should replace this method)
end

-- INTERNAL  element:_expandLayout( [ expandWidth, expandHeight ] )
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

-- INTERNAL  element:_updateLayoutPosition( )
function Cs.element:_updateLayoutPosition()
	-- void (position is always set by the parent container)
end



--==============================================================
--= Container element class ====================================
--==============================================================



Cs.container = newElementClass("GuiContainer", Cs.element, {}, {
	SCROLL_SMOOTHNESS = 0.65,
	SCROLL_SPEED_X    = 30, SCROLL_SPEED_Y = 50,

	-- Parameters.
	_confineNavigation = false,
	_expandX           = false, _expandY   = false,
	_maxWidth          = nil,   _maxHeight = nil,
	_padding           = 0,
	_solid             = false,

	_mouseScrollDirection = nil, _mouseScrollOffset = 0,
	_scrollX              = 0.0, _scrollY           = 0.0,
	_visualScrollX        = 0.0, _visualScrollY     = 0.0,
}, {
	-- void
})

function Cs.container:init(gui, elData, parent)
	Cs.container.super.init(self, gui, elData, parent)

	retrieve(self, elData, "_confineNavigation")
	retrieve(self, elData, "_expandX", "_expandY")
	retrieve(self, elData, "_maxWidth", "_maxHeight")
	retrieve(self, elData, "_padding")
	retrieve(self, elData, "_solid")

	for i, childData in ipairs(elData) do
		local C     = Cs[getTypeFromElementData(childData)] or errorf("Bad GUI type '%s'.", getTypeFromElementData(childData))
		local child = C(gui, childData, self)
		self[i]     = child
	end
end



-- INTERNAL OVERRIDE  container:_update( deltaTime )
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



-- INTERNAL REPLACE  container:_draw( )
function Cs.container:_draw()
	if self._hidden then  return  end

	local gui        = self._gui
	local x, y, w, h = xywh(self)

	local maxW,       maxH       = self._maxWidth, self._maxHeight
	local childAreaW, childAreaH = self:getChildAreaDimensions()

	local sbW    = themeGet(gui, "scrollbarWidth")
	local sbMinW = themeGet(gui, "scrollbarMinLength")

	if not self._gui.debug then
		triggerIncludingAnimations(self, "beforedraw", x, y, w, h)
	end

	drawLayoutBackground(self)
	self:_drawDebug(0, 0, 1)

	if maxW or maxH then  setScissor(gui, x, y, childAreaW, childAreaH)  end
	for _, child in ipairs(self) do
		child:_draw()
	end
	if maxW or maxH then  setScissor(gui, nil)  end

	if not self._gui.debug then
		-- Horizontal scrollbar.
		if maxW then
			local handlePos, handleLen = self:getScrollHandleX()
			themeRenderArea(self, "scrollbar", 0, h-sbW, childAreaW, sbW, "x", round(handlePos), handleLen)
		end

		-- Vertical scrollbar.
		if maxH then
			local handlePos, handleLen = self:getScrollHandleY()
			themeRenderArea(self, "scrollbar", w-sbW, 0, sbW, childAreaH, "y", round(handlePos), handleLen)
		end

		if maxW and maxH then
			themeRenderArea(self, "scrollbardeadzone", w-sbW, h-sbW, sbW, sbW)
		end

		triggerIncludingAnimations(self, "afterdraw", x, y, w, h)
	end
end



-- element|nil = container:find( id )
function Cs.container:find(id)
	for el in self:traverse() do
		if el._id == id then
			return el
		end
	end
	return nil
end

-- elements = container:findAll( id )
function Cs.container:findAll(id)
	local els = {}
	for el in self:traverse() do
		if el._id == id then
			table.insert(els, el)
		end
	end
	return els
end

-- element|nil = container:findType( elementType )
function Cs.container:findType(elType)
	local C = requireElementClass(elType)

	for el in self:traverse() do
		if el:is(C) then  return el  end
	end

	return nil
end

-- widget|nil = container:findActive( )
function Cs.container:findActive()
	for el in self:traverse() do
		if el:is(Cs.widget) and el._active then  return el  end
	end
	return nil
end

-- button|nil = container:findToggled( )
function Cs.container:findToggled()
	for el in self:traverse() do
		if el:is(Cs.button) and el._toggled then  return el  end
	end
	return nil
end

-- element|nil = container:match( selector [, includeSelf=false ] )
-- selector    = "elementType #id .tag" -- Sequence of space-separated element types, IDs and tags.
-- Match an element using a CSS-like selector.
-- Note: Element types include subtypes (e.g. 'bar' includes both 'vbar' and 'hbar').
function Cs.container:match(selector, includeSelf)
	local selPath = parseSelector(selector)
	if not selPath then  return nil  end

	local breakElement = (not includeSelf and self or self._parent)
	if includeSelf and isElementMatchingSelectorPath(self, selPath, breakElement) then
		return self
	end

	for el in self:traverse() do
		if isElementMatchingSelectorPath(el, selPath, breakElement) then
			return el
		end
	end

	return nil
end

-- elements = container:matchAll( selector [, includeSelf=false ] )
-- selector = "elementType #id .tag" -- Sequence of space-separated element types, IDs and tags.
-- Match elements using a CSS-like selector.
-- Note: Element types include subtypes (e.g. 'bar' includes both 'vbar' and 'hbar').
function Cs.container:matchAll(selector, includeSelf)
	local elements = {}
	local selPath = parseSelector(selector)

	if selPath then
		local breakElement = (not includeSelf and self or self._parent)
		if includeSelf and isElementMatchingSelectorPath(self, selPath, breakElement) then
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



-- spaceX, spaceY = container:getInnerSpace( )
-- space = container:getInnerSpaceX( )
-- space = container:getInnerSpaceY( )
function Cs.container:getInnerSpace()
	local spaceX = 2*self._padding
	local spaceY = spaceX
	local sbW    = themeGet(self._gui, "scrollbarWidth")
	if self:hasScrollbarOnRight()  then  spaceX = spaceX+sbW  end
	if self:hasScrollbarOnBottom() then  spaceY = spaceY+sbW  end
	return spaceX, spaceY
end
function Cs.container:getInnerSpaceX()
	local spaceX = 2*self._padding
	if self:hasScrollbarOnRight() then
		spaceX = spaceX+themeGet(self._gui, "scrollbarWidth")
	end
	return spaceX
end
function Cs.container:getInnerSpaceY()
	local spaceY = 2*self._padding
	if self:hasScrollbarOnBottom() then
		spaceY = spaceY+themeGet(self._gui, "scrollbarWidth")
	end
	return spaceY
end



-- width, height = container:getMaxDimensions( )
-- width  = container:getMaxWidth( )
-- height = container:getMaxHeight( )
function Cs.container:getMaxDimensions()
	return self._maxWidth, self._maxHeight
end
function Cs.container:getMaxHeight()
	return self._maxHeight
end

-- container:setMaxDimensions( width, height )
-- container:setMaxWidth( width )
-- container:setMaxHeight( height )
-- Nil removes restrictions.
function Cs.container:setMaxDimensions(w, h)
	w = (w and math.max(w, 0) or nil)
	h = (h and math.max(h, 0) or nil)
	if self._maxWidth == w and self._maxHeight == h then  return  end
	self._maxWidth  = w
	self._maxHeight = h
	scheduleLayoutUpdateIfDisplayed(self)
end
function Cs.container:setMaxWidth(w)
	w = (w and math.max(w, 0) or nil)
	if self._maxWidth == w then  return  end
	self._maxWidth = w
	scheduleLayoutUpdateIfDisplayed(self)
end
function Cs.container:setMaxHeight(h)
	h = (h and math.max(h, 0) or nil)
	if self._maxHeight == h then  return  end
	self._maxHeight = h
	scheduleLayoutUpdateIfDisplayed(self)
end



-- padding = container:getPadding( )
function Cs.container:getPadding()
	return self._padding
end

-- container:setPadding( padding )
function Cs.container:setPadding(padding)
	if self._padding == padding then
		return
	end
	self._padding = padding
	scheduleLayoutUpdateIfDisplayed(self)
end



-- x, y = container:getScroll( )
-- x = container:getScrollX( )
-- y = container:getScrollY( )
function Cs.container:getScroll()
	return self._scrollX, self._scrollY
end
function Cs.container:getScrollX()
	return self._scrollX
end
function Cs.container:getScrollY()
	return self._scrollY
end

-- scrollChanged = container:setScroll( x, y [, immediate=false ] )
function Cs.container:setScroll(scrollX, scrollY, immediate)
	if type(scrollX)~="number" then argerror(2,1,"scrollX",scrollX,"number") end
	if type(scrollY)~="number" then argerror(2,2,"scrollY",scrollY,"number") end
	updateLayoutIfNeeded(self._gui)

	-- Limit scrolling
	local limitX, limitY = self:getScrollLimit()
	scrollX = math.min(math.max(scrollX, limitX), 0)
	scrollY = math.min(math.max(scrollY, limitY), 0)
	local dx, dy = scrollX-self._scrollX, scrollY-self._scrollY
	if dx == 0 and dy == 0 then  return false  end

	self._scrollX, self._scrollY = scrollX, scrollY

	for el in self:traverse() do
		el._layoutImmediateOffsetX = el._layoutImmediateOffsetX+dx
		el._layoutImmediateOffsetY = el._layoutImmediateOffsetY+dy
	end

	if immediate then  setVisualScroll(self, scrollX, scrollY)  end

	if self:isDisplayed() then
		self:playSound("scroll") -- @Robustness: May have to add more limitations to whether "scroll" sound plays or not.
		updateHoveredElement(self._gui)
	end

	return true
end

-- scrollChanged = container:setScrollX( x [, immediate=false ] )
-- scrollChanged = container:setScrollY( y [, immediate=false ] )
function Cs.container:setScrollX(scrollX, immediate)
	return self:setScroll(scrollX, self._scrollY, immediate)
end
function Cs.container:setScrollY(scrollY, immediate)
	return self:setScroll(self._scrollX, scrollY, immediate)
end

-- scrollChanged = container:scroll( deltaX, deltaY [, immediate=false ] )
function Cs.container:scroll(dx, dy, immediate)
	return self:setScroll(self._scrollX+dx, self._scrollY+dy, immediate)
end

-- scrollChanged = container:updateScroll( [, immediate=false ] )
-- @Incomplete: Update scroll automatically when elements change size etc.
function Cs.container:updateScroll(immediate)
	return self:scroll(0, 0, immediate)
end



do
	local function getScrollHandle(self, childAreaSize, innerSize, scroll)
		local insideSize = (childAreaSize-2*self._padding)

		local handleLen = math.max(
			round(childAreaSize*insideSize/innerSize),
			themeGet(self._gui, "scrollbarMinLength"))

		local handlePos, handleMaxPos = 0, 0
		if innerSize > insideSize then
			handleMaxPos = childAreaSize-handleLen
			handlePos = -scroll*handleMaxPos/(innerSize-insideSize)
		end

		return handlePos, handleLen, handleMaxPos
	end

	-- @Incomplete: container:getScrollHandles()?

	-- position, length, maxPosition = container:getScrollHandleX( )
	-- position, length, maxPosition = container:getScrollHandleY( )
	-- Units are in pixels.
	function Cs.container:getScrollHandleX()
		updateLayoutIfNeeded(self._gui)
		return getScrollHandle(self, self:getChildAreaWidth(), self._layoutInnerWidth, self._scrollX)
	end
	function Cs.container:getScrollHandleY()
		updateLayoutIfNeeded(self._gui)
		return getScrollHandle(self, self:getChildAreaHeight(), self._layoutInnerHeight, self._scrollY)
	end
end



-- x, y = container:getScrollLimit( )
-- x = container:getScrollLimitX( )
-- y = container:getScrollLimitY( )
function Cs.container:getScrollLimit()
	local childAreaW, childAreaH = self:getChildAreaDimensions()
	return
		childAreaW-2*self._padding-self._layoutInnerWidth,
		childAreaH-2*self._padding-self._layoutInnerHeight
end
function Cs.container:getScrollLimitX()
	local childAreaW = self:getChildAreaWidth()
	return childAreaW-2*self._padding-self._layoutInnerWidth
end
function Cs.container:getScrollLimitY()
	local childAreaH = self:getChildAreaHeight()
	return childAreaH-2*self._padding-self._layoutInnerHeight
end



-- child = container:getVisibleChild( [ number=1 ] )
function Cs.container:getVisibleChild(n)
	n = (n or 1)
	for _, child in ipairs(self) do
		if not child._hidden then
			n = n - 1
			if n == 0 then  return child  end
		end
	end
	return nil
end

-- number = container:getVisibleChildNumber( child )
function Cs.container:getVisibleChildNumber(el)
	local n = 0
	for _, child in ipairs(self) do
		if not child._hidden then
			n = n + 1
			if child == el then  return n  end
		end
	end
	return nil
end

-- count = container:getVisibleChildCount( )
function Cs.container:getVisibleChildCount()
	local count = 0
	for _, child in ipairs(self) do
		if not child._hidden then  count = count + 1  end
	end
	return count
end

-- visibleChild = container:setVisibleChild( id )
-- If multiple children have the specified ID then the last one is returned.
-- @Cleanup: Rename to setVisibleChildById()?
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
	return visibleChild
end



-- x, y = container:getVisualScroll( )
-- x = container:getVisualScrollX( )
-- y = container:getVisualScrollY( )
function Cs.container:getVisualScroll()
	return self._visualScrollX, self._visualScrollY
end
function Cs.container:getVisualScrollX()
	return self._visualScrollX
end
function Cs.container:getVisualScrollY()
	return self._visualScrollY
end



-- bool = hasScrollbars( ) -- @Cleanup: Rename to hasAnyScrollbar().
-- bool = hasScrollbarOnRight( )
-- bool = hasScrollbarOnBottom( )
function Cs.container:hasScrollbars()
	return (self:hasScrollbarOnRight() or self:hasScrollbarOnBottom())
end
function Cs.container:hasScrollbarOnRight()
	return (self._maxHeight ~= nil)
end
function Cs.container:hasScrollbarOnBottom()
	return (self._maxWidth ~= nil)
end



-- index|nil = container:indexOf( element )
-- Returns nil if the element isn't a child.
Cs.container.indexOf = indexOf



-- REPLACE  bool = container:isSolid( )
function Cs.container:isSolid()
	return (self._solid or self._background ~= nil or self._maxWidth ~= nil or self._maxHeight ~= nil)
end



-- child, index = container:get( index )
-- child, index = container:get( id )
-- Note: container:get(index) is the same as container[index].
-- Returns nil if no child matches.
function Cs.container:get(iOrId)
	if type(iOrId) == "string" then
		for i, child in ipairs(self) do
			if child._id == iOrId then  return child, i  end
		end
		return nil
	else
		local child = self[iOrId]
		return child, (child and iOrId or nil)
	end
end

-- for index, child in container:children( )
function Cs.container:children()
	return ipairs(self)
end



-- width, height = container:getChildAreaDimensions( )
-- width  = container:getChildAreaWidth( )
-- height = container:getChildAreaHeight( )
function Cs.container:getChildAreaDimensions()
	updateLayoutIfNeeded(self._gui)
	local sbW = themeGet(self._gui, "scrollbarWidth")
	return
		(self._maxHeight and self._layoutWidth -sbW or self._layoutWidth),
		(self._maxWidth  and self._layoutHeight-sbW or self._layoutHeight)
end
function Cs.container:getChildAreaWidth()
	updateLayoutIfNeeded(self._gui)
	return
		self:hasScrollbarOnRight() and self._layoutWidth-themeGet(self._gui, "scrollbarWidth")
		or self._layoutWidth
end
function Cs.container:getChildAreaHeight()
	updateLayoutIfNeeded(self._gui)
	return
		self:hasScrollbarOnBottom() and self._layoutHeight-themeGet(self._gui, "scrollbarWidth")
		or self._layoutHeight
end



-- child|nil = container:getChildWithData( dataKey, dataValue )
function Cs.container:getChildWithData(k, v)
	for _, child in ipairs(self) do
		if child._data[k] == v then  return child  end
	end
	return nil
end



-- element|nil = container:getElementAt( x, y [, includeNonSolid=false ] )
function Cs.container:getElementAt(x, y, nonSolid)
	updateLayoutIfNeeded(self._gui)

	if self._maxWidth  and (x < self._layoutX or x >= self._layoutX+self._layoutWidth ) then  return nil  end
	if self._maxHeight and (y < self._layoutY or y >= self._layoutY+self._layoutHeight) then  return nil  end

	for el in self:traverseVisible(x, y) do
		if ((nonSolid or el:isSolid()) and el:isAt(x, y)) or (el._captureInput or el._captureGuiInput) then
			return el
		end
	end

	return nil
end



-- child = container:insert( elementData [, index=atEnd ] )
-- See gui:load() for the elementData format.
function Cs.container:insert(childData, i)
	if type(childData)~="table" then argerror(2,1,"childData",childData,"table") end
	if not(type(i)=="number" or i==nil) then argerror(2,2,"i",i,"number","nil") end

	local C     = Cs[getTypeFromElementData(childData)] or errorf("Bad element type '%s'.", getTypeFromElementData(childData))
	local child = C(self._gui, childData, self)
	table.insert(self, (i or #self+1), child)

	printHeres(self._gui)
	scheduleLayoutUpdateIfDisplayed(child)

	local themeInit = themeGet(self._gui, "init")
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

-- REPLACE  container:removeAt( index )
-- Note that grandchildren are also removed from their parent. (Is this good?)
function Cs.container:removeAt(i)
	if type(i)~="number" then argerror(2,1,"i",i,"number") end

	local child = self[i]
	if not child then
		printerr(2, "Child index %d is out of bounds.", i)
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

-- container:empty( )
-- Note that children are also emptied recursively. (Is this good?)
function Cs.container:empty()
	for i = #self, 1, -1 do
		self:removeAt(i)
	end
end



-- INTERNAL REPLACE  handled, grabFocus = container:_mousepressed( mouseX, mouseY, mouseButton, pressCount )
function Cs.container:_mousepressed(mx, my, mbutton, pressCount)
	if mbutton == 1 then
		local x0        , y0         = self:getPositionOnScreen()
		local childAreaW, childAreaH = self:getChildAreaDimensions()
		local sbW                    = themeGet(self._gui, "scrollbarWidth")

		-- Horizontal scrolling.
		----------------------------------------------------------------
		local x2, y2 = x0+childAreaW, y0+self._layoutHeight
		local x1, y1 = x0           , y2-sbW

		if mx >= x1 and mx < x2 and my >= y1 and my < y2 then
			local handlePos, handleLen, handleMaxPos = self:getScrollHandleX()

			self._mouseScrollDirection = "x"

			-- Drag handle.
			if mx >= x1+handlePos and mx < x1+handlePos+handleLen then
				self._mouseScrollOffset = mx-x1-handlePos

			-- Jump and drag.
			else
				self._mouseScrollOffset = handleLen/2
				self:_mousemoved(mx, my)
			end

			return true, true
		end

		-- Vertical scrolling.
		----------------------------------------------------------------
		local x2, y2 = x0+self._layoutWidth, y0+childAreaH
		local x1, y1 = x2-sbW              , y0

		if mx >= x1 and mx < x2 and my >= y1 and my < y2 then
			local handlePos, handleLen, handleMaxPos = self:getScrollHandleY()

			self._mouseScrollDirection = "y"

			-- Drag handle.
			if my >= y1+handlePos and my < y1+handlePos+handleLen then
				self._mouseScrollOffset = my-y1-handlePos

			-- Jump and drag.
			else
				self._mouseScrollOffset = handleLen/2
				self:_mousemoved(mx, my)
			end

			return true, true
		end

		----------------------------------------------------------------
	end

	return false, false
end

-- INTERNAL REPLACE  container:_mousemoved( mouseX, mouseY )
function Cs.container:_mousemoved(mx, my)

	-- Horizontal scrolling.
	if self._mouseScrollDirection == "x" then
		local handleMaxPos = select(3, self:getScrollHandleX())
		self:setScrollX(
			(mx-self:getXOnScreen()-self._mouseScrollOffset)
			*self:getScrollLimitX()/handleMaxPos, true
		)

	-- Vertical scrolling.
	elseif self._mouseScrollDirection == "y" then
		local handleMaxPos = select(3, self:getScrollHandleY())
		self:setScrollY(
			(my-self:getYOnScreen()-self._mouseScrollOffset)
			*self:getScrollLimitY()/handleMaxPos, true
		)

	end
end

-- INTERNAL REPLACE  container:_mousereleased( mouseX, mouseY, mouseButton )
function Cs.container:_mousereleased(mx, my, mbutton)
	if mbutton == 1 then
		self._mouseScrollDirection = nil
		self._mouseScrollOffset = 0
	end
end

-- INTERNAL REPLACE  handled = container:_wheelmoved( deltaX, deltaY )
function Cs.container:_wheelmoved(dx, dy)
	if (dx ~= 0 and self._maxWidth) or (dy ~= 0 and self._maxHeight) then
		if self:scroll(
			self._gui._scrollSpeedX*self.SCROLL_SPEED_X*dx,
			self._gui._scrollSpeedY*self.SCROLL_SPEED_Y*dy
		) then
			return true
		end
	end
	return false
end



-- OVERRIDE  container:remove( )
function Cs.container:remove(_removeAt_i)
	if _removeAt_i ~= nil then
		printerr(2, "WARNING: container:remove() called with an argument. Did you mean to call container:removeAt(index)?")
	end
	return Cs.container.super.remove(self)
end



-- OVERRIDE  container:reprocessTexts( )
function Cs.container:reprocessTexts()
	Cs.container.super.reprocessTexts(self)
	for _, child in ipairs(self) do
		child:reprocessTexts()
	end
end



-- container:setChildrenActive( bool )
function Cs.container:setChildrenActive(active)
	for _, child in ipairs(self) do
		if child:is(Cs.widget) then  child:setActive(active)  end
	end
end



-- container:setChildrenHidden( bool )
function Cs.container:setChildrenHidden(hidden)
	for _, child in ipairs(self) do
		child:setHidden(hidden)
	end
end



-- button|nil = container:getToggledChild( [ includeGrandchildren=false ] )
function Cs.container:getToggledChild(deep)
	if deep then
		for button in self:traverseType"button" do
			if button:isToggled() then  return button  end
		end
	else
		for _, child in ipairs(self) do
			if child:is(Cs.button) and child:isToggled() then  return child  end
		end
	end
	return nil
end

-- button|nil = container:setToggledChild( id [, includeGrandchildren=false ] )
-- If multiple children have the specified ID then the last one is returned.
function Cs.container:setToggledChild(id, deep)
	local toggledChild = nil
	if deep then
		for button in self:traverseType"button" do
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
	return toggledChild
end



-- container:sort( sortFunction )
-- aIsLessThanB = sortFunction( elementA, elementB )
function Cs.container:sort(f)
	if type(f)~="function" then argerror(2,1,"f",f,"function") end
	table.sort(self, f)
	scheduleLayoutUpdateIfDisplayed(self)
end



-- for element in container:traverse( )
function Cs.container:traverse()
	local stack = {self, 0}
	local len   = 2

	return function()
		local child

		repeat
			local i    = stack[len] + 1
			stack[len] = i
			child      = stack[len-1][i]

			if not child then
				len = len - 2 -- Don't bother removing values from the stack.
				if len == 0 then  return  end
			end
		until child

		if child:is(Cs.container) then
			len          = len + 2
			stack[len-1] = child
			stack[len  ] = 0
		end

		return child
	end
end

-- for element in container:traverseType( elementType )
function Cs.container:traverseType(elType)
	local C     = requireElementClass(elType)
	local stack = {self, 0}
	local len   = 2

	return function()
		local child

		repeat
			repeat
				local i    = stack[len] + 1
				stack[len] = i
				child      = stack[len-1][i]

				if not child then
					len = len - 2 -- Don't bother removing values from the stack.
					if len == 0 then  return  end
				end
			until child

			if child:is(Cs.container) then
				len          = len + 2
				stack[len-1] = child
				stack[len  ] = 0
			end
		until child:is(C)

		return child
	end
end

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
				local isContainer     = child:is(Cs.container)
				local includeSelf     = true
				local includeChildren = isContainer

				if isContainer then
					local x1, y1 = child:getPositionOnScreen()
					local x2, y2 = x1+child._layoutWidth, y1+child._layoutHeight

					local maxW = child._maxWidth
					local maxH = child._maxHeight

					if maxW and (x < x1 or x >= x2-(maxH and sbW or 0)) then
						includeChildren = false
						includeSelf     = (x < x2)
					elseif maxH and (y < y1 or y >= y2-(maxW and sbW or 0)) then
						includeChildren = false
						includeSelf     = (y < y2)
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

	-- for element in container:traverseVisible( )
	-- for element in container:traverseVisible( x, y )
	function Cs.container:traverseVisible(x, y)
		if x then
			return newIteratorCoroutine(traverseVisibleChildrenUnderCoords, self, x, y, themeGet(self._gui, "scrollbarWidth"))
		else
			return newIteratorCoroutine(traverseVisibleChildren, self)
		end
	end
end



-- INTERNAL REPLACE  container:_updateLayoutSize( )
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

-- INTERNAL REPLACE  container:_expandLayout( )
function Cs.container:_expandLayout(expandW, expandH)
	expandContainer(self, expandW, expandH)

	for _, child in ipairs(self) do
		if not child._hidden then  child:_expandLayout(nil, nil)  end
	end
end

-- INTERNAL REPLACE  container:_updateLayoutPosition( )
function Cs.container:_updateLayoutPosition()
	for _, child in ipairs(self) do
		if not child._hidden then
			updateFloatingElementPosition(child) -- All children counts as floating in plain containers.
		end
	end
end



--==============================================================
--= Bar element class (virtual) ================================
--==============================================================



Cs.bar = newElementClass("GuiBar", Cs.container, {}, {
	-- Parameters.
	_expandChildren = true,
	_homogeneous    = false,
}, {
	-- void
})

function Cs.bar:init(gui, elData, parent)
	Cs.bar.super.init(self, gui, elData, parent)

	retrieve(self, elData, "_expandChildren")
	retrieve(self, elData, "_homogeneous")
end



--==============================================================
--= Hbar and Vbar element classes ==============================
--==============================================================



Cs.hbar = newElementClass("GuiHorizontalBar", Cs.bar, {}, {
	-- void
}, {
	-- void
})
Cs.vbar = newElementClass("GuiVerticalBar", Cs.bar, {}, {
	-- void
}, {
	-- void
})

-- function Cs.hbar:init(gui, elData, parent)
-- 	Cs.hbar.super.init(self, gui, elData, parent)
-- end
-- function Cs.vbar:init(gui, elData, parent)
-- 	Cs.vbar.super.init(self, gui, elData, parent)
-- end



-- INTERNAL REPLACE  hbar:_updateLayoutSize( )
-- INTERNAL REPLACE  vbar:_updateLayoutSize( )
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

-- INTERNAL REPLACE  hbar:_expandLayout( [ expandWidth, expandHeight ] )
-- INTERNAL REPLACE  vbar:_expandLayout( [ expandWidth, expandHeight ] )
function Cs.hbar:_expandLayout(expandW, expandH)
	-- Expand self
	expandContainer(self, expandW, expandH)

	-- Calculate amount of space for children to expand into (total or extra, whether homogeneous or not).
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

	-- Expand children.
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

	if not (expandablesX == 0) then  error((tostring(expandablesX)))  end
end
function Cs.vbar:_expandLayout(expandW, expandH)
	-- Expand self
	expandContainer(self, expandW, expandH)

	-- Calculate amount of space for children to expand into (total or extra, whether homogeneous or not).
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

	-- Expand children.
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

	if not (expandablesY == 0) then  error((tostring(expandablesY)))  end
end

-- INTERNAL REPLACE  hbar:_updateLayoutPosition( )
-- INTERNAL REPLACE  vbar:_updateLayoutPosition( )
function Cs.hbar:_updateLayoutPosition()
	local x      = self._layoutX+self._padding
	local y      = self._layoutY+self._padding
	local margin = 0
	local first  = true

	for _, child in ipairs(self) do
		if child._hidden then
			-- void

		elseif child._floating then
			updateFloatingElementPosition(child)

		else
			if not first then
				margin = math.max(margin, child._spacingLeft or child._spacingHorizontal or child._spacing)
				x      = x + margin
			end

			child._layoutX = x
			child._layoutY = y
			child:_updateLayoutPosition()

			x      = x + child._layoutWidth
			margin = child._spacingRight or child._spacingHorizontal or child._spacing
			first  = false
		end
	end
end
function Cs.vbar:_updateLayoutPosition()
	local x      = self._layoutX+self._padding
	local y      = self._layoutY+self._padding
	local margin = 0
	local first  = true

	for _, child in ipairs(self) do
		if child._hidden then
			-- void

		elseif child._floating then
			updateFloatingElementPosition(child)

		else
			if not first then
				margin = math.max(margin, child._spacingTop or child._spacingVertical or child._spacing)
				y      = y + margin
			end

			child._layoutX = x
			child._layoutY = y
			child:_updateLayoutPosition()

			y      = y + child._layoutHeight
			margin = child._spacingBottom or child._spacingVertical or child._spacing
			first  = false
		end
	end
end



--==============================================================
--= Root element class =========================================
--==============================================================



Cs.root = newElementClass("GuiRoot", Cs.container, {}, {
	--[[REPLACE]] _width = 0, _height = 0, -- The root always has a fixed size.
}, {
	-- void
})

-- function Cs.root:init(gui, elData, parent)
-- 	Cs.root.super.init(self, gui, elData, parent)
-- end



-- INTERNAL REPLACE  root:_draw( )
function Cs.root:_draw()
	if self._hidden then  return  end

	local x, y, w, h = xywh(self)

	if not self._gui.debug then
		triggerIncludingAnimations(self, "beforedraw", x, y, w, h)
	end

	drawLayoutBackground(self)
	self:_drawDebug(0, 0, 1, 0)

	for _, child in ipairs(self) do
		child:_draw()
	end

	if not self._gui.debug then
		triggerIncludingAnimations(self, "afterdraw", x, y, w, h)
	end
end



-- REPLACE  root:setDimensions( width, height )
function Cs.root:setDimensions(w, h)
	if type(w)~="number" then argerror(2,1,"w",w,"number") end
	if type(h)~="number" then argerror(2,2,"h",h,"number") end
	if self._width == w and self._height == h then  return  end

	self._width, self._height = w, h
	scheduleLayoutUpdateIfDisplayed(self)
end



-- INTERNAL REPLACE  root:_updateLayoutSize( )
function Cs.root:_updateLayoutSize()
	self._layoutWidth       = self._width
	self._layoutHeight      = self._height
	self._layoutInnerWidth  = self._layoutWidth  - 2*self._padding
	self._layoutInnerHeight = self._layoutHeight - 2*self._padding
	updateContainerChildLayoutSizes(self)
end

-- INTERNAL REPLACE  root:_expandLayout( [ expandWidth, expandHeight ] )
-- expandWidth and expandHeight are ignored as the root always has a fixed non-expanding size.
function Cs.root:_expandLayout(expandW, expandH)
	for _, child in ipairs(self) do
		if not child._hidden then  child:_expandLayout(nil, nil)  end
	end
end



--==============================================================
--= Leaf element class (virtual) ===============================
--==============================================================



Cs.leaf = newElementClass("GuiLeaf", Cs.element, {}, {
	-- Parameters.
	_align     = "center", -- "left" | "right" | "center"
	_bold      = false, _small = false, _large = false,
	_mnemonics = false,
	_text      = "",
	_textColor = nil,

	_mnemonicPosition = nil,
	_textWidth        = 0, _textHeight = 0,
	_unprocessedText  = "",
}, {
	-- void
})

function Cs.leaf:init(gui, elData, parent)
	Cs.leaf.super.init(self, gui, elData, parent)

	retrieve(self, elData, "_align")
	retrieve(self, elData, "_bold","_small","_large")
	retrieve(self, elData, "_mnemonics")
	-- retrieve(self, elData, "_text")
	retrieve(self, elData, "_textColor")

	if elData.text ~= nil then
		self:setText(elData.text)
	end
end



-- align = leaf:getAlign( )
function Cs.leaf:getAlign()
	return self._align
end

-- leaf:setAlign( align )
function Cs.leaf:setAlign(align)
	self._align = align -- Note: We shouldn't have to update the layout after changing the alignment.
end



-- font = leaf:getFont( )
function Cs.leaf:getFont()
	local k = (self._large and "_fontLarge")
	       or (self._small and "_fontSmall")
	       or (self._bold  and "_fontBold" )
	       or                  "_font"

	return self._gui[k] or getDefaultFont()
end

-- Tell LÖVE to use the font.
-- fontBeingUsed = leaf:useFont( )
function Cs.leaf:useFont()
	local font = self:getFont()
	love.graphics.setFont(font)
	return font
end



-- position|nil = leaf:getMnemonicPosition( )
-- Returns nil if there's no mnemonic.
function Cs.leaf:getMnemonicPosition()
	return self._mnemonicPosition
end



-- text = leaf:getText( )
function Cs.leaf:getText()
	return self._text
end

-- text = leaf:getUnprocessedText( )
-- Also see gui:setTextPreprocessor().
function Cs.leaf:getUnprocessedText()
	return self._unprocessedText
end

-- leaf:setText( text )
function Cs.leaf:setText(unprocessedText)
	unprocessedText = tostring(unprocessedText == nil and "" or unprocessedText)

	local text = preprocessText(self._gui, unprocessedText, self, self._mnemonics)
	if self._text == text then  return  end

	-- Check text for mnemonics (using "&").
	self._mnemonicPosition = nil

	if self._mnemonics then
		local matchCount    = 0
		local mnemonicCount = 0

		local cleanText = text:gsub("()&(.)", function(pos, c)
			if c ~= "&" then
				if mnemonicCount == 0 then
					self._mnemonicPosition = pos - matchCount
				end
				mnemonicCount = mnemonicCount + 1
			end
			matchCount = matchCount + 1
			return c
		end)

		if mnemonicCount > 1 then
			printerr(2, "Multiple mnemonics in '%s'.", text)
		end

		text = cleanText
	end

	self._text            = text
	self._unprocessedText = unprocessedText

	local oldW      = self._textWidth
	self._textWidth = self:getFont():getWidth(text)

	if self._textWidth ~= oldW then
		scheduleLayoutUpdateIfDisplayed(self)
	end
end

-- leaf:drawText( x, y )
function Cs.leaf:drawText(x, y)
	love.graphics.print(self._text, x, y)
end

-- leaf:drawAlignedText( areaX, areaY, areaWidth [, align=self:getAlign() ] )
function Cs.leaf:drawAlignedText(x, y, w, align)
	align = align or self._align
	if align == "right" then
		x = x + w - self._textWidth
	elseif align == "center" then
		x = x + math.floor((w-self._textWidth)/2)
	end
	self:drawText(x, y)
end



-- colorTable|nil = leaf:getTextColor( )
function Cs.leaf:getTextColor()
	return self._textColor
end

-- leaf:setTextColor( colorTable|nil )
function Cs.leaf:setTextColor(color)
	self._textColor = color
end

-- bool = leaf:hasTextColor( )
function Cs.leaf:hasTextColor()
	return (self._textColor ~= nil)
end

-- Tell LÖVE to use the text color.
-- hasTextColor = leaf:useTextColor( [ alphaMultiplier=1 ] )
function Cs.leaf:useTextColor(opacity)
	local color = self._textColor
	useColor((color or COLOR_WHITE), opacity)
	return (color ~= nil)
end



-- bool = leaf:isBold( )
-- bool = leaf:isLarge( )
-- bool = leaf:isSmall( )
function Cs.leaf:isBold(text)
	return self._bold
end
function Cs.leaf:isLarge(text)
	return self._large
end
function Cs.leaf:isSmall(text)
	return self._small
end

-- leaf:setBold ( bool )
-- leaf:setLarge( bool )
-- leaf:setSmall( bool )
function Cs.leaf:setBold(bold)
	if self._bold == bold then  return  end
	self._bold = bold
	scheduleLayoutUpdateIfDisplayed(self)
end
function Cs.leaf:setLarge(large)
	if self._large == large then  return  end
	self._large = large
	scheduleLayoutUpdateIfDisplayed(self)
end
function Cs.leaf:setSmall(small)
	if self._small == small then
		return
	end
	self._small = small
	scheduleLayoutUpdateIfDisplayed(self)
end



-- REPLACE  bool = leaf:isSolid( )
function Cs.leaf:isSolid()
	return true
end



-- OVERRIDE  leaf:reprocessTexts( )
function Cs.leaf:reprocessTexts()
	Cs.leaf.super.reprocessTexts(self)
	self:setText(self._unprocessedText)
end



--==============================================================
--= Canvas element class =======================================
--==============================================================



Cs.canvas = newElementClass("GuiCanvas", Cs.leaf, {}, {
	-- Parameters.
	_canvasBackgroundColor = nil,
}, {
	"draw", -- function( self, event, drawAreaWidth, drawAreaHeight )
})

function Cs.canvas:init(gui, elData, parent)
	Cs.canvas.super.init(self, gui, elData, parent)

	retrieve(self, elData, "_canvasBackgroundColor")
end



-- INTERNAL REPLACE  canvas:_draw( )
function Cs.canvas:_draw()
	if self._hidden then  return  end

	local gui = self._gui
	if gui.debug then  return self:_drawDebug(1, 0, 0)  end

	local x, y, w, h = xywh(self)

	triggerIncludingAnimations(self, "beforedraw", x, y, w, h)
	drawLayoutBackground(self)

	-- Draw canvas.
	-- We don't call themeRender() for canvases as they should only draw things through the "draw" event.
	local cw = self._width  or w
	local ch = self._height or h

	if cw > 0 and ch > 0 then
		love.graphics.push("all")

		local cx, cy  = x+math.floor((w-cw)/2), y+math.floor((h-ch)/2)
		local bgColor = self._canvasBackgroundColor
		if bgColor then
			setColor(bgColor)
			love.graphics.rectangle("fill", cx, cy, cw, ch)
		end

		setScissor(gui, cx, cy, cw, ch)
		love.graphics.translate(cx, cy)
		setColor(1, 1, 1)

		triggerIncludingAnimations(self, "draw", cw, ch)
		self:unsetScissor()

		setScissor(gui, nil)
		love.graphics.pop()
	end

	triggerIncludingAnimations(self, "afterdraw", x, y, w, h)
end



-- colorTable|nil = canvas:getCanvasBackgroundColor( )
function Cs.canvas:getCanvasBackgroundColor()
	return self._canvasBackgroundColor
end

-- canvas:setCanvasBackgroundColor( colorTable|nil )
function Cs.canvas:setCanvasBackgroundColor(color)
	self._canvasBackgroundColor = color
end



-- INTERNAL REPLACE  handled, grabFocus = canvas:_mousepressed( mouseX, mouseY, mouseButton, pressCount )
function Cs.canvas:_mousepressed(mx, my, mbutton, pressCount)
	return true, true
end



-- INTERNAL REPLACE  canvas:_updateLayoutSize( )
function Cs.canvas:_updateLayoutSize()
	-- We don't call themeGetSize() for canvases as they always have their own private "theme".
	local w, h = (self._width or 0), (self._height or 0)
	self._layoutWidth,      self._layoutHeight      = w, h
	self._layoutInnerWidth, self._layoutInnerHeight = w, h
end



--==============================================================
--= Image element class ========================================
--==============================================================



Cs.image = newElementClass("GuiImage", Cs.leaf, {"imageMixin"}, {
	-- void
}, {
	-- void
})

function Cs.image:init(gui, elData, parent)
	Cs.image.super.init(self, gui, elData, parent)
	initImageMixin(self, elData)
end



-- INTERNAL OVERRIDE  image:_update( deltaTime )
function Cs.image:_update(dt)
	Cs.image.super._update(self, dt)
	local sprite = self._sprite
	if sprite then  updateSprite(sprite, dt)  end
end



-- INTERNAL REPLACE  image:_draw( )
function Cs.image:_draw()
	if self._hidden then  return  end
	if self._gui.debug then  return self:_drawDebug(1, 0, 0)  end

	local x, y, w, h = xywh(self)

	triggerIncludingAnimations(self, "beforedraw", x, y, w, h)

	drawLayoutBackground(self)

	local image, quad, iw, ih = nil, nil, 0, 0
	if self._sprite then
		image, quad, iw, ih = getCurrentViewOfSprite(self._sprite)
	end
	themeRender(self, "image", iw*self._imageScaleX, ih*self._imageScaleY)

	triggerIncludingAnimations(self, "afterdraw", x, y, w, h)
end



-- INTERNAL REPLACE  image:_updateLayoutSize( )
function Cs.image:_updateLayoutSize()
	local w, h = nil, nil
	if not (self._width and self._height) then
		local iw, ih = self:getImageDimensions()
		w, h = themeGetSize(self, "image", iw*self._imageScaleX, ih*self._imageScaleX)
	end

	w = (self._width  or math.max(w, self._minWidth))
	h = (self._height or math.max(h, self._minHeight))

	self._layoutWidth     , self._layoutHeight      = w, h
	self._layoutInnerWidth, self._layoutInnerHeight = w, h
end



--==============================================================
--= Text element class =========================================
--==============================================================



Cs.text = newElementClass("GuiText", Cs.leaf, {}, {
	-- Parameters.
	_wrapText = false, _textWrapLimit = nil,
}, {
	-- void
})

function Cs.text:init(gui, elData, parent)
	Cs.text.super.init(self, gui, elData, parent)

	retrieve(self, elData, "_wrapText","_textWrapLimit")
end



-- INTERNAL REPLACE  text:_draw( )
function Cs.text:_draw()
	if self._hidden    then  return  end
	if self._gui.debug then  return self:_drawDebug(1, 0, 0)  end

	local x, y, w, h = xywh(self)

	triggerIncludingAnimations(self, "beforedraw", x, y, w, h)

	drawLayoutBackground(self)

	local textIndent = themeGet(self._gui, "textIndentation")
	themeRender(self, "text", textIndent, self._textWidth, self._textHeight)

	triggerIncludingAnimations(self, "afterdraw", x, y, w, h)
end



-- INTERNAL REPLACE  text:_updateLayoutSize( )
function Cs.text:_updateLayoutSize()
	local wrapLimit = self._textWrapLimit

	if not wrapLimit and self._wrapText then
		local innerSpaceSum = 0

		for _, parent in self:parents() do
			innerSpaceSum = innerSpaceSum + parent:getInnerSpaceX()

			-- At most this will be the root, as the root always has a defined size.
			if parent._width then
				wrapLimit = parent._width - innerSpaceSum - 2*themeGet(self._gui, "textIndentation")

				if wrapLimit <= 0 then
					-- Maybe the root's size is 0x0?
					wrapLimit = nil
				end

				break
			end
		end
	end

	local textW    , textH            = getTextDimensions(self:getFont(), self._text, wrapLimit)
	self._textWidth, self._textHeight = textW, textH

	local w, h = nil
	if not (self._width and self._height) then
		local textIndent = themeGet(self._gui, "textIndentation")
		w, h             = themeGetSize(self, "text", textIndent, textW, textH)
	end

	w = (self._width  or math.max(w, self._minWidth))
	h = (self._height or math.max(h, self._minHeight))

	self._layoutWidth     , self._layoutHeight      = w, h
	self._layoutInnerWidth, self._layoutInnerHeight = w, h
end



-- REPLACE  text:drawText( x, y )
function Cs.text:drawText(x, y)
	if self._wrapText or self._textWrapLimit then
		love.graphics.printf(self._text, x, y, self._textWidth, self._align)
	else
		love.graphics.print(self._text, x, y)
	end
end



--==============================================================
--= Widget element class =======================================
--==============================================================



Cs.widget = newElementClass("GuiWidget", Cs.leaf, {}, {
	-- Parameters.
	_active   = true,
	_priority = 0, -- Navigation priority.
}, {
	"navigate" , -- suppress = function( self, event )
	"navupdate", --            function( self, event, dt )
})

function Cs.widget:init(gui, elData, parent)
	Cs.widget.super.init(self, gui, elData, parent)

	retrieve(self, elData, "_active")
	retrieve(self, elData, "_priority")
end



-- priority = widget:getPriority( )
function Cs.widget:getPriority()
	return self._priority
end

-- widget:setPriority( priority )
function Cs.widget:setPriority(priority)
	self._priority = priority
end



-- bool = widget:isActive( )
function Cs.widget:isActive()
	return self._active
end

-- stateChanged = widget:setActive( bool )
function Cs.widget:setActive(active)
	if self._active == active then  return false  end
	self._active = active
	return true
end



--==============================================================
--= Button element class =======================================
--==============================================================



Cs.button = newElementClass("GuiButton", Cs.widget, {"imageMixin"}, {
	-- Parameters.
	_arrow         = nil, -- @Cleanup: We're not using this internally. Should it be removed in favor of element.data?
	_canToggle     = false,
	_close         = false,
	_imagePadding  = 0,
	_pressable     = true,
	_text2         = "",
	_toggled       = false,
	_toggledSprite = nil, _untoggledSprite = nil,

	_isPressed        = false,
	_textWidth1       = 0, _textWidth2 = 0,
	_unprocessedText2 = "",
}, {
	"press" , -- function( self, event )
	"toggle", -- function( self, event )
})

function Cs.button:init(gui, elData, parent)
	Cs.button.super.init(self, gui, elData, parent)
	initImageMixin(self, elData)

	retrieve(self, elData, "_arrow")
	retrieve(self, elData, "_canToggle")
	retrieve(self, elData, "_close")
	retrieve(self, elData, "_imagePadding")
	retrieve(self, elData, "_pressable")
	-- retrieve(self, elData, "_text2")
	retrieve(self, elData, "_toggled")
	retrieve(self, elData, "_toggledSprite","_untoggledSprite")

	if elData.sprite then
		-- void
	elseif self._toggledSprite and self._toggled then
		self:setSprite(self._toggledSprite)
	elseif self._untoggledSprite and not self._toggled then
		self:setSprite(self._untoggledSprite)
	end

	if elData.text2 ~= nil then
		self:setText2(elData.text2)
	end
end



-- INTERNAL OVERRIDE  button:_update( deltaTime )
function Cs.button:_update(dt)
	Cs.button.super._update(self, dt)
	local sprite = self._sprite
	if sprite then  updateSprite(sprite, dt)  end
end



-- INTERNAL REPLACE  button:_draw( )
function Cs.button:_draw()
	if self._hidden then  return  end
	if self._gui.debug then  return self:_drawDebug(0, 180, 0)  end

	local x, y, w, h = xywh(self)

	triggerIncludingAnimations(self, "beforedraw", x, y, w, h)
	drawLayoutBackground(self)

	local image, quad, iw, ih = nil, nil, 0, 0
	if self._sprite then
		image, quad, iw, ih = getCurrentViewOfSprite(self._sprite)
	end
	themeRender(
		self, "button", self._textWidth1, self._textWidth2, self._textHeight,
		iw*self._imageScaleX+2*self._imagePadding, ih*self._imageScaleY+2*self._imagePadding
	)

	triggerIncludingAnimations(self, "afterdraw", x, y, w, h)
end



-- arrow|nil = button:getArrow( )
function Cs.button:getArrow()
	return self._arrow
end



-- text2 = button:getText2( )
function Cs.button:getText2()
	return self._text2
end

-- text = button:getUnprocessedText2( )
function Cs.button:getUnprocessedText2()
	return self._unprocessedText2
end

-- OVERRIDE  button:setText( text )
function Cs.button:setText(text)
	local oldText = self._text
	local oldW = self._textWidth

	Cs.button.super.setText(self, text)
	text = nil -- Don't use this anymore!

	if self._text == oldText then
		return
	end

	self._textWidth1 = self._textWidth
	self._textWidth = self._textWidth1+self._textWidth2

	if self._textWidth ~= oldW then
		scheduleLayoutUpdateIfDisplayed(self)
	end
end

-- button:setText2( text )
function Cs.button:setText2(unprocessedText)
	unprocessedText = tostring(unprocessedText == nil and "" or unprocessedText)

	local text = preprocessText(self._gui, unprocessedText, self, false)
	if self._text2 == text then  return  end

	self._text2            = text
	self._unprocessedText2 = unprocessedText

	local oldW       = self._textWidth
	self._textWidth2 = self:getFont():getWidth(text)
	self._textWidth  = self._textWidth1+self._textWidth2

	if self._textWidth ~= oldW then
		scheduleLayoutUpdateIfDisplayed(self)
	end
end

-- button:drawText2( x, y )
function Cs.button:drawText2(x, y)
	love.graphics.print(self._text2, x, y)
end

-- button:drawAlignedText2( areaX, areaY, areaWidth [, align=self:getAlign() ] )
function Cs.button:drawAlignedText2(x, y, w, align)
	align = align or self._align
	if align == "right" then
		x = x + w - self._textWidth2
	elseif align == "center" then
		x = x + math.floor((w-self._textWidth2)/2)
	end
	self:drawText(x, y)
end



-- bool = button:isPressable( )
function Cs.button:isPressable()
	return self._pressable
end

-- button:setPressable( bool )
function Cs.button:setPressable(pressable)
	self._pressable = pressable
end



-- bool = button:isToggled( )
function Cs.button:isToggled()
	return self._toggled
end

-- button:setToggled( bool )
function Cs.button:setToggled(toggled)
	if self._toggled == toggled then  return  end

	self._toggled = toggled

	if toggled and self._toggledSprite then
		self:setSprite(self._toggledSprite)
	elseif not toggled and self._untoggledSprite then
		self:setSprite(self._untoggledSprite)
	end

	trigger(self, "toggle")
end



-- INTERNAL REPLACE  handled, grabFocus = button:_mousepressed( mouseX, mouseY, mouseButton, pressCount )
function Cs.button:_mousepressed(mx, my, mbutton, pressCount)
	if mbutton == 1 then
		if not self._active then
			return true, false
		end
		self._isPressed = true
		return true, true
	end
	return false, false
end

-- -- INTERNAL REPLACE  button:_mousemoved( mouseX, mouseY )
-- function Cs.button:_mousemoved(mx, my)
-- end

-- INTERNAL REPLACE  button:_mousereleased( mouseX, mouseY, mouseButton )
function Cs.button:_mousereleased(mx, my, mbutton)
	if mbutton == 1 then
		self._isPressed = false
		if mx and self:isHovered() then  self:press()  end
	end
end



-- INTERNAL REPLACE  handled = button:_ok( )
function Cs.button:_ok()
	self:press()
	return true
end



-- success = button:press( [ ignoreActiveState=false ] )
function Cs.button:press(ignoreActiveState)
	if not ignoreActiveState and not (self._active and self._pressable) then
		return false
	end

	-- Press/toggle the button
	local preparedSound = prepareSound(self, "press")

	if self._canToggle then
		local toggled = not self._toggled
		self._toggled = toggled -- We need to toggle before the press event in case the callback uses the value.

		if toggled and self._toggledSprite then
			self:setSprite(self._toggledSprite)
		elseif not toggled and self._untoggledSprite then
			self:setSprite(self._untoggledSprite)
		end
	end

	self._gui._ignoreKeyboardInputThisFrame = true

	trigger(self, "press")
	if self._canToggle then  trigger(self, "toggle")  end

	self:triggerBubbling("pressed", self)

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

-- bool = button:isPressed( )
function Cs.button:isPressed()
	return self._isPressed
end



-- OVERRIDE  button:reprocessTexts( )
function Cs.button:reprocessTexts()
	Cs.button.super.reprocessTexts(self)
	self:setText2(self._unprocessedText2)
end



-- INTERNAL REPLACE  button:_updateLayoutSize( )
function Cs.button:_updateLayoutSize()
	local font       = self:getFont()
	self._textWidth1 = font:getWidth(self._text)
	self._textWidth2 = font:getWidth(self._text2)
	self._textWidth  = self._textWidth1 + self._textWidth2 -- This value is pretty useless...
	self._textHeight = font:getHeight()

	local w, h = nil, nil
	if not (self._width and self._height) then
		local iw, ih = self:getImageDimensions()
		w, h = themeGetSize(
			self, "button", self._textWidth1, self._textWidth2, self._textHeight,
			iw*self._imageScaleX+2*self._imagePadding, ih*self._imageScaleX+2*self._imagePadding)
	end

	w = (self._width  or math.max(w, self._minWidth))
	h = (self._height or math.max(h, self._minHeight))

	self._layoutWidth     , self._layoutHeight      = w, h
	self._layoutInnerWidth, self._layoutInnerHeight = w, h
end



--==============================================================
--= Input element class ========================================
--==============================================================



Cs.input = newElementClass("GuiInput", Cs.widget, {}, {
	-- Parameters.
	--[[OVERRIDE]] _mouseCursor = "ibeam",
	--[[REPLACE ]] _minWidth    = 10,
	_mask        = "",
	_placeholder = "",
	_spin        = 0,
	_spinMin     = -1/0, _spinMax = 1/0,

	_field          = nil,
	_savedKeyRepeat = false,
	_savedValue     = "",
}, {
	"change"     , -- function( self, event )
	"submit"     , -- function( self, event )
	"valuechange", -- function( self, event )
})

function Cs.input:init(gui, elData, parent)
	Cs.input.super.init(self, gui, elData, parent)

	-- retrieve(self, elData, "_password") -- This is saved in the field instead.
	retrieve(self, elData, "_mask")
	retrieve(self, elData, "_placeholder")
	retrieve(self, elData, "_spin")
	retrieve(self, elData, "_spinMin","_spinMax")

	self._field = InputField((elData.value and tostring(elData.value) or ""), (elData.password and "password" or "normal"))
	self._field:setFont(self:getFont())
	self._field:setFontFilteringActive(true)
end



-- INTERNAL OVERRIDE  input:_update( deltaTime )
function Cs.input:_update(dt)
	Cs.input.super._update(self, dt)
	self._field:update(dt)
end



-- INTERNAL REPLACE  input:_draw( )
function Cs.input:_draw()
	if self._hidden    then  return  end
	if self._gui.debug then  return self:_drawDebug(0, 180, 0)  end

	local inputIndent     = themeGet(self._gui, "inputIndentation")
	local x, y, w, h      = xywh(self)
	local curOffset       = self:getCursorOffset()
	local selOffset, selW = self:getSelectionOffset()

	triggerIncludingAnimations(self, "beforedraw", x, y, w, h)

	drawLayoutBackground(self)
	themeRender(self, "input", inputIndent, self:getFont():getHeight(), curOffset, selOffset, selW)

	triggerIncludingAnimations(self, "afterdraw", x, y, w, h)
end



-- input:focus( )
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

	self:playSound("focus")
	self:triggerBubbling("focused", self)
end

-- success = input:blur( )
function Cs.input:blur()
	local gui = self._gui
	if gui._keyboardFocus ~= self then
		return false
	end

	setKeyboardFocus(gui, nil)
	setMouseFocus(gui, nil)

	gui._lockNavigation = false

	love.keyboard.setKeyRepeat(self._savedKeyRepeat)

	self._field:setScroll(0, 0)

	local v = self:getValue()
	if v ~= self._savedValue then
		trigger(self, "change", v)
	end

	self:triggerBubbling("blurred", self)
	return true
end

-- bool = input:isFocused( )
function Cs.input:isFocused()
	return self:isKeyboardFocus()
end



-- inputField = input:getField( )
-- Inputs use the InputField library for many things. This method gives direct access to
-- the internal InputField instance. (See https://github.com/ReFreezed/InputField)
function Cs.input:getField()
	return self._field
end



-- value = input:getValue( )
function Cs.input:getValue()
	return self._field:getText()
end

-- input:setValue( value )
function Cs.input:setValue(value)
	return self._field:setText(value)
end

-- value = input:getVisibleValue( )
-- Returns *** for passwords.
function Cs.input:getVisibleValue()
	return self._field:getVisibleText()
end

-- input:drawValue( x, y )
function Cs.input:drawValue(x0, y0)
	for _, line, x, y in self._field:eachVisibleLine() do -- Ought to be a single line.
		love.graphics.print(line, x0+x, y0+y)
	end
end

-- input:drawPlaceholder( x, y )
function Cs.input:drawPlaceholder(x, y)
	love.graphics.print(self._placeholder, x, y)
end



-- bool = input:isPasswordActive( )
function Cs.input:isPasswordActive()
	return self._field:isPassword()
end

-- input:setPasswordActive( bool )
function Cs.input:setPasswordActive(active)
	self._field:setType(active and "password" or "normal")
end



-- INTERNAL REPLACE  handled, grabFocus = input:_keypressed( key, scancode, isRepeat )
function Cs.input:_keypressed(key, scancode, isRepeat)
	if not self:isKeyboardFocus() then  return false, false  end

	if key == "escape" then
		if not isRepeat then
			if self:getValue() ~= self._savedValue then
				self._field:setText(self._savedValue)
				trigger(self, "valuechange")
			end
			self:blur()
			self:playSound("inputrevert")
		end

	elseif key == "return" or key == "kpenter" then
		if not isRepeat then
			self:blur()
			self:playSound("inputsubmit")
			trigger(self, "submit")
		end

	elseif self._spin ~= 0 and (key == "up" or key == "down") then
		local oldValue = self:getValue()
		local n = tonumber(oldValue) or 0

		if key == "up" then
			n = n+self._spin
		elseif key == "down" then
			n = n-self._spin
		end
		n = math.min(math.max(n, self._spinMin), self._spinMax)

		local newValue = tostring(n)
		if newValue ~= oldValue then
			self:setValue(newValue)
			self._field:selectAll()
			trigger(self, "valuechange")
		end

	else
		local oldValue = self:getValue()
		local handled  = self._field:keypressed(key, isRepeat)

		local mask     = self._mask
		local newValue = self:getValue()
		if handled and mask ~= "" and newValue ~= oldValue and not newValue:find(mask) then
			self:setValue(oldValue)
		elseif handled and newValue ~= oldValue then
			trigger(self, "valuechange")
		end
	end

	return true, false
end

-- -- INTERNAL REPLACE  input:_keyreleased( key, scancode )
-- function Cs.input:_keyreleased(key, scancode)
-- end

-- INTERNAL REPLACE  handled = input:_textinput( text )
function Cs.input:_textinput(text)
	if not self:isKeyboardFocus() then  return false  end

	local oldValue = self:getValue()
	local handled  = self._field:textinput(text)

	local mask     = self._mask
	local newValue = self:getValue()
	if handled and mask ~= "" and newValue ~= oldValue and not newValue:find(mask) then
		newValue = oldValue
		self:setValue(newValue)
	elseif handled and newValue ~= oldValue then
		trigger(self, "valuechange")
	end

	return true
end



-- INTERNAL REPLACE  handled, grabFocus = input:_mousepressed( mouseX, mouseY, mouseButton, pressCount )
function Cs.input:_mousepressed(mx, my, mbutton, pressCount)
	if not self._active then
		return true, false
	end
	if not self:isHovered() then
		self:blur()
		return true, false
	end
	self:focus()
	self._gui._mouseFocusSet[mbutton] = true
	self._field:mousepressed(mx-self._layoutX-themeGet(self._gui, "inputIndentation"), 0, mbutton, pressCount)
	return true, false -- Note: We've set the focus ourselves.
end

-- INTERNAL REPLACE  input:_mousemoved( mouseX, mouseY )
function Cs.input:_mousemoved(mx, my)
	self._field:mousemoved(mx-self._layoutX-themeGet(self._gui, "inputIndentation"), 0)
end

-- INTERNAL REPLACE  input:_mousereleased( mouseX, mouseY, mouseButton )
function Cs.input:_mousereleased(mx, my, mbutton)
	self._field:mousereleased(mx-self._layoutX-themeGet(self._gui, "inputIndentation"), 0, mbutton)
end



-- INTERNAL REPLACE  handled = input:_ok( )
function Cs.input:_ok()
	self._gui._ignoreKeyboardInputThisFrame = true
	if not self:isFocused() then
		self:focus()
	else
		self:blur()
	end
	return true
end



-- OVERRIDE  input:setActive( bool )
function Cs.input:setActive(active)
	if not active then  self:blur()  end
	Cs.input.super.setActive(self, active)
end



-- INTERNAL REPLACE  input:_updateLayoutSize( )
function Cs.input:_updateLayoutSize()
	local inputIndent = themeGet(self._gui, "inputIndentation")

	local w, h = nil, nil
	if not (self._width and self._height) then
		w, h = themeGetSize(self, "input", inputIndent, self:getFont():getHeight())
	end

	w = (self._width  or math.max(w, self._minWidth))
	h = (self._height or math.max(h, self._minHeight))

	self._layoutWidth,      self._layoutHeight      = w,               h
	self._layoutInnerWidth, self._layoutInnerHeight = w-2*inputIndent, h
end

-- INTERNAL OVERRIDE  input:_expandLayout( [ expandWidth, expandHeight ] )
function Cs.input:_expandLayout(expandW, expandH)
	Cs.input.super._expandLayout(self, expandW, expandH)

	local inputIndent = themeGet(self._gui, "inputIndentation")

	self._layoutInnerWidth  = self._layoutWidth-2*inputIndent
	self._layoutInnerHeight = self._layoutHeight

	self._field:setWidth(self._layoutInnerWidth)
end



-- offset, width = input:getSelectionOffset( )
function Cs.input:getSelectionOffset()
	for i, x, y, w, h in self._field:eachSelectionOptimized() do
		return x, w
	end
	return 0, 0 -- We should never get here!
end

-- offset = input:getCursorOffset( )
function Cs.input:getCursorOffset()
	return (self._field:getCursorLayout())
end



-- phase = input:getBlinkPhase( )
function Cs.input:getBlinkPhase()
	return self._field:getBlinkPhase()
end



--==============================================================
--= Default theme ==============================================
--==============================================================

do
local Gui    = _M
defaultTheme = (function()
	local TAU = 2*math.pi



	-- Settings.

	local BUTTON_PADDING       = 3
	local BUTTON_IMAGE_SPACING = 3 -- Between text and image.
	local BUTTON_TEXT_SPACING  = 6 -- Between the texts, if there are two.

	local INPUT_PADDING        = 4

	local NAV_MAX_EXTRA_SIZE   = 10 -- In each direction.
	local NAV_SHRINK_DURATION  = .10

	local SCROLLBAR_WIDTH      = 6
	local SCROLLBAR_MIN_LENGTH = 10

	local TEXT_PADDING         = 1 -- For text elements.

	local TOOLTIP_PADDING      = 3
	local TOOLTIP_FADE_IN_TIME = .15



	-- Images.

	local BUTTON_BG_IMAGE = Gui.newMonochromeImage{
		" FFF ",
		"FFFFF",
		"FFFFF",
		"FFFFF",
		" FFF ",
	}
	local BUTTON_BG_QUADS = Gui.create9PartQuads(BUTTON_BG_IMAGE, 2, 2)

	local BUTTON_ARROW_IMAGE = Gui.newMonochromeImage{
		"F  ",
		"FF ",
		"FFF",
		"FF ",
		"F  ",
	}
	local BUTTON_ARROW_LENGTH = BUTTON_ARROW_IMAGE:getWidth()

	local NAV_IMAGE = Gui.newMonochromeImage{
		"  FFFF  ",
		" F2222F ",
		"F222222F",
		"F222222F",
		"F222222F",
		"F222222F",
		" F2222F ",
		"  FFFF  ",
	}
	local NAV_QUADS = Gui.create9PartQuads(NAV_IMAGE, 3, 3)



	-- LÖVE 0.10 support.

	local setColor = love.graphics.setColor

	if love.getVersion() < 11 then
		local _setColor = setColor
		function setColor(r, g, b, a)
			-- Convert color values from [0-1] to [0-255].
			_setColor(r*255, g*255, b*255, (a and a*255))
		end
	end



	--==============================================================
	--==============================================================
	--==============================================================

	return {



		-- Basic theme parameters.
		----------------------------------------------------------------

		inputIndentation   = INPUT_PADDING, -- Affects mouse interactions and input field scrolling.

		navigationSize     = 0, -- How much extra size the highlight of the navigation target has. Affects scrollIntoView().

		scrollbarWidth     = SCROLLBAR_WIDTH, -- @Incomplete: Get scrollbar width as 'size' instead of like this.
		scrollbarMinLength = SCROLLBAR_MIN_LENGTH,

		textIndentation    = TEXT_PADDING, -- Affects how multiline texts wraps in text elements.



		-- Special callbacks.
		----------------------------------------------------------------

		init = function(el)
			-- This function is called for every newly created element.
		end,



		-- Size callbacks.
		----------------------------------------------------------------

		-- These return the (minimum) dimensions for elements.

		-- If a width or height is 0 it generally means that that component is
		-- missing from the element, i.e. a button may not have an image.

		size = {
			-- Image element.
			-- size.image( imageElement, imageWidth, imageHeight )
			["image"] = function(imageEl, imageW, imageH)
				return imageW, imageH
			end,

			-- Text element.
			-- size.text( textElement, textWidth, textHeight )
			["text"] = function(textEl, textIndent, textW, textH)
				return textW+2*textIndent, textH+2*TEXT_PADDING
			end,

			-- Button element.
			-- size.button( buttonElement, text1Width, text2Width, textHeight, imageWidth, imageHeight )
			["button"] = function(button, text1W, text2W, textH, imageW, imageH)
				-- Buttons generally have 3 main states: only image, only text, or both image and text.
				-- The text can include two texts - a main and a secondary. Buttons can also have
				-- an arrow pointing in any axis-aligned direction. In this theme all these parameters
				-- affects the size and looks differently.

				local textW = text1W + (text2W > 0 and BUTTON_TEXT_SPACING+text2W or 0)
				local w, h

				-- Only image.
				if imageW > 0 and textW == 0 then
					w = imageW
					h = imageH

				-- Only text.
				elseif imageW == 0 then
					w = textW
					h = textH

				-- Image and text.
				else
					w = imageW+BUTTON_IMAGE_SPACING+textW
					h = math.max(textH, imageH)
				end

				w = w + 2*BUTTON_PADDING
				h = h + 2*BUTTON_PADDING

				local arrow = button:getArrow()

				if arrow == "left" or arrow == "right" then
					w = w+BUTTON_ARROW_LENGTH
				elseif arrow == "up" or arrow == "down" then
					h = h+BUTTON_ARROW_LENGTH
				else
					-- No arrow.
				end

				return w, h
			end,

			-- Input element.
			-- size.input( inputElement, _, valueHeight ) -- Ignore the 'width' argument.
			["input"] = function(input, _, valueH)
				-- Only the returned height is actually used. For inputs, the width
				-- is always specified directly on the element outside the theme.
				return 0, valueH+2*INPUT_PADDING
			end,

			-- Tooltip.
			-- size.tooltip( element, textWidth, textHeight )
			["tooltip"] = function(el, textW, textH)
				return textW+2*TOOLTIP_PADDING, textH+2*TOOLTIP_PADDING
			end,
		},



		-- Draw callbacks.
		----------------------------------------------------------------

		draw = {
			-- The background of an element with the 'background' attribute specified.
			-- draw.background( element, elementWidth, elementHeight, background )
			["background"] = function(el, w, h, bg)
				if bg == "warning" then
					setColor(.4, 0, 0, 1)
					love.graphics.rectangle("fill", 0, 0, w, h)
				else
					setColor(.12, .12, .12, .8)
					love.graphics.rectangle("fill", 0, 0, w, h)
				end
			end,

			-- Image element.
			-- draw.image( imageElement, elementWidth, elementHeight, imageWidth, imageHeight )
			["image"] = function(imageEl, w, h, imageW, imageH)
				local imageX = math.floor((w-imageW)/2)
				local imageY = math.floor((h-imageH)/2)

				if imageEl:hasImageBackgroundColor() then
					imageEl:useImageBackgroundColor()
					love.graphics.rectangle("fill", imageX, imageY, imageW, imageH)
				end

				imageEl:useImageColor()
				imageEl:drawImage(imageX, imageY)
			end,

			-- Text element.
			-- draw.text( textElement, elementWidth, elementHeight, textIndentation, textWidth, textHeight )
			["text"] = function(textEl, w, h, textIndent, textW, textH)
				local textAreaX = textIndent
				local textAreaY = math.floor((h-textH)/2)
				local textAreaW = w - 2*textIndent

				textEl:setScissor(0, 0, w, h) -- Make sure text doesn't render outside the element.

				textEl:useFont()
				textEl:useTextColor()
				textEl:drawAlignedText(textAreaX, textAreaY, textAreaW)
			end,

			-- Button element.
			-- draw.button( buttonElement, elementWidth, elementHeight, text1Width, text2Width, textHeight, imageWidth )
			["button"] = function(button, w, h, text1W, text2W, textH, imageW, imageH)
				-- Exclude any arrow from our position and dimensions.
				-- We'll draw the arrow outside these new bounds.
				local arrow = button:getArrow()
				local x, y  = 0, 0

				if     arrow == "right" then
					w = w-BUTTON_ARROW_LENGTH
				elseif arrow == "down"  then
					h = h-BUTTON_ARROW_LENGTH
				elseif arrow == "left"  then
					w = w-BUTTON_ARROW_LENGTH
					x = x+BUTTON_ARROW_LENGTH
				elseif arrow == "up"    then
					h = h-BUTTON_ARROW_LENGTH
					y = y+BUTTON_ARROW_LENGTH
				else
					-- No arrow
				end

				local align = button:getAlign()

				local midX  = x + math.floor(w/2)
				local midY  = y + math.floor(h/2)
				local textY = y + math.floor((h-textH)/2)

				local opacity = button:isActive() and 1 or .3

				local isHovered = button:isActive() and button:isHovered(true)

				-- Background.
				local r, g, b = 1, 1, 1
				local a       = (isHovered and .3 or .2) * opacity

				if button:isToggled()               then  r, g, b =   .4,   .8,    1  end
				if button:isPressed() and isHovered then  r, g, b = r*.6, g*.6, b*.6  end

				setColor(r, g, b, a)
				Gui.draw9PartScaled(x+1, y+1, w-2, h-2, BUTTON_BG_IMAGE, unpack(BUTTON_BG_QUADS))

				-- Arrow.
				if arrow and button:isToggled() then
					local image  = BUTTON_ARROW_IMAGE
					local arrLen = BUTTON_ARROW_LENGTH

					setColor(1, 1, 1)

					if     arrow == "right" then  love.graphics.draw(image, x+(w-1),                    y+math.floor((h-arrLen)/2), 0*TAU/4)
					elseif arrow == "down"  then  love.graphics.draw(image, x+math.floor((w+arrLen)/2), y+(h-1),                    1*TAU/4)
					elseif arrow == "left"  then  love.graphics.draw(image, x+(1),                      y+math.floor((h+arrLen)/2), 2*TAU/4)
					elseif arrow == "up"    then  love.graphics.draw(image, x+math.floor((w-arrLen)/2), y+(1),                      3*TAU/4)
					end
				end

				button:setScissor(x+2, y+2, w-2*2, h-2*2) -- Make sure the contents does not render outside the element.

				-- Only image.
				-- @Incomplete: Support 'align' for no-text image buttons.
				if button:hasSprite() and button:getText() == "" and button:getText2() == "" then
					if button:hasImageBackgroundColor() then
						button:useImageBackgroundColor(opacity)
						love.graphics.rectangle("fill", math.floor(midX-imageW/2), math.floor(midY-imageH/2), imageW, imageH)
					end

					button:useImageColor(opacity)
					button:drawImage(math.floor(midX-imageW/2), math.floor(midY-imageH/2))

				-- Only text
				elseif not button:hasSprite() then
					local text1X, text2X

					if align == "left" then
						text1X      = x + BUTTON_PADDING
						text2X      = math.max(x+w-BUTTON_PADDING-text2W, text1X+text1W+BUTTON_TEXT_SPACING)
					elseif align == "right" then
						text1X      = math.max(x+w-BUTTON_PADDING-text1W, x+BUTTON_PADDING)
						text2X      = math.min(x+BUTTON_PADDING, text1X-BUTTON_TEXT_SPACING-text2W)
					elseif align == "center" then
						local textW = text1W+(text2W > 0 and BUTTON_TEXT_SPACING+text2W or 0)
						text1X      = math.max(midX-math.floor(textW/2), x+BUTTON_PADDING)
						text2X      = text1X + text1W + BUTTON_TEXT_SPACING
					end

					button:useFont()
					setColor(1, 1, 1, .6*opacity)
					button:drawText2(text2X, textY)
					setColor(1, 1, 1, opacity)
					button:drawText(text1X, textY)

					-- @Incomplete: Handle utf8 characters and kerning. (Maybe add a helper method to GuiLeaf for getting character bounds.)
					local mnemonicPos = button:getMnemonicPosition()

					if mnemonicPos then
						local font       = button:getFont()
						local text1      = button:getText()
						local mnemonicX1 = text1X + font:getWidth(text1:sub(1, mnemonicPos-1))
						local mnemonicX2 = text1X + font:getWidth(text1:sub(1, mnemonicPos  ))
						love.graphics.rectangle("fill", mnemonicX1, textY+font:getBaseline(), mnemonicX2-mnemonicX1, 1)
					end

				-- Image and text.
				-- We'll ignore the align property and assume "left" alignment in this situation, for now.
				else
					if button:hasImageBackgroundColor() then
						button:useImageBackgroundColor(opacity)
						love.graphics.rectangle("fill", x+BUTTON_PADDING, math.floor(midY-imageH/2), imageW, imageH)
					end

					local text1X = x   + BUTTON_PADDING + imageW + BUTTON_IMAGE_SPACING
					local text2X = x+w - BUTTON_PADDING - text2W

					button:useImageColor(opacity)
					button:drawImage(x+BUTTON_PADDING, math.floor(midY-imageH/2))

					button:useFont()
					setColor(1, 1, 1, .6*opacity)
					button:drawText2(text2X, textY)
					setColor(1, 1, 1, opacity)
					button:drawText(text1X, textY)

					-- @Incomplete: Handle utf8 characters and kerning. (Maybe add a helper method to GuiLeaf for getting character bounds.)
					local mnemonicPos = button:getMnemonicPosition()

					if mnemonicPos then
						local font       = button:getFont()
						local text1      = button:getText()
						local mnemonicX1 = text1X + font:getWidth(text1:sub(1, mnemonicPos-1))
						local mnemonicX2 = text1X + font:getWidth(text1:sub(1, mnemonicPos  ))
						love.graphics.rectangle("fill", mnemonicX1, textY+font:getBaseline(), mnemonicX2-mnemonicX1, 1)
					end
				end
			end,

			-- Input element.
			-- draw.input( inputElement, elementWidth, elementHeight, inputIndentation, valueHeight, cursorOffset, selectionOffset, selectionWidth )
			["input"] = function(input, w, h, inputIndent, valueH, curOffset, selOffset, selW)
				local valueY  = math.floor((h-valueH)/2)
				local opacity = input:isActive() and 1 or .3

				-- Background.
				if input:isKeyboardFocus() then
					setColor(.4, 1, .4, .16)
					love.graphics.rectangle("fill", 1, 1, w-2, h-2)
				end

				-- Border.
				local isHovered = (input:isKeyboardFocus() or input:isActive() and input:isHovered(true))
				local a         = (isHovered and 1 or .4)*opacity
				setColor(1, 1, 1, a)
				love.graphics.rectangle("line", 1+.5, 1+.5, w-2-1, h-2-1)

				input:setScissor(2, 2, w-2*2, h-2*2) -- Make sure the contents does not render outside the element.

				-- Selection.
				if input:isKeyboardFocus() and selW > 0 then
					setColor(1, 1, 1, .4)
					love.graphics.rectangle("fill", inputIndent+selOffset, valueY, selW, valueH)
				end

				-- Value.
				input:useFont()
				setColor(1, 1, 1, opacity)
				input:drawValue(inputIndent, valueY)

				-- Cursor.
				if input:isKeyboardFocus() then
					local cursorOpacity = ((math.cos(5*input:getBlinkPhase()) + 1) / 2) ^ .5
					setColor(1, 1, 1, cursorOpacity)
					love.graphics.rectangle("fill", inputIndent+curOffset-1, valueY, 1, valueH)
				end
			end,

			-- Scrollbar.
			-- draw.scrollbar( element, scrollbarWidth, scrollbarHeight, direction, handlePosition, handleLength )
			-- draw.scrollbardeadzone( element, deadzoneWidth, deadzoneHeight )
			["scrollbar"] = function(el, w, h, dir, pos, len)
				local isScrolling     = el[dir == "x" and "isScrollingX"              or "isScrollingY"             ](el)
				local isBarHovered    = el[dir == "x" and "isScrollbarXHovered"       or "isScrollbarYHovered"      ](el)
				local isHandleHovered = el[dir == "x" and "isScrollbarXHandleHovered" or "isScrollbarYHandleHovered"](el)

				-- Background.
				local a = (isBarHovered or isScrolling) and .06 or 0
				setColor(1, 1, 1, a)
				love.graphics.rectangle("fill", 0, 0, w, h)

				-- Scrollbar handle.
				local handleX, handleY, handleW, handleH

				if     dir == "x" then  handleX, handleY, handleW, handleH = pos+1, 1, len-2, h-2
				elseif dir == "y" then  handleX, handleY, handleW, handleH = 1, pos+1, w-2, len-2
				end

				local a = (isScrolling and .12) or (isHandleHovered and .3) or (.2)
				setColor(1, 1, 1, a)

				Gui.draw9PartScaled(handleX, handleY, handleW, handleH, BUTTON_BG_IMAGE, unpack(BUTTON_BG_QUADS))
			end,
			["scrollbardeadzone"] = function(el, w, h)
				-- This is the area where the two scrollbars meet. In this theme we do nothing here.
			end,

			-- Highlight of current navigation target.
			-- draw.navigation( element, elementWidth, elementHeight, timeSinceNavigation )
			["navigation"] = function(el, w, h, time)
				-- Use a bigger highlight size right after navigation, then quickly shrink to same size as the element.
				local offset = NAV_MAX_EXTRA_SIZE * math.max(1-time/NAV_SHRINK_DURATION, 0)
				local x      = -offset
				local y      = -offset
				w            = w + 2*offset
				h            = h + 2*offset

				setColor(1, 1, 0, 1)
				Gui.draw9PartScaled(x, y, w, h, NAV_IMAGE, unpack(NAV_QUADS))
			end,

			-- Tooltip.
			-- draw.tooltip( element, tooltipWidth, tooltipHeight, text, textWidth, textHeight, timeVisible )
			["tooltip"] = function(el, w, h, text, textW, textH, time)
				local opacity = math.min(time/TOOLTIP_FADE_IN_TIME, 1)

				-- Background.
				setColor(1, 1, 1, opacity)
				love.graphics.rectangle("fill", 1, 1, w-2, h-2)
				love.graphics.setLineWidth(1)
				setColor(0, 0, 0)
				love.graphics.rectangle("line", .5, .5, w-1, h-1)

				-- Text.
				local x, y = TOOLTIP_PADDING, TOOLTIP_PADDING
				el:useTooltipFont()
				setColor(0, 0, 0, opacity)
				el:drawTooltip(x, y)
			end,
		},



		----------------------------------------------------------------
	}

	--==============================================================
	--==============================================================
	--==============================================================

  end)()
end



--==============================================================
--==============================================================
--==============================================================

return setmetatable(_M, {
	__call = function(_M, ...)
		return (Gui(...))
	end,
})

--==============================================================
--=
--=  MIT License
--=
--=  Copyright © 2017-2022 Marcus 'ReFreezed' Thunström
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
