io.stdout:setvbuf("no")
io.stderr:setvbuf("no")

local Gui = require("Gui")
local gui = Gui()

gui:load{"root", width=love.graphics.getWidth(), height=love.graphics.getHeight(),
	{"vbar", relativeWidth=1, relativeHeight=1,
		{"hbar", homogeneous=true,
			{"button", mnemonics=true, weight=1, text="&File", relativeWidth=.5},
			{"button", mnemonics=true, weight=1, text="&Edit"},
			{"button", mnemonics=true, weight=1, text="&Search"},
			{"button", mnemonics=true, weight=1, text="&Debug"},
			{"button", mnemonics=true, weight=1, text="&Help"},
		},
		{"hbar", homogeneous=true,
			{"button", weight=0, text="XYZ", relativeWidth=.5},
			{"button", weight=1, text="1"},
			{"button", weight=1, text="2"},
			{"button", weight=1, text="3"},
			{"button", weight=1, text="4"},
		},
		{"hbar", homogeneous=true,
			{"button", weight=0, text="XYZ", relativeWidth=.5},
			{"button", weight=1, text="qwerty"},
			{"button", weight=0, text="1"},
			{"button", weight=0, text="2"},
			{"button", weight=0, text="3"},
		},

		{"hbar",
			{"button", text="[A]"},
			{"button", text="[B]", weight=1},
			{"button", text="[C]"},
		},
		{"hbar",
			{"button", text="untitled.txt"},
		},
		{"input", weight=1},
		{"hbar",
			{"text", align="left", weight=1,  text="Foo bar"},
			{"text", align="left", width=50,  text="INS"},
			{"text", align="left", width=130, text="Line 1, Column 1"},
		},
	},

	{"hbar", hidden=true, --expandPerpendicular=false,
		{"hbar", --relativeHeight=1,
			{"text", text="Left text goes here."},
		},
		{"vbar", id="myContainer", width=200, minHeight=120, maxHeight=120, homogeneous=true,
			{"text", text="I'm just a\ntwo line text."},
			{"input", value="foo"},
			{"input", value="bar", weight=2},
			{"button", id="myButton", text="Press Me!"},
		},
	},
}

local myButton   = gui:find("myButton")
local pressCount = 0

myButton:on("press", function(myButton, event)
	pressCount = pressCount + 1

	local myContainer = gui:find("myContainer")
	local text        = "Pressed button " .. pressCount .. " " .. (pressCount == 1 and "time" or "times") .. "!"
	myContainer:insert{ "text", text=text }
end)



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


