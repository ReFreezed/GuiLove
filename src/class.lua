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

local classMt = {
	__call = function(C, ...)
		local instance = {class=C, __id=""}

		local id      = tostring(instance)
		instance.__id = id:match"0x(%x+)" or id:gsub("^table: ", "")

		setmetatable(instance, C)
		instance:init(...)

		return instance
	end,

	__tostring = function(C)
		return ("class(%s)"):format(C.__name)
	end,
}

-- class = newClass( name, classTable )
local function newClass(name, C)
	-- Instances use their class as metatable.
	C.__index = C
	C.__name  = name
	return setmetatable(C, classMt)
end

local BaseClass = newClass("Class", {
	__tostring = function(self)
		return ("%s(%s)"):format(self.class.__name, self.__id)
	end,

	-- subClass = class:extend( name, subClassTable )
	extend = function(C, name, SubC)
		-- Subclasses do NOT use superclasses as metatables - we just copy everything over.
		for k, v in pairs(C) do
			if SubC[k] == nil then  SubC[k] = v  end
		end

		SubC.super = C

		return newClass(name, SubC)
	end,

	-- bool = instance:is( class )
	is = function(obj, C)
		local currentClass = obj.class

		-- Look through the whole inheritance.
		while currentClass do
			if currentClass == C then  return true  end
			currentClass = currentClass.super
		end

		return false
	end,

	init = function()end,
})

return function(...)
	return BaseClass:extend(...)
end
