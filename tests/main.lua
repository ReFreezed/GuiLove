io.stdout:setvbuf("no")
io.stderr:setvbuf("no")

love.keyboard.setKeyRepeat(true)

local TAU = 2*math.pi

local Gui = require("Gui")
local gui = Gui()

gui:load{"root", width=love.graphics.getWidth(), height=love.graphics.getHeight(),
	{"hbar", relativeWidth=1, relativeHeight=1,
		{"vbar", weight=1,
			{"hbar", homogeneous=true,
				{"button", mnemonics=true, weight=1, text="&File", relativeWidth=.5},
				{"button", mnemonics=true, weight=1, text="&Edit"},
				{"button", mnemonics=true, weight=1, text="&Search"},
				{"button", mnemonics=true, weight=1, text="&Debug", maxWidth=120}, -- @Incomplete: maxWidth needs better handling in this case.
				{"button", mnemonics=true, weight=1, text="&Help"},
			},
			{"hbar", homogeneous=true,
				{"button", weight=0, text="50%", relativeWidth=.5},
				{"button", weight=1, text="expand1"},
				{"button", weight=1, text="expand2"},
				{"button", weight=1, text="expand3"},
				{"button", weight=1, text="expand4"},
			},
			{"hbar", homogeneous=true,
				{"button", weight=0, text="50%", relativeWidth=.5},
				{"button", weight=1, text="expand"},
				{"button", weight=0, text="[1]"},
				{"button", weight=0, text="1-FLOAT", floating=true, originX=.75, anchorX=1, y=-5}, -- @Incomplete: Test floating containers in bars.
				{"button", weight=0, text="FLOAT-2", floating=true, originX=.75, anchorX=0, y=-5},
				{"button", weight=0, text="[2]"},
				{"button", weight=0, text="[3]"},
			},

			{"hbar",
				{"button", text="[1]"},
				{"button", text="expand", weight=1},
				{"button", text="[2]"},
			},
			{"hbar", paddingHorizontal=8, paddingTop=4,
				{"button", text="untitled (1).txt"},
				{"button", text="untitled (2).txt"},
			},
			{"input", weight=1},
			{"hbar",
				{"text", align="left", weight=1,  text="Foo bar"},
				{"text", align="left", width=50,  text="INS"},
				{"text", align="left", width=130, text="Line 1, Column 1"},
			},

			{"hbar", floating=true, originX=.5, anchorX=.5, y=30, background="something", padding=20, homogeneous=true,
				{"button", weight=1, text="[A]", spacing=10},
				{"button", weight=1, text="[BB]"},
				{"button", weight=2, text="[CCCCCCCC]"},
			},
			{"hbar", floating=true, originX=.5, anchorX=.5, y=95, background="warning", padding=20, homogeneous=true,
				{"button", weight=2, text="[A]", spacing=10},
				{"button", weight=1, text="[BB]"},
				{"button", weight=1, text="[CCCCCCCC]"},
			},
		},

		{"vbar", width=60, padding=5, background="warning", canScrollY=true,
			{"button", text="BIG1", relativeHeight=.4},
			{"button", text="BIG2", relativeHeight=.4},
			{"button", text="BIG3", relativeHeight=.4},
		},
	},

	{"hbar", hidden=1==0, originX=.5, originY=.5, anchorX=.5, anchorY=.5, background="something", padding=10, --expandPerpendicular=false,
		{"hbar", --relativeHeight=1,
			{"text", text="Left text goes here."},
		},
		{"vbar", id="myContainer", width=200, height=120, canScrollY=true, homogeneous=true,
			{"text", text="I'm just a\ntwo line text."},
			{"input", value="foo"},
			{"input", value="bar"},
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

	elseif key == "right" then
		gui:navigate(0)
	elseif key == "down" then
		gui:navigate(TAU/4)
	elseif key == "left" then
		gui:navigate(TAU/2)
	elseif key == "up" then
		gui:navigate(-TAU/4)

	elseif key == "tab" then
		if love.keyboard.isDown("lshift","rshift") then
			gui:navigateToPrevious()
		else
			gui:navigateToNext()
		end

	elseif key == "return" or key == "kpenter" then
		gui:ok()

	elseif key == "escape" then
		if not gui:back() then
			love.event.quit()
		end
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



local updateTime = 0.00

function love.update(dt)
	gui.debug  = love.keyboard.isScancodeDown"`"
	updateTime = love.timer.getTime()
	gui:update(dt)
	updateTime = love.timer.getTime() - updateTime
end

local stats     = {}
local formatStr = nil

function love.draw()
	local drawTime = love.timer.getTime()
	gui:draw()
	drawTime = love.timer.getTime() - drawTime

	-- Stats.
	local h = 3*love.graphics.getFont():getHeight()

	if not (love.window.hasMouseFocus() and love.mouse.getY() < h+15) then
		love.graphics.getStats(stats)
		formatStr = formatStr or table.concat({
			"draw: calls=%d batched=%d",
			"memory: lua=%.2fMiB",
			"time: update=%.1fms draw=%.1fms",
		}, "\n")
		local text = string.format(formatStr
			, stats.drawcalls, stats.drawcallsbatched
			, collectgarbage"count"/1024
			, updateTime*1000, drawTime*1000
		)
		love.graphics.setColor(.2, 0, .2, .8)
		love.graphics.rectangle("fill", 0, 0, 220, h)
		love.graphics.setColor(1, 1, 1)
		love.graphics.print(text, 0, 0)
	end
end



function love.resize(w, h)
	gui:getRoot():setDimensions(w, h)
end


