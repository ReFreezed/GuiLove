--
-- GuiLove build script
--
-- Run like this:
-- $ lua build/build.lua
--
local DEV = 1==0

local pp = require"build.preprocess"

pp.metaEnvironment.DEV = DEV

pp.processFile{
	pathIn   = "src/gui.lua2p",
	pathOut  = "Gui.lua",
	pathMeta = "Gui.meta.lua",

	debug           = false,--DEV,
	addLineNumbers  = false,--DEV and 1==0,

	backtickStrings = true,
	canOutputNil    = false,

	onInsert = function(name)
		local lua = pp.getFileContents(name, true)
		lua       = "\n"..lua.."\n" -- Put the content on their own lines.
		lua       = lua:gsub("[^\n]+", "\t%0") -- Add indentation.
		return lua
	end,

	onAfterMeta = function(lua)
		return (lua
			:gsub("[ \t]+\n",    "\n"      ) -- No trailing whitespace on lines.
			:gsub("\n\n\n\n\n+", "\n\n\n\n") -- Limit empty lines.
		)
	end,

	onError = function(err)
		os.exit(1)
	end,
}
