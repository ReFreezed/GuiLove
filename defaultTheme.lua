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

local INPUT_PADDING = 4

local SLIDER_PADDING          = 6
local SLIDER_WIDTH            = 16
local SLIDER_DEFAULT_LENGTH   = 80
local SLIDER_HANDLE_THICKNESS = 3
local SLIDER_MARKER_WIDTH     = 6

local CONTINUOUS_SLIDER_DEFAULT_WIDTH = 3 -- Relative to font size.

local NAV_EXTRA_SIZE      = 10 -- In each direction.
local NAV_SHRINK_DURATION = .10

local SCROLLBAR_WIDTH      = 8
local SCROLLBAR_MIN_LENGTH = 12

local TEXT_PADDING = 1 -- For text elements.

local TOOLTIP_PADDING       = 3
local TOOLTIP_FADE_DURATION = .15



-- Images.

local buttonBackgroundImage = Gui.newMonochromeImage{
	"3cffffc3",
	"cffffffc",
	"ffffffff",
	"ffffffff",
	"ffffffff",
	"ffffffff",
	"cffffffc",
	"3cffffc3",
}
local buttonBackgroundQuads = Gui.create9SliceQuads(buttonBackgroundImage, 3, 3)

local navigationImage = Gui.newMonochromeImage{
	" 4cffffc4 ",
	"4e822228e4",
	"c82222228c",
	"f22222222f",
	"f22222222f",
	"f22222222f",
	"f22222222f",
	"c82222228c",
	"4e822228e4",
	" 4cffffc4 ",
}
local navigationQuads = Gui.create9SliceQuads(navigationImage, 4, 4)

local continuousSliderImage = Gui.newMonochromeImage{
	"ff",
	"66",
	"22",
	"00",
	"00",
	"22",
	"66",
	"ff",
}
continuousSliderImage:setFilter("linear", "linear")



--==============================================================
--==============================================================
--==============================================================

return {



	-- Basic theme parameters.
	----------------------------------------------------------------

	inputIndentation   = INPUT_PADDING,  -- Affects mouse interactions and scrolling for inputs.
	sliderIndentation  = SLIDER_PADDING, -- Affects mouse interactions for sliders.

	navigationSize     = NAV_EXTRA_SIZE, -- How much extra size the highlight of the navigation target has. Affects scrollIntoView().

	scrollbarWidth     = SCROLLBAR_WIDTH,
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
		-- size.text( textElement, textIndentation, textWidth, textHeight )
		["text"] = function(textEl, textIndent, textW, textH)
			return textW+2*textIndent, textH+2*TEXT_PADDING
		end,

		-- Button element.
		-- size.button( buttonElement, text1Width, text2Width, textHeight, imageWidth, imageHeight )
		["button"] = function(button, text1W, text2W, textH, imageW, imageH)
			--
			-- Buttons generally have 3 main states: only image, only text, or both image
			-- and text. The text can include two texts - a main and a secondary. In this
			-- theme all these parameters affects the size and looks differently.
			--
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
				w = imageW + BUTTON_IMAGE_SPACING + textW
				h = math.max(textH, imageH)
			end

			w = w + 2*BUTTON_PADDING
			h = h + 2*BUTTON_PADDING

			return w, h
		end,

		-- Input element.
		-- size.input( inputElement, _, fontHeight ) -- Ignore the 'width' argument for inputs.
		["input"] = function(input, _, fontHeight)
			-- Only the returned height is actually used. For inputs, the width
			-- is always specified directly on the element outside the theme.
			return 0, fontHeight+2*INPUT_PADDING
		end,

		-- Slider element.
		-- size.slider( sliderElement, zeroWidth, zeroHeight, sliderIndentation, fontHeight )
		["slider"] = function(slider, w, h, sliderIndent, fontH)
			if slider:isContinuous() then
				w = CONTINUOUS_SLIDER_DEFAULT_WIDTH*fontH + 2*SLIDER_PADDING
				h = fontH + 2*SLIDER_PADDING

			else
				w = SLIDER_DEFAULT_LENGTH + 2*sliderIndent
				h = SLIDER_WIDTH + 2*SLIDER_PADDING

				if slider:isVertical() then
					w, h = h, w
				end
			end

			return w, h
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
				Gui.setColor(.4, 0, 0, .9)
				love.graphics.rectangle("fill", 0, 0, w, h)
			else
				Gui.setColor(.17, .17, .17, .9)
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
			local align = button:getAlign()

			local midX  = math.floor(w/2)
			local midY  = math.floor(h/2)
			local textY = math.floor((h-textH)/2)

			local opacity = button:isActive() and 1 or .3

			local isHovered = button:isActive() and button:isHovered()

			-- Background.
			local r, g, b = .4, .4, .4
			if button:isToggled() then  r, g, b = .4, .6, 1 end

			local highlight = isHovered and not button:isPressed() and 1 or 0
			if button:isPressed() and isHovered then  r, g, b = r*.25, g*.25, b*.25  end

			r, g, b = Gui.lerpColor(r,g,b, 1,1,1, .3*highlight)
			local a = .8 * opacity

			Gui.setColor(r, g, b, a)
			Gui.draw9SliceScaled(1, 1, w-2, h-2, buttonBackgroundImage, unpack(buttonBackgroundQuads))

			button:setScissor(2, 2, w-2*2, h-2*2) -- Make sure the contents does not render outside the element.

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
					text1X      = BUTTON_PADDING
					text2X      = math.max(w-BUTTON_PADDING-text2W, text1X+text1W+BUTTON_TEXT_SPACING)
				elseif align == "right" then
					text1X      = math.max(w-BUTTON_PADDING-text1W, BUTTON_PADDING)
					text2X      = math.min(BUTTON_PADDING, text1X-BUTTON_TEXT_SPACING-text2W)
				elseif align == "center" then
					local textW = text1W+(text2W > 0 and BUTTON_TEXT_SPACING+text2W or 0)
					text1X      = math.max(midX-math.floor(textW/2), BUTTON_PADDING)
					text2X      = text1X + text1W + BUTTON_TEXT_SPACING
				end

				button:useFont()
				Gui.setColor(1, 1, 1, .6*opacity)
				button:drawText2(text2X, textY)
				Gui.setColor(1, 1, 1, opacity)
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
					love.graphics.rectangle("fill", BUTTON_PADDING, math.floor(midY-imageH/2), imageW, imageH)
				end

				local text1X =     BUTTON_PADDING + imageW + BUTTON_IMAGE_SPACING
				local text2X = w - BUTTON_PADDING - text2W

				button:useImageColor(opacity)
				button:drawImage(BUTTON_PADDING, math.floor(midY-imageH/2))

				button:useFont()
				Gui.setColor(1, 1, 1, .6*opacity)
				button:drawText2(text2X, textY)
				Gui.setColor(1, 1, 1, opacity)
				button:drawText(text1X, textY)

				local mnemonicX, mnemonicY, mnemonicW = button:getMnemonicOffset()
				if mnemonicX then
					love.graphics.rectangle("fill", text1X+mnemonicX, textY+mnemonicY+1, mnemonicW, 1)
				end
			end
		end,

		-- Input element.
		-- draw.input( inputElement, elementWidth, elementHeight, valueX, valueY, valueWidth, valueHeight, cursorOffsetX, cursorOffsetY, fontHeight )
		["input"] = function(input, w, h, valueX, valueY, valueW, valueH, curOffsetX, curOffsetY, fontHeight)
			local opacity = input:isActive() and 1 or .3

			-- Background.
			if input:isKeyboardFocus() then
				Gui.setColor(.3, .7, .3, .3)
				love.graphics.rectangle("fill", 1, 1, w-2, h-2)
			end

			-- Border.
			local isHighlighted = (input:isActive() and input:isHovered()) or input:isKeyboardFocus()
			local a             = (isHighlighted and 1 or .4) * opacity
			Gui.setColor(1, 1, 1, a)
			love.graphics.rectangle("line", 1+.5, 1+.5, w-2-1, h-2-1)

			input:setScissor(2, 2, w-2*2, h-2*2) -- Make sure the contents does not render outside the element.

			--
			-- Note: If the user can use the mouse to interact with the GUI then we're
			-- quite restricted to how we can render the value, the cursor and selections
			-- for the mechanics and the visuals to stay in sync.
			--

			-- Selections.
			if input:isKeyboardFocus() then
				Gui.setColor(1, 1, 1, .35)
				input:drawSelections(valueX, valueY)
			end

			-- Value.
			input:useFont()
			if input:getValue() ~= "" then
				Gui.setColor(1, 1, 1, opacity)
				input:drawValue(valueX, valueY)
			else
				Gui.setColor(1, 1, 1, .5*opacity)
				input:drawPlaceholder(valueX, valueY)
			end

			-- Cursor.
			if input:isKeyboardFocus() then
				local cursorOpacity = ((math.cos(5*input:getBlinkPhase()) + 1) / 2) ^ .5
				Gui.setColor(1, 1, 1, cursorOpacity)
				love.graphics.rectangle("fill", valueX+curOffsetX-1, valueY+curOffsetY, 1, fontHeight)
			end
		end,

		-- Slider element.
		-- draw.slider( inputElement, elementWidth, elementHeight, sliderIndentation )
		["slider"] = function(slider, w, h, sliderIndent)
			if slider:isContinuous() then
				local opacity       = slider:isActive() and 1 or .3
				local isHighlighted = (slider:isActive() and slider:isHovered()) or slider:isMouseFocus()
				local a             = (isHighlighted and 1 or .7) * opacity

				Gui.setColor(1, 1, 1, .6*a)
				love.graphics.rectangle("fill", 0, 0,  2, h)
				love.graphics.rectangle("fill", w, 0, -2, h)
				love.graphics.draw(continuousSliderImage, 0,0, 0, w/continuousSliderImage:getWidth(),h/continuousSliderImage:getHeight())

				Gui.setColor(1, 1, 1, opacity)
				slider:useFont()
				slider:drawValue(math.floor(w/2), math.floor(h/2), .5, .5)

			else
				if slider:isVertical() then
					love.graphics.push()
					love.graphics.translate(w, 0)
					love.graphics.rotate(TAU/4)
					w, h = h, w
				end

				local railX1  = sliderIndent
				local railX2  = w - sliderIndent
				local railW   = railX2 - railX1
				local handleX = railX1 + railW * (slider:isVertical() and 1-slider:getNormalizedValue() or slider:getNormalizedValue())
				local railY   = math.floor(.5*h)

				local opacity       = slider:isActive() and 1 or .3
				local isHighlighted = (slider:isActive() and slider:isHovered()) or slider:isMouseFocus()
				local a             = (isHighlighted and 1 or .7) * opacity

				-- Rail.
				Gui.setColor(1, 1, 1, .7*a)
				love.graphics.rectangle("fill", railX1, railY-1, railW, 2)

				-- Helper markers.
				Gui.setColor(1, 1, 1, .7*a)
				love.graphics.rectangle("fill",            railX1                , railY-.5*SLIDER_MARKER_WIDTH, 1, SLIDER_MARKER_WIDTH)
				love.graphics.rectangle("fill", math.floor(railX1+0.25*(railW-1)), railY-.5*SLIDER_MARKER_WIDTH, 1, SLIDER_MARKER_WIDTH)
				love.graphics.rectangle("fill", math.floor(railX1+0.50*(railW-1)), railY-.5*SLIDER_MARKER_WIDTH, 1, SLIDER_MARKER_WIDTH)
				love.graphics.rectangle("fill", math.floor(railX1+0.75*(railW-1)), railY-.5*SLIDER_MARKER_WIDTH, 1, SLIDER_MARKER_WIDTH)
				love.graphics.rectangle("fill",            railX2-1              , railY-.5*SLIDER_MARKER_WIDTH, 1, SLIDER_MARKER_WIDTH)

				-- Value handle.
				Gui.setColor(1, 1, 1, a)
				love.graphics.rectangle("fill", math.floor(handleX-.5*SLIDER_HANDLE_THICKNESS), railY-.5*SLIDER_WIDTH, SLIDER_HANDLE_THICKNESS, SLIDER_WIDTH)

				if slider:isVertical() then
					love.graphics.pop()
				end
			end
		end,

		-- Scrollbar.
		-- draw.scrollbar( container, scrollbarWidth, scrollbarHeight, direction, handlePosition, handleLength )
		-- draw.scrollbardeadzone( container, deadzoneWidth, deadzoneHeight )
		["scrollbar"] = function(container, w, h, dir, pos, len)
			local isScrolling     = container[dir == "x" and "isScrollingX"              or "isScrollingY"             ](container)
			local isBarHovered    = container[dir == "x" and "isScrollbarXHovered"       or "isScrollbarYHovered"      ](container)
			local isHandleHovered = container[dir == "x" and "isScrollbarXHandleHovered" or "isScrollbarYHandleHovered"](container)

			-- Background.
			local a = (isBarHovered or isScrolling) and .1 or 0
			Gui.setColor(1, 1, 1, a)
			love.graphics.rectangle("fill", 0, 0, w, h)

			-- Scrollbar handle.
			local handleX, handleY, handleW, handleH

			if    dir == "x"
			then  handleX, handleY, handleW, handleH = pos+1, 1, len-2, h-2
			else  handleY, handleX, handleH, handleW = pos+1, 1, len-2, w-2  end

			local a = (isScrolling and .2) or (isHandleHovered and .3) or (.2)
			Gui.setColor(1, 1, 1, a)

			Gui.draw9SliceScaled(handleX, handleY, handleW, handleH, buttonBackgroundImage, unpack(buttonBackgroundQuads))
		end,
		["scrollbardeadzone"] = function(container, w, h)
			-- This is the area where the two scrollbars meet (if there are two).
			-- In this theme we just leave it empty.
		end,

		-- Highlight of current navigation target.
		-- draw.navigation( widget, elementWidth, elementHeight, timeSinceNavigation )
		["navigation"] = function(widget, w, h, timeSinceNav)
			-- Use a bigger highlight size right after navigation, then quickly shrink to same size as the element.
			local offset = NAV_EXTRA_SIZE * math.max(1-timeSinceNav/NAV_SHRINK_DURATION, 0)
			local x      = -offset
			local y      = -offset
			w            = w + 2*offset
			h            = h + 2*offset

			Gui.setColor(1, 1, 0, 1)
			Gui.draw9SliceScaled(x, y, w, h, navigationImage, unpack(navigationQuads))
		end,

		-- Tooltip.
		-- draw.tooltip( element, tooltipWidth, tooltipHeight, text, textWidth, textHeight, timeVisible, timeUntilInvisible )
		["tooltip"] = function(el, w, h, text, textW, textH, timeVisible, timeUntilInvisible)
			local opacity = math.min(timeVisible, timeUntilInvisible) / TOOLTIP_FADE_DURATION
			opacity       = math.min(opacity, 1)

			-- Background.
			Gui.setColor(1, 1, 1, opacity)
			love.graphics.rectangle("fill", 1, 1, w-2, h-2)
			love.graphics.setLineWidth(1)
			Gui.setColor(0, 0, 0)
			love.graphics.rectangle("line", .5, .5, w-1, h-1)

			-- Text.
			local x = TOOLTIP_PADDING
			local y = TOOLTIP_PADDING
			el:useTooltipFont()
			Gui.setColor(0, 0, 0, opacity)
			el:drawTooltip(x, y)
		end,
	},



	----------------------------------------------------------------
}

--==============================================================
--==============================================================
--==============================================================
