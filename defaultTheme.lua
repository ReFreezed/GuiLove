--[[============================================================
--=
--=  Default theme for GuiLove
--=  - Written by Marcus 'ReFreezed' Thunström
--=
--=  You can use this as a template when making your own theme.
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



-- Modules
local moduleFolder = ('.'..(...)) :gsub('%.%w+$', '')
local Gui = require((moduleFolder..'.Gui'):sub(2))

local LG = love.graphics



-- Values

local BUTTON_PADDING       = 3
local BUTTON_IMAGE_SPACING = 3 -- Between text and image.
local BUTTON_TEXT_SPACING  = 6 -- Between the texts, if there are two.

local INPUT_PADDING        = 4

local NAV_MAX_EXTRA_SIZE   = 10 -- In each direction.
local NAV_SHRINK_DURATION  = 0.10

local SCROLLBAR_WIDTH      = 6
local SCROLLBAR_MIN_LENGTH = 10

local TEXT_PADDING         = 1 -- For text elements.

local TOOLTIP_PADDING      = 3
local TOOLTIP_FADE_IN_TIME = 0.15



-- Images

local BUTTON_BG_IMAGE = Gui.newMonochromeImage{
	' FFF ',
	'FFFFF',
	'FFFFF',
	'FFFFF',
	' FFF ',
}; local BUTTON_BG_QUADS = Gui.create9PartQuads(BUTTON_BG_IMAGE, 2, 2)

local BUTTON_ARROW_IMAGE = Gui.newMonochromeImage{
	'F  ',
	'FF ',
	'FFF',
	'FF ',
	'F  ',
}; local BUTTON_ARROW_LENGTH = BUTTON_ARROW_IMAGE:getWidth()

local NAV_IMAGE = Gui.newMonochromeImage{
	'  FFF  ',
	' F222F ',
	'F22222F',
	'F22222F',
	'F22222F',
	' F222F ',
	'  FFF  ',
}; local NAV_QUADS = Gui.create9PartQuads(NAV_IMAGE, 3, 3)



--==============================================================
--==============================================================
--==============================================================

return {



	-- Basic theme parameters

	inputIndentation   = INPUT_PADDING, -- Affects mouse interactions and input field scrolling.

	navigationSize     = 0, -- How much extra size the highlight of the navigation target has. Affects scrollIntoView().

	scrollbarWidth     = SCROLLBAR_WIDTH, -- @Incomplete: Get scrollbar width as 'size' instead of like this.
	scrollbarMinLength = SCROLLBAR_MIN_LENGTH,

	textIndentation    = TEXT_PADDING, -- Affects how multiline texts wraps in text elements.



	-- Special Callbacks
	----------------------------------------------------------------

	init = function(el)
		-- This function is called for every newly created element.
	end,



	-- Size Callbacks
	----------------------------------------------------------------

	-- These return the (minimum) dimensions for elements.

	-- If a width or height is 0 it generally means that that component is
	-- missing from the element, i.e. a button may not have an image.

	size = {

		-- Image element
		-- size.image( imageElement, imageWidth, imageHeight )
		['image'] = function(imageEl, imageW, imageH)
			return imageW, imageH
		end,

		-- Text element
		-- size.text( textElement, textWidth, textHeight )
		['text'] = function(textEl, textIndent, textW, textH)
			return textW+2*textIndent, textH+2*TEXT_PADDING
		end,

		-- Button element
		-- size.button( buttonElement, text1Width, text2Width, textHeight, imageWidth, imageHeight )
		['button'] = function(button, text1W, text2W, textH, imageW, imageH)

			-- Buttons generally have 3 main states: only image, only text, or both image and text.
			-- The text can include two texts - a main and a secondary. Buttons can also have
			-- an arrow pointing in any axis-aligned direction. In this theme all these parameters
			-- affects the size and looks differently.

			local textW = text1W+(text2W > 0 and BUTTON_TEXT_SPACING+text2W or 0)
			local w, h

			-- Only image
			if imageW > 0 and textW == 0 then
				w = imageW
				h = imageH

			-- Only text
			elseif imageW == 0 then
				w = textW
				h = textH

			-- Image and text
			else
				w = imageW+BUTTON_IMAGE_SPACING+textW
				h = math.max(textH, imageH)
			end

			w = w+2*BUTTON_PADDING
			h = h+2*BUTTON_PADDING

			local arrow = button:getArrow()
			if (arrow == 'left' or arrow == 'right') then
				w = w+BUTTON_ARROW_LENGTH
			elseif (arrow == 'up' or arrow == 'down') then
				h = h+BUTTON_ARROW_LENGTH
			else
				-- No arrow
			end

			return w, h
		end,

		-- Input element
		-- size.input( inputElement, _, valueHeight )
		['input'] = function(input, _, valueH)

			-- Only the returned height is actually used. For inputs, the width
			-- is always specified directly on the element outside the theme.
			return 0, valueH+2*INPUT_PADDING

		end,

		-- Tooltip
		-- size.tooltip( element, textWidth, textHeight )
		['tooltip'] = function(el, textW, textH)
			return textW+2*TOOLTIP_PADDING, textH+2*TOOLTIP_PADDING
		end,

	},



	-- Draw Callbacks
	----------------------------------------------------------------

	draw = {

		-- The background of an element with the 'background' attribute specified
		-- draw.background( element, elementWidth, elementHeight, background )
		['background'] = function(el, w, h, bg)

			if bg == 'warning' then
				LG.setColor(100, 0, 0, 255)
				LG.rectangle('fill', 0, 0, w, h)

			else
				LG.setColor(30, 30, 30, 200)
				LG.rectangle('fill', 0, 0, w, h)
			end

		end,

		-- Image element
		-- draw.image( imageElement, elementWidth, elementHeight, imageWidth, imageHeight )
		['image'] = function(imageEl, w, h, imageW, imageH)

			local imageX = math.floor((w-imageW)/2)
			local imageY = math.floor((h-imageH)/2)

			if imageEl:hasImageBackgroundColor() then
				imageEl:useImageBackgroundColor()
				LG.rectangle('fill', imageX, imageY, imageW, imageH)
			end

			imageEl:useImageColor()
			imageEl:drawImage(imageX, imageY)

		end,

		-- Text element
		-- draw.text( textElement, elementWidth, elementHeight, textIndentation, textWidth, textHeight )
		['text'] = function(textEl, w, h, textIndent, textW, textH)

			local textAreaX = textIndent
			local textAreaY = math.floor((h-textH)/2)
			local textAreaW = w-2*textIndent

			textEl:setScissor(0, 0, w, h) -- Make sure text doesn't render outside the element.

			textEl:useFont()
			textEl:useTextColor()
			textEl:drawAlignedText(textAreaX, textAreaY, textAreaW)

		end,

		-- Button element
		-- draw.button(
		--    buttonElement, elementWidth, elementHeight, text1Width, text2Width, textHeight, imageWidth )
		['button'] = function(button, w, h, text1W, text2W, textH, imageW, imageH)

			-- Exclude any arrow from our position and dimensions.
			-- We'll draw the arrow outside these new bounds.
			local arrow = button:getArrow()
			local x, y = 0, 0
			if arrow then
				if     arrow == 'right' then
					w = w-BUTTON_ARROW_LENGTH
				elseif arrow == 'down'  then
					h = h-BUTTON_ARROW_LENGTH
				elseif arrow == 'left'  then
					w = w-BUTTON_ARROW_LENGTH
					x = x+BUTTON_ARROW_LENGTH
				elseif arrow == 'up'    then
					h = h-BUTTON_ARROW_LENGTH
					y = y+BUTTON_ARROW_LENGTH
				else
					-- No arrow
				end
			end

			local align = button:getAlign()

			local midX, midY = x+math.floor(w/2), y+math.floor(h/2)
			local textY = y+math.floor((h-textH)/2)

			local opacity = (button:isActive() and 1 or 0.3)

			local isHovered = (button:isActive() and button:isHovered(true))

			-- Background
			local r, g, b = 255, 255, 255
			if button:isToggled()               then r, g, b = 100,   200,   255   end
			if button:isPressed() and isHovered then r, g, b = r*0.6, g*0.6, b*0.6 end
			LG.setColor(r, g, b, (isHovered and 70 or 50)*opacity)
			Gui.draw9PartScaled(x+1, y+1, w-2, h-2, BUTTON_BG_IMAGE, unpack(BUTTON_BG_QUADS))

			-- Arrow
			if (arrow and button:isToggled()) then
				local image, arrLen, floor = BUTTON_ARROW_IMAGE, BUTTON_ARROW_LENGTH, math.floor
				LG.setColor(255, 255, 255)
				if     arrow == 'right' then  LG.draw(image, x+(w-1),               y+floor((h-arrLen)/2), 0*tau/4)
				elseif arrow == 'down'  then  LG.draw(image, x+floor((w+arrLen)/2), y+(h-1),               1*tau/4)
				elseif arrow == 'left'  then  LG.draw(image, x+(1),                 y+floor((h+arrLen)/2), 2*tau/4)
				elseif arrow == 'up'    then  LG.draw(image, x+floor((w-arrLen)/2), y+(1),                 3*tau/4)
				end
			end

			button:setScissor(x+2, y+2, w-2*2, h-2*2) -- Make sure the contents does not render outside the element.

			-- Only image
			-- @Incomplete: Support 'align' for no-text image buttons.
			if (button:hasSprite() and button:getText() == '' and button:getText2() == '') then

				if button:hasImageBackgroundColor() then
					button:useImageBackgroundColor(opacity)
					LG.rectangle('fill', math.floor(midX-imageW/2), math.floor(midY-imageH/2), imageW, imageH)
				end

				button:useImageColor(opacity)
				button:drawImage(math.floor(midX-imageW/2), math.floor(midY-imageH/2))

			-- Only text
			elseif not button:hasSprite() then

				local text1X, text2X
				if align == 'left' then
					text1X = x+BUTTON_PADDING
					text2X = math.max(x+w-BUTTON_PADDING-text2W, text1X+text1W+BUTTON_TEXT_SPACING)
				elseif align == 'right' then
					text1X = math.max(x+w-BUTTON_PADDING-text1W, x+BUTTON_PADDING)
					text2X = math.min(x+BUTTON_PADDING, text1X-BUTTON_TEXT_SPACING-text2W)
				elseif align == 'center' then
					local textW = text1W+(text2W > 0 and BUTTON_TEXT_SPACING+text2W or 0)
					text1X = math.max(midX-math.floor(textW/2), x+BUTTON_PADDING)
					text2X = text1X+text1W+BUTTON_TEXT_SPACING
				end

				button:useFont()
				LG.setColor(255, 255, 255, 150*opacity)
				button:drawText2(text2X, textY)
				LG.setColor(255, 255, 255, 255*opacity)
				button:drawText(text1X, textY)

				-- @Incomplete: Handle utf8 characters and kerning. Maybe add a
				-- helper method to GuiLeaf for getting character bounds.
				local mnemonicPos = button:getMnemonicPosition()
				if mnemonicPos then
					local font = button:getFont()
					local text1 = button:getText()
					local mnemonicX1 = text1X+font:getWidth(text1:sub(1, mnemonicPos-1))
					local mnemonicX2 = text1X+font:getWidth(text1:sub(1, mnemonicPos))
					LG.rectangle('fill', mnemonicX1, textY+font:getBaseline(), mnemonicX2-mnemonicX1, 1)
				end

			-- Image and text
			-- We'll ignore the align property and assume "left" alignment in this situation, for now.
			else

				if button:hasImageBackgroundColor() then
					button:useImageBackgroundColor(opacity)
					LG.rectangle('fill', x+BUTTON_PADDING, math.floor(midY-imageH/2), imageW, imageH)
				end

				local text1X = x+BUTTON_PADDING+imageW+BUTTON_IMAGE_SPACING
				local text2X = x+w-BUTTON_PADDING-text2W

				button:useImageColor(opacity)
				button:drawImage(x+BUTTON_PADDING, math.floor(midY-imageH/2))

				button:useFont()
				LG.setColor(255, 255, 255, 150*opacity)
				button:drawText2(text2X, textY)
				LG.setColor(255, 255, 255, 255*opacity)
				button:drawText(text1X, textY)

				-- @Incomplete: Handle utf8 characters and kerning. Maybe add a
				-- helper method to GuiLeaf for getting character bounds.
				local mnemonicPos = button:getMnemonicPosition()
				if mnemonicPos then
					local font = button:getFont()
					local text1 = button:getText()
					local mnemonicX1 = text1X+font:getWidth(text1:sub(1, mnemonicPos-1))
					local mnemonicX2 = text1X+font:getWidth(text1:sub(1, mnemonicPos))
					LG.rectangle('fill', mnemonicX1, textY+font:getBaseline(), mnemonicX2-mnemonicX1, 1)
				end

			end

		end,

		-- Input element
		-- draw.input( inputElement, elementWidth, elementHeight, inputIndentation, valueHeight )
		-- @Incomplete: Add inputIndentation as argument.
		['input'] = function(input, w, h, inputIndent, valueH)
			local field = input:getField()
			local textY = math.floor((h-valueH)/2)
			local opacity = (input:isActive() and 1 or 0.3)

			-- Background
			if input:isKeyboardFocus() then
				LG.setColor(100, 255, 100, 40)
				LG.rectangle('fill', 1, 1, w-2, h-2)
			end

			-- Border
			local isHovered = (input:isKeyboardFocus() or input:isActive() and input:isHovered(true))
			LG.setColor(255, 255, 255, (isHovered and 255 or 100)*opacity)
			LG.rectangle('line', 1+0.5, 1+0.5, w-2-1, h-2-1)

			input:setScissor(2, 2, w-2*2, h-2*2) -- Make sure the contents does not render outside the element.

			-- Selection
			if input:isKeyboardFocus() then
				local x1, x2 = field:getSelectionOffset()
				if x2 > x1 then
					LG.setColor(255, 255, 255, 100)
					LG.rectangle('fill', inputIndent+x1, textY, x2-x1, valueH)
				end
			end

			-- Value
			input:useFont()
			LG.setColor(255, 255, 255, 255*opacity)
			input:drawValue(inputIndent, textY)

			-- Cursor
			if input:isKeyboardFocus() then
				local cursorOpacity = ((math.cos(5*field:getBlinkPhase())+1)/2)^0.5
				LG.setColor(255, 255, 255, 255*cursorOpacity)
				LG.rectangle('fill', inputIndent+field:getCursorOffset()-1, textY, 1, valueH)
			end

		end,

		-- Scrollbar
		-- draw.scrollbar( element, scrollbarWidth, scrollbarHeight, direction, handlePosition, handleLength )
		-- draw.scrollbardeadzone( element, deadzoneWidth, deadzoneHeight )
		['scrollbar'] = function(el, w, h, dir, pos, len)

			local isScrolling     = el[dir == 'x' and 'isScrollingX'              or 'isScrollingY'             ](el)
			local isBarHovered    = el[dir == 'x' and 'isScrollbarXHovered'       or 'isScrollbarYHovered'      ](el)
			local isHandleHovered = el[dir == 'x' and 'isScrollbarXHandleHovered' or 'isScrollbarYHandleHovered'](el)

			-- Background
			LG.setColor(255, 255, 255, ((isBarHovered or isScrolling) and 15 or 0))
			LG.rectangle('fill', 0, 0, w, h)

			-- Scrollbar handle
			local handleX, handleY, handleW, handleH
			if dir == 'x' then
				handleX, handleY, handleW, handleH = pos+1, 1, len-2, h-2
			elseif dir == 'y' then
				handleX, handleY, handleW, handleH = 1, pos+1, w-2, len-2
			end
			LG.setColor(255, 255, 255, ((isScrolling and 30) or (isHandleHovered and 70) or (50)))
			Gui.draw9PartScaled(handleX, handleY, handleW, handleH, BUTTON_BG_IMAGE, unpack(BUTTON_BG_QUADS))

		end,
		['scrollbardeadzone'] = function(el, w, h)
			-- This is the area where the two scrollbars meet. In this theme we do nothing here.
		end,

		-- Highlight of current navigation target
		-- draw.navigation( element, elementWidth, elementHeight, timeSinceNavigation )
		['navigation'] = function(el, w, h, time)

			-- Use a bigger highlight size right after navigation, then quickly shrink to same size as the element.
			local offset = NAV_MAX_EXTRA_SIZE*math.max(1-time/NAV_SHRINK_DURATION, 0)
			local x, y = -offset, -offset
			w, h = w+2*offset, h+2*offset

			LG.setColor(255, 255, 0, 255)
			Gui.draw9PartScaled(x, y, w, h, NAV_IMAGE, unpack(NAV_QUADS))

		end,

		-- Tooltip
		-- draw.tooltip( element, tooltipWidth, tooltipHeight, text, textWidth, textHeight, timeVisible )
		['tooltip'] = function(el, w, h, text, textW, textH, time)
			local opacity = math.min(time/TOOLTIP_FADE_IN_TIME, 1)

			-- Background
			LG.setColor(255, 255, 255, 255*opacity)
			LG.rectangle('fill', 1, 1, w-2, h-2)
			LG.setLineWidth(1)
			LG.setColor(0, 0, 0)
			LG.rectangle('line', 0.5, 0.5, w-1, h-1)

			-- Text
			local x, y = TOOLTIP_PADDING, TOOLTIP_PADDING
			el:useTooltipFont()
			LG.setColor(0, 0, 0, 255*opacity)
			el:drawTooltip(x, y)

		end,

	},



	----------------------------------------------------------------

}

--==============================================================
--==============================================================
--==============================================================
