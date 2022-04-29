io.stdout:setvbuf("no")
io.stderr:setvbuf("no")

love.keyboard.setKeyRepeat(true)

local TAU                     = 2*math.pi
local ROOT_PADDING_AND_MARGIN = 5

local Gui = require("Gui")

local showStats = false

local gui
local sliceImage, sliceQuads



function love.load(args)
	io.stdout:setvbuf("no")
	io.stderr:setvbuf("no")

	love.keyboard.setKeyRepeat(true)

	local largeFont = love.graphics.newFont(20)

	gui = Gui()
	gui:setStandardKeysActive(true)
	-- gui:setCullingActive(false)

	gui:defineStyle("_MENU", {
		[1] = {padding=10, background="something"},
	})

	gui:load{"root",
		x       = ROOT_PADDING_AND_MARGIN,
		y       = ROOT_PADDING_AND_MARGIN,
		width   = love.graphics.getWidth () - 2*ROOT_PADDING_AND_MARGIN,
		height  = love.graphics.getHeight() - 2*ROOT_PADDING_AND_MARGIN,
		padding = ROOT_PADDING_AND_MARGIN,

		{"vbar", id="tabs", relativeWidth=1, relativeHeight=1,
			{"hbar", id="tabButtons", spacing=5, homogeneous=true,
				{"button", weight=1, canToggle=true, radio="tabs", text="1. All things!"},
				{"button", weight=1, canToggle=true, radio="tabs", text="2. Scrollables"},
				{"button", weight=1, id="menu", text="MENU"},
			},

			-- Tab: All things!
			----------------------------------------------------------------

			{"hbar", weight=1,
				{"vbar", weight=1,
					-- Homogeneous + max/min size.
					{"vbar", spacing=5,
						{"hbar", homogeneous=true,
							{"text", text="<<"},
							{"button", mnemonics=true, weight=1, text="&File", tooltip="Do da file!", relativeWidth=.5},
							{"button", mnemonics=true, weight=1, text="&Edit", tooltip="Do da edits..."},
							{"button", mnemonics=true, weight=1, text="&Search"},
							{"button", mnemonics=true, weight=1, text="&Debug", maxWidth=120},
							{"button", mnemonics=true, weight=1, text="&Help"},
							{"text", text=">>"},
						},
						{"hbar", homogeneous=true,
							{"text", text="<<"},
							{"button", mnemonics=true, weight=1, text="&File", tooltip="Do da file!", relativeWidth=.5},
							{"button", mnemonics=true, weight=1, text="&Edit", tooltip="Do da edits..."},
							{"button", mnemonics=true, weight=1, text="&Search"},
							{"button", mnemonics=true, weight=1, text="&Debug", minWidth=200},
							{"button", mnemonics=true, weight=1, text="&Help"},
							{"text", text=">>"},
						},
					},

					-- Relative size + homogeneous.
					{"hbar", homogeneous=true,
						{"button", weight=0, text="50%", relativeWidth=.5},
						{"button", weight=1, text="expand1"},
						{"button", weight=1, text="expand2"},
						{"button", weight=1, text="expand3"},
						{"button", weight=1, text="expand4"},
					},

					-- Relative size + homogeneous + thrown in floating.
					{"hbar", homogeneous=true,
						{"button", weight=0, text="50%", relativeWidth=.5},
						{"button", weight=1, text="expand"},
						{"button", weight=0, text="[1]"},
						{"button", weight=0, text="1-FLOAT", floating=true, originX=.75, anchorX=1, y=-5},
						{"button", weight=0, text="FLOAT-2", floating=true, originX=.75, anchorX=0, y=-5},
						{"button", weight=0, text="[2]"},
						{"button", weight=0, text="[3]"},
					},

					-- Some weighted.
					{"hbar",
						{"button", text="[1]"},
						{"button", text="expand", weight=1},
						{"button", text="[2]"},
					},

					-- Padding + relative size + thrown in floating.
					{"hbar", paddingHorizontal=8, paddingTop=4,
						{"button", text="untitled (1).txt"},
						{"container", floating=true, originX=1, anchorX=1, relativeWidth=.25, background="something", padding=5,
							{"button", text="FlOaT RiGhT", originX=.5, anchorX=.5},
						},
						{"button", text="untitled (2).txt"},
					},

					-- Multi-line input and sliders.
					{"hbar", weight=1,
						{"input", weight=1, fieldType="multiwrap", placeholder="~type me maybe~"},

						{"vbar", background="warning",
							{"slider", min=100, max=200, step=10, value=150},
							{"slider", min=100, max=200, step=10, value=150, vertical=true, weight=1},
							{"hbar",
								{"slider", weight=1, vertical=true, continuous=true},
								{"slider", weight=1, vertical=true, continuous=true, continuousSpeed=.2, min=-100, max=100, step=5, value=25},
							},
						},
					},

					-- Size precedence if weighted or not.
					{"vbar", spacing=5,
						{"hbar", height=6, {"button",width=150}, {"button",weight=1} }, -- Ruler.
						{"hbar", height=40, homogeneous=true,
							{"button", width=150, relativeWidth=.5, weight=0, text="150px (or 50%)?"},
							{"button", weight=1, text="Rest..."},
						},
						{"hbar", height=40, homogeneous=true,
							{"button", width=150, relativeWidth=.5, weight=3, text="3/4 (or 150px or 50%)?"},
							{"button", weight=1, text="Rest..."},
						},
						{"hbar", height=6, {"button",weight=1}, {"button",weight=1}, {"button",weight=1}, {"button",weight=1} }, -- Ruler.
					},

					-- Perpendicular size.
					{"vbar", spacing=5,
						{"hbar", homogeneous=true,
							{"button", weight=1, text="L1", height=20},
							{"button", weight=1, text="R1", height=30},
						},
						{"hbar", homogeneous=true, expandPerpendicular=false,
							{"button", weight=1, text="L2", height=20},
							{"button", weight=1, text="R2", height=30},
						},
					},

					-- More max sizes.
					{"vbar", canScrollY=true, height=80, spacing=5, background="warning",
						{"vbar", spacing=5,
							{"hbar", homogeneous=true,
								{"button", weight=0, text="1:10%", relativeWidth=.1},
								{"button", weight=1, text="1:ex"},
								{"button", weight=1, text="1:ex yoooooo"},
								{"button", weight=1, text="1:max", maxWidth=120},
							},
							{"hbar", homogeneous=true,
								{"button", weight=0, text="1:10%", relativeWidth=.1},
								{"button", weight=1, text="1:ex"},
								{"button", weight=1, text="1:max yoooooo", maxWidth=120},
								{"button", weight=1, text="1:max", maxWidth=120},
							},
							{"hbar", homogeneous=true,
								{"button", weight=0, text="1:10%", relativeWidth=.1},
								{"button", weight=1, text="1:max", maxWidth=120},
								{"button", weight=1, text="1:max yoooooo", maxWidth=120},
								{"button", weight=1, text="1:max", maxWidth=120},
							},
						},
						{"vbar", spacing=5,
							{"hbar", homogeneous=false,
								{"button", weight=0, text="2:10%", relativeWidth=.1},
								{"button", weight=1, text="2:ex"},
								{"button", weight=1, text="2:ex yoooooo"},
								{"button", weight=1, text="2:max", maxWidth=120},
							},
							{"hbar", homogeneous=false,
								{"button", weight=0, text="2:10%", relativeWidth=.1},
								{"button", weight=1, text="2:ex"},
								{"button", weight=1, text="2:max yoooooo", maxWidth=120},
								{"button", weight=1, text="2:max", maxWidth=120},
							},
							{"hbar", homogeneous=false,
								{"button", weight=0, text="2:10%", relativeWidth=.1},
								{"button", weight=1, text="2:max", maxWidth=120},
								{"button", weight=1, text="2:max yoooooo", maxWidth=120},
								{"button", weight=1, text="2:max", maxWidth=120},
							},
						},
						{"vbar", spacing=5,
							{"hbar", homogeneous=true,
								{"button", weight=0, text="3:10%", relativeWidth=.1},
								{"button", weight=1, text="3:ex"},
								{"button", weight=1, text="3:ex yoooooo"},
								{"button", weight=1, text="3:min", minWidth=250},
							},
							{"hbar", homogeneous=true,
								{"button", weight=0, text="3:10%", relativeWidth=.1},
								{"button", weight=1, text="3:ex"},
								{"button", weight=1, text="3:min yoooooo", minWidth=250},
								{"button", weight=1, text="3:min", minWidth=250},
							},
							{"hbar", homogeneous=true,
								{"button", weight=0, text="3:10%", relativeWidth=.1},
								{"button", weight=1, text="3:min", minWidth=250},
								{"button", weight=1, text="3:min yoooooo", minWidth=250},
								{"button", weight=1, text="3:min", minWidth=250},
							}, -- This one should extend beyond the parent's child area if the window is small as there isn't enough space.
						},
						{"vbar", spacing=5,
							{"hbar", homogeneous=false,
								{"button", weight=0, text="4:10%", relativeWidth=.1},
								{"button", weight=1, text="4:ex"},
								{"button", weight=1, text="4:ex yoooooo"},
								{"button", weight=1, text="4:min", minWidth=250},
							},
							{"hbar", homogeneous=false,
								{"button", weight=0, text="4:10%", relativeWidth=.1},
								{"button", weight=1, text="4:ex"},
								{"button", weight=1, text="4:min yoooooo", minWidth=250},
								{"button", weight=1, text="4:min", minWidth=250},
							},
							{"hbar", homogeneous=false,
								{"button", weight=0, text="4:10%", relativeWidth=.1},
								{"button", weight=1, text="4:min", minWidth=250},
								{"button", weight=1, text="4:min yoooooo", minWidth=250},
								{"button", weight=1, text="4:min", minWidth=250},
							}, -- This one should extend beyond the parent's child area if the window is small as there isn't enough space.
						},
					},

					-- Just a normal thing...
					{"hbar",
						{"text", align="left", weight=1,  text="Foo bar"},
						{"text", align="left", width=50,  text="INS"},
						{"text", align="left", width=130, text="Line 1, Column 1"},
					},

					-- Homogeneous + floating.
					{"hbar", floating=true, originX=.5, anchorX=.5, y=30, background="something", padding=20, homogeneous=true,
						{"button", weight=1, canToggle=true, radio="floaters", font=largeFont, text="[A]", spacing=10},
						{"button", weight=1, canToggle=true, radio="floaters", font=largeFont, text="[BB]"},
						{"button", weight=2, canToggle=true, radio="floaters", font=largeFont, text="[CCCCCCCC]"},
					},
					{"hbar", floating=true, originX=.5, anchorX=.5, y=105, background="warning", padding=20, homogeneous=true,
						{"button", weight=2, canToggle=true, radio="floaters", font=Gui.getDefaultFont(), text="[A]", spacing=10},
						{"button", weight=1, canToggle=true, radio="floaters", font=Gui.getDefaultFont(), text="[BB]"},
						{"button", weight=1, canToggle=true, radio="floaters", font=Gui.getDefaultFont(), text="[CCCCCCCC]"},
					},
				},

				-- Scrolling galore in small container.
				{"vbar", width=60, padding=5, background="warning", canScrollY=true,
					{"vbar", canScrollX=true,
						{"text", text="too long text", align="left"},
						{"text", text="a"},
						{"input", value="Moo moo moooo!"},
					},
					{"vbar", canScrollX=true,
						{"text", text="b"},
					},
					{"vbar", canScrollX=true, canScrollY=true, height=31,
						{"input", width=50, height=70, fieldType="multinowrap",
							value="one and one\ntwo and two\nthree and three\nfour and four\nfive and five\nsix and six\nseven and seven\neight and eight\nnine and nine"
						},
					},

					-- Relative size in scrolling container.
					{"button", text="BIG1", relativeHeight=.4},
					{"button", text="BIG2", relativeHeight=.4},
					{"button", text="BIG3", relativeHeight=.4},
				},
			},

			-- Tab: Scrollables.
			----------------------------------------------------------------

			{"hbar",
				{"vbar", canScrollX=true, canScrollY=true, width=100, height=100, padding=20,
					{"hbar", spacing=60,
						{"button", text="E", width=50, height=50, spacing=60},
					},
				},
				{"vbar", canScrollX=true, canScrollY=true, width=100, height=100, padding=20,
					{"hbar", spacing=60,
						{"button", text="A", width=50, height=50, spacing=60},
						{"button", text="B", width=50, height=50, spacing=60},
					},
					{"hbar", spacing=60,
						{"button", text="C", width=50, height=50, spacing=60},
						{"button", text="D", width=50, height=50, spacing=60},
					},
				},
			},

			----------------------------------------------------------------
		},

		-- Dialog.
		{"hbar", originX=.5, originY=.5, anchorX=.5, anchorY=.5, background="something", padding=10,
			{"hbar",
				{"text", text="Left text goes here."},
			},
			{"vbar", id="myContainer", width=200, height=120, canScrollY=true, homogeneous=true,
				{"text", text="I'm just a\ntwo line text."},
				{"input", value="foo"},
				{"input", value="bar"},
				{"button", id="addText", text="Press Me!"},
			},
		},
	}

	for i, button in ipairs(gui:find("tabButtons")) do
		if button:isRadio() then
			button:on("toggleon", function(button, event)
				local tabs = gui:find("tabs")
				for j = 2, #tabs do
					tabs[j]:setVisible(j-1 == i)
				end
			end)
		end
	end
	gui:find("tabButtons")[2]:press()

	gui:find("menu"):on("press", function(button, event)
		local menuY           = 0
		local items           = {}
		local iSetFontDefault = #items+1 ; table.insert(items, "Set font: default")
		local iSetFontLarge   = #items+1 ; table.insert(items, "Set font: large")

		-- menuY = 50
		-- for i = 1, 100 do
		-- 	table.insert(items, "Set font: large")
		-- end

		button:showMenu(items, 0, menuY, function(i)
			if i == iSetFontDefault then
				gui:setFont(Gui.getDefaultFont())
			elseif i == iSetFontLarge then
				gui:setFont(largeFont)
			end
		end)
	end)

	local pressCount = 0

	gui:find("addText"):on("press", function(button, event)
		pressCount = pressCount + 1

		local myContainer = gui:find("myContainer")
		local text        = "Pressed button " .. pressCount .. " " .. (pressCount == 1 and "time" or "times") .. "!"
		myContainer:insert{ "text", text=text }
	end)

	gui:setSoundPlayer(function(source)
		local PITCH_VARIATION = .06
		local pitch           = 1 + PITCH_VARIATION * Gui.lerp(-.5, .5, math.random())
		source                = source:clone()
		source:setPitch(pitch*source:getPitch())
		source:play()
	end)

	local function newSound(filename, vol, pitch)
		local source = love.audio.newSource("sounds/"..filename, "static")
		source:setVolume(vol^2)
		source:setPitch(pitch)
		return source
	end

	gui:setDefaultSound("close"      , newSound("close.ogg"      , 1.00, 1.0))
	gui:setDefaultSound("focus"      , newSound("focus.ogg"      , 1.00, 1.0))
	gui:setDefaultSound("type"       , newSound("type.ogg"       , 1.00, 1.0))
	gui:setDefaultSound("press"      , newSound("press.ogg"      , 1.00, 1.0))
	gui:setDefaultSound("toggle"     , newSound("toggle.ogg"     , 0.90, 1.0))
	gui:setDefaultSound("navigate"   , newSound("navigate.ogg"   , 0.70, 1.0))
	gui:setDefaultSound("scroll"     , newSound("scroll.ogg"     , 0.50, 1.0))
	gui:setDefaultSound("buttondown" , newSound("buttondown.ogg" , 0.70, 1.0))
	gui:setDefaultSound("inputsubmit", newSound("inputsubmit.ogg", 1.00, 1.0))
	gui:setDefaultSound("inputrevert", newSound("inputrevert.ogg", 0.80, 1.0))
	gui:setDefaultSound("slidermove" , newSound("type.ogg"       , 0.85, 2.0)) -- @Incomplete: Unique sound.

	sliceImage = Gui.newMonochromeImage{
		"   ff    ff   ",
		"  f  f  f  f  ",
		" f    ff    f ",
		"f            f",
		"f            f",
		" f   7777   f ",
		"  f  7777  f  ",
		"  f  7777  f  ",
		" f   7777   f ",
		"f            f",
		"f            f",
		" f    ff    f ",
		"  f  f  f  f  ",
		"   ff    ff   ",
	}
	sliceImage:setFilter("nearest", "nearest")
	sliceQuads = Gui.create9SliceQuads(sliceImage, 4, 4)
end



function love.keypressed(key, scancode, isRepeat)
	if scancode == "`" then
		if isRepeat then  return  end
		gui.debug = not gui.debug

	elseif key == "f1" then
		if isRepeat then  return  end
		showStats = not showStats

	elseif gui:keypressed(key, scancode, isRepeat) then
		-- void

	elseif key == "escape" then
		if isRepeat then  return  end
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
	if not gui:mousepressed(mx, my, mbutton, pressCount) then
		print("Pressed nothing at ["..mx..","..my.."]")
	end
end

function love.mousemoved(mx, my, dx, dy, isTouch)
	gui:mousemoved(mx, my, dx, dy)
end

function love.mousereleased(mx, my, mbutton, isTouch, pressCount)
	gui:mousereleased(mx, my, mbutton, pressCount)
end

function love.wheelmoved(dx, dy)
	gui:wheelmoved(dx, dy)
end



local updateTime = 0.00

function love.update(dt)
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

	love.graphics.setColor(0, 1, 0, .4)
	Gui.draw9SliceScaled  (30,250, 47,47, sliceImage, unpack(sliceQuads))
	Gui.draw9SliceRepeated(90,250, 47,47, sliceImage, unpack(sliceQuads))

	-- Stats.
	if showStats then
		love.graphics.getStats(stats)

		formatStr = formatStr or table.concat({
			"draw: calls=%d batched=%d",
			"memory: lua=%.2fMiB",
			"time: layout=%.2f update=%.1fms draw=%.1fms",
		}, "\n")
		local text = string.format(formatStr
			, stats.drawcalls, stats.drawcallsbatched
			, collectgarbage"count"/1024
			, gui:getLayoutUpdateTime(), updateTime*1000, drawTime*1000
		)

		love.graphics.setColor(.2, 0, .2, .8)
		love.graphics.rectangle("fill", 0, 0, 300, 3*love.graphics.getFont():getHeight())
		love.graphics.setColor(1, 1, 1)
		love.graphics.print(text, 0, 0)
	end
end



function love.resize(w, h)
	gui:getRoot():setDimensions(w-2*ROOT_PADDING_AND_MARGIN, h-2*ROOT_PADDING_AND_MARGIN)
end

function love.errorhandler(err)
	io.stderr:write(debug.traceback(tostring(err), 2), "\n")
end


