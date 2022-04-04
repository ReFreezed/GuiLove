--[[============================================================
--=
--=  GuiLove build script
--=
--=  Run like this:
--=  $ lua build/build.lua
--=
--============================================================]]

local DEV = 1==0

--
-- Build library.
--

local pp = require"build.preprocess"

pp.metaEnvironment.DEV = DEV

local statics     = {}
local staticCount = 0

-- @@STATIC( code )
-- reference = @@STATIC{ ... }
function pp.metaEnvironment.STATIC(lua)
	if lua:find"^{" then
		staticCount      = staticCount + 1
		local staticName = "__STATIC" .. staticCount
		lua              = string.format("local %s = %s", staticName, lua)
		table.insert(statics, lua)
		return staticName
	else
		table.insert(statics, lua)
	end
end

local function map(arr, cb)
	local out = {}
	for i = 1, #arr do
		out[i] = cb(arr[i])
	end
	return out
end

local lambdaCount = 0

-- call = @@LAMBDA( captureByCopy1, ..., function()end )
function pp.metaEnvironment.LAMBDA(...)
	local captureCount = select("#", ...) - 1
	assert(captureCount > 0)

	local captures = {}

	for i = 1, captureCount do
		captures[i] = select(i, ...)
	end

	lambdaCount      = lambdaCount + 1
	local lambdaName = "__LAMBDA" .. lambdaCount

	local indent = pp.getOutputSoFarOnLine():match"^\t*"
	local func   = select(captureCount+1, ...):gsub("\n"..indent, "\n")

	local decl = string.format("local %s = (function() local %s ; local __func = %s ; return function(%s) %s = %s ; return __func end end)()",
		lambdaName,
		table.concat(captures, ", "),
		func,
		table.concat(map(captures, function(capture)  return "__"..capture  end), ", "),
		table.concat(captures, ", "),
		table.concat(map(captures, function(capture)  return "__"..capture  end), ", "),
	nil)

	local call = string.format("%s(%s)", lambdaName, table.concat(captures, ", "))

	pp.metaEnvironment.STATIC(decl)
	return call
end

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
			:gsub("%-%-{STATICS}", function()
				return table.concat(statics, "\n")
			end, 1)
			:gsub("[ \t]+\n",    "\n"      ) -- No trailing whitespace on lines.
			:gsub("\n\n\n\n\n+", "\n\n\n\n") -- Limit empty lines.
		)
	end,

	onError = function(err)
		os.exit(1)
	end,
}

--
-- Write default theme file.
--

local header = [=[
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
]=]

local lua       = assert(pp.getFileContents("src/defaultTheme.luapart", true))
local file, err = assert(io.open("defaultTheme.lua", "w"))

file:write(header)
file:write(lua)
file:close()
