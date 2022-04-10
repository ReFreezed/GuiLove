--[[============================================================
--=
--=  Simple class library
--=
--==============================================================

	classLib = require("class")

	myClass  = classLib( className, baseTable ) -- Create a new class.
	subClass = myClass:extend( className, baseTable ) -- Create a subclass.

	subClass.super -- Access the parent class.

	instance = myClass(...) -- Create a new instance (which calls myClass:init(...)).
	bool     = instance:is( class ) -- Check if the instance inherits a class.

	instance.class -- Access the instance's class.

--============================================================]]

local setmetatable = setmetatable
local tostring     = tostring
local match        = string.match
local gsub         = string.gsub
local F            = string.format

local classMt = {
	__call = function(class, ...)
		local instance = {--[[ class=class, __id="" ]]} -- The ID is generated when needed.

		setmetatable(instance, class)
		instance:init(...)

		return instance
	end,

	__tostring = function(class)
		return F("class: %s", class.__name)
	end,
}

-- class = newClass( name, classTable )
local function newClass(name, class)
	-- Instances use their class as metatable.
	class.__index = class
	class.__name  = name
	class.class   = class
	return setmetatable(class, classMt)
end

local BaseClass = newClass("Class", {
	__tostring = function(instance)
		if not instance.__id then
			local class = getmetatable(instance)
			setmetatable(instance, nil)

			local id      = tostring(instance)
			instance.__id = match(id, "0x(%x+)") or gsub(id, "^table: ", "")

			setmetatable(instance, class)
		end

		return F("%s: 0x%s", instance.class.__name, instance.__id)
	end,

	-- subClass = class:extend( name, subClassTable )
	extend = function(class, name, subClass)
		-- Subclasses do NOT use superclasses as metatables - we just copy everything over.
		for k, v in pairs(class) do
			if subClass[k] == nil then  subClass[k] = v  end
		end

		subClass.super = class

		return newClass(name, subClass)
	end,

	-- bool = instance:is( class )
	is = function(instance, class)
		local currentClass = instance.class

		-- Look through the whole inheritance.
		while currentClass do
			if currentClass == class then  return true  end
			currentClass = currentClass.super
		end

		return false
	end,

	init = function()end,
})

return function(...)
	return BaseClass:extend(...)
end
