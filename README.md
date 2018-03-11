<h1 align="center">GuiLove</h1>

<p align="center">
	A not-so-simple GUI library for <a href="https://love2d.org/">LÖVE</a>.
</p>

<p align="center">
	<img src="https://img.shields.io/badge/beta-0.1-blue.svg">
	<a href="https://love2d.org/">
		<img src="https://img.shields.io/badge/LÖVE-0.10.2-green.svg">
	</a>
</p>

<p align="center">
	<img src="screenshot.png">
</p>



## README

- [Basic Usage](#basic-usage)
- [API](#api)
	- [Gui Methods](#gui-methods)
	- [Element Types, Methods and Events](#element-types-methods-and-events)
	- [Includes](#includes)
	- [Tools](#tools)



## Basic Usage

```lua
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
```



## API

Check the source code for more info.



### Gui Methods

```
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
```



### Element Types, Methods and Events

```
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
```



### Includes

```
imageMixin
- drawImage
- getImageBackgroundColor, setImageBackgroundColor, hasImageBackgroundColor, useImageBackgroundColor
- getImageColor, setImageColor, hasImageColor, useImageColor
- getImageDimensions, setImageSize, maximizeImageSize
- getImageScale, getImageScaleX, getImageScaleY, setImageScale, setImageScaleX, setImageScaleY
- getSprite, setSprite, hasSprite
```



### Tools

```
- create9PartQuads
- draw9PartScaled
- newMonochromeImage, newImageUsingPalette
```
