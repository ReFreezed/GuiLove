io.stdout:setvbuf("no")
io.stderr:setvbuf("no")

local Gui = require("Gui")
local gui = Gui()

local tree = {"root",
	{"hbar", expandChildren=false,
		{"hbar", expandY=true,
			{"text", text="Left text goes here."},
		},
		{"vbar", id="myContainer", width=200, minHeight=120, maxHeight=120,
			{"text", text="I'm just a text."},
			{"input", value="foo"},
			{"input", value="bar"},
			{"button", id="myButton", text="Press Me!"},
		},
	},
}
gui:load(tree)

local myButton   = gui:find("myButton")
local pressCount = 0

myButton:on("press", function(myButton, event)
	pressCount = pressCount + 1

	local myContainer = gui:find("myContainer")
	local text        = "Pressed button " .. pressCount .. " " .. (pressCount == 1 and "time" or "times") .. "!"
	myContainer:insert{ "text", text=text }
end)

gui:getRoot():setDimensions(love.graphics.getDimensions())



function love.keypressed(key, scancode, isRepeat)
	if gui:keypressed(key, scancode, isRepeat) then
		-- void
	elseif key == "escape" then
		love.event.quit()
	end
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
	gui:mousereleased(mx, my, mbutton, pressCount)
end

function love.wheelmoved(dx, dy)
	gui:wheelmoved(dx, dy)
end



function love.update(dt)
	gui.debug = love.keyboard.isScancodeDown"`"
	gui:update(dt)
end

function love.draw()
	gui:draw()
end


