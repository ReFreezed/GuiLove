--[[============================================================
--=
--=  Default theme for GuiLove
--=  - Written by Marcus 'ReFreezed' Thunström
--=
--=  You can use this as a template when making your own theme.
--=  The library does not need this file to work.
--=
--==============================================================

	The theme table returned from this module contains this:

	{

		basic parameters
		(...)

		special functions
		(...)

		size = {
			element measuring functions
			(...)
		}

		draw = {
			element drawing functions
			(...)
		}

	}

--============================================================]]

local Gui = require("Gui")
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

			local isHovered = button:isActive() and button:isHovered()

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

				local mnemonicX, mnemonicY, mnemonicW = button:getMnemonicOffset()
				if mnemonicX then
					love.graphics.rectangle("fill", text1X+mnemonicX, textY+mnemonicY+1, mnemonicW, 1)
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

				local mnemonicX, mnemonicY, mnemonicW = button:getMnemonicOffset()
				if mnemonicX then
					love.graphics.rectangle("fill", text1X+mnemonicX, textY+mnemonicY+1, mnemonicW, 1)
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
			local isHighlighted = (input:isActive() and input:isHovered()) or input:isKeyboardFocus()
			local a             = (isHighlighted and 1 or .4) * opacity
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
