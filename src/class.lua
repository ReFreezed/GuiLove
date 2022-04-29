--[[============================================================
--=
--=  BarelyOOP - simple, bare bones, optimized class library
--=  - Written by Marcus 'ReFreezed' Thunström
--=  - CC0 License (https://creativecommons.org/publicdomain/zero/1.0/)
--=
--==============================================================

	classLib = require("class")

	myClass  = classLib( className, [ includes, ] baseTable ) -- Create a new class.
	subclass = myClass:extend( className, [ includes, ] baseTable ) -- Create a subclass.

	subclass.super -- Access the parent class.

	instance = myClass(...) -- Create a new instance (which calls myClass.init(instance, ...)).
	bool     = instance:is( class ) -- Check if the instance inherits a class.

	instance.class -- Access the instance's class.

	string = tostring( class|instance )

	Notes:
	- Subclasses are completely detached from their parent (members are copied over when extending).
	- Because of the above, static class members ought to be constant as changes are not propagated to derived classes.
	- Subclasses have to manually call the parent's init function, if that's desired.

----------------------------------------------------------------

	--
	-- Example #1: Base and derived button class.
	--
	local Button = classLib("Button", {
		text     = "Default text.",
		position = nil,
	})
	function Button:init()
		self.position = {x=0, y=0}
	end
	function Button:printText()
		print(self.text)
	end

	local CoolButton = Button:extend("CoolButton", {
		coolness = 0,
	})
	function CoolButton:init(coolness)
		CoolButton.super.init(self)
		self.position.y = 300
		self.coolness   = coolness
	end

	local button1 = Button()
	button1.text  = "Foo!"

	local button2      = Button()
	button2.text       = "Bar?"
	button2.position.x = 80

	local button3 = CoolButton(9001)
	button3:printText()

	--
	-- Example #2: Includes.
	--
	local Text = classLib("Text", {
		text = "",
	})
	function Text:setText(text)
		self.text = text
	end

	local Image = classLib("Image", {
		filePath = "",
	})

	local TextAndImage = classLib("TextAndImage", {Text,Image}, {
		spacing = 5,
	})

	local header = TextAndImage()
	header:setText("Foo!")

--============================================================]]

local setmetatable = setmetatable
local format       = string.format
local dummyTable   = {}
local zeroX        = tostring(dummyTable):match"0x" or "" -- For __tostring(). LuaJIT uses 0x address prefix, PUC-Lua does not.

local classMt = {
	__call = function(class, ...)
		local instance = {--[[ class=class, __id="" ]]} -- The ID is generated when needed in __tostring().
		setmetatable(instance, class)
		instance:init(...)
		return instance
	end,

	__tostring = function(class)
		return format("class(%s): %s%s", class.__name, zeroX, class.__classid)
	end,
}

local function getId(t)
	local id = tostring(t)
	return (zeroX ~= "") and id:match"0x(%x+)" or id:gsub("^table: ", "")
end

local function copyMissingMembers(class, members)
	for k, v in pairs(members) do
		if class[k] == nil then  class[k] = v  end
	end
end

local function newClass(parentClass, name, includes, class)
	if not class then
		includes, class = nil, includes
	end

	class.__index   = class        -- Instances use their class as metatable.
	class.__name    = name         -- For __tostring().
	class.__classid = getId(class) -- For __tostring().
	class.class     = class        -- So instance.class works.
	class.super     = parentClass

	if parentClass then
		copyMissingMembers(class, parentClass) -- Subclasses do NOT use parent classes as metatables - we just copy everything over.
	end
	for _, t in ipairs(includes or dummyTable) do
		copyMissingMembers(class, t)
	end

	return setmetatable(class, classMt)
end

local BaseClass = newClass(nil, "Class", {
	init   = function()end, -- It's safe for any class to call the parent's init().
	extend = newClass,

	is = function(instance, class)
		local currentClass = instance.class

		while currentClass do
			if currentClass == class then  return true  end
			currentClass = currentClass.super
		end

		return false
	end,

	__tostring = function(instance)
		if not instance.__id then
			local setMt = debug and debug.setmetatable or setmetatable
			local class = instance.class
			setMt(instance, nil) -- We prefer debug.setmetatable() over setmetatable() in case class.__metatable is set.
			instance.__id = getId(instance)
			setMt(instance, class)
		end
		return format("%s: %s%s", instance.__name, zeroX, instance.__id)
	end,
})

return setmetatable({_VERSION="0.1.0", base=BaseClass}, {
	__call = function(_M, name, includes, subclass)
		return BaseClass:extend(name, includes, subclass)
	end,
})
