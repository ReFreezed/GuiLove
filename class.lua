--[[============================================================
--=
--=  Class module v2.1
--=  - Written by Marcus 'ReFreezed' Thunström
--=  - MIT License (See the bottom of this file)
--=
--=  Changelog:
--=  v2.1: Added several functions to the class module object.
--=  v2.0: Renamed define/defineGet/defineSet to def/defget/defset.
--=  v1.0: First release.
--=
--==============================================================

	class = require("class") -- Get the class module.

	myClass = class( className, baseTable ) -- Create a new class.
	subClass = myClass:extend( className, baseTable ) -- Create a subclass.

	subClass.super -- Access the parent class.

	instance = myClass(...) -- Create a new instance (which calls myClass:init() ).
	result = instance:is( class ) -- Check if the instance inherits a class.
	instance = instance:as( class ) -- Get the instance if it inherits a class.

	instance.class -- Access the instance's class.

	-- Shorthands.
	myClass:def("myValue") -- Automatically define simple getter and setter (getMyValue() and setMyValue() ).
	myClass:defget("myReadOnly") -- Define simple getter (instance:getMyReadOnly() returns instance.myReadOnly).
	myClass:defset("myValue") -- Define simple setter (instance:setMyValue() updates instance.myValue).

--============================================================]]



local classes   = setmetatable({}, {__mode='k'})
local instances = setmetatable({}, {__mode='k'})



--==============================================================
--==============================================================
--==============================================================

local newClass
local extend
local def, defget, defset
local is, as



-- class = newClass( name, classTable )
local classMt = {

	__call = function(C, ...)

		local instance = {class=C}
		instances[instance] = tostring(instance):match'0x(%w+)'

		setmetatable(instance, C)

		instance:init(...)

		return instance
	end,

	__tostring = function(C)
		return ('class(%s)'):format(C.__name)
	end,

}
function newClass(name, C)
	if type(name) ~= 'string' then
		error('bad class name type (string expected, got '..type(name)..')', 2)
	end
	if type(C) ~= 'table' then
		error('bad base table type (table expected, got '..type(C)..')', 2)
	end

	classes[C] = tostring(C):match'0x(%w+)'

	-- Instances use their class as metatable.
	C.__index = C
	C.__name = name

	return setmetatable(C, classMt)
end



-- subClass = class:extend( name, subClassTable )
function extend(C, name, SubC)
	if type(name) ~= 'string' then
		error('bad class name type (string expected, got '..type(name)..')', 2)
	end
	if type(SubC) ~= 'table' then
		error('bad base table type (table expected, got '..type(SubC)..')', 2)
	end

	-- Subclasses do NOT use superclasses as metatables - we just copy everything over.
	-- TODO: Confirm if this is actually faster than using a tree of metatables.
	for k, v in pairs(C) do
		if SubC[k] == nil then
			SubC[k] = v
		end
	end

	SubC.super = C

	return newClass(name, SubC)
end



-- class:def( propertyName [, getterFunction, setterFunction ] )
function def(C, k, getter, setter)
	defget(C, k, getter)
	defset(C, k, setter)
end

-- class:defget( propertyName [, getterFunction ] )
function defget(C, k, getter)

	local suffix = k
		:gsub('^_', '') -- Allow the property name to be either '_myProp' or 'myProp'.
		:gsub('^.', string.upper)

	C['get'..suffix] = (getter or function(self)
		return self[k]
	end)

end

-- class:defset( propertyName [, setterFunction ] )
function defset(C, k, setter)

	local suffix = k
		:gsub('^_', '') -- Allow the property name to be either '_myProp' or 'myProp'.
		:gsub('^.', string.upper)

	C['set'..suffix] = (setter or function(self, v)
		self[k] = v
	end)

end



-- result = instance:is( class )
-- result = instance:is( classPath )
-- result = class:is( class )
-- result = class:is( classPath )
function is(obj, C)

	if type(C) == 'string' then
		C = require(C)
	end

	if not classes[C] then
		return false -- No object can "be" a non-class.
	end

	local currentClass = (classes[obj] and obj) or (instances[obj] and obj.class) or (nil)
	if not currentClass then return false end

	-- Look through the whole inheritance.
	repeat
		if currentClass == C then return true end
		currentClass = currentClass.super
	until not currentClass

	return false
end

-- instance = instance:as( class )
-- instance = instance:as( classPath )
function as(instance, C)
	return (is(instance, C) and instance or nil)
end



--==============================================================
--==============================================================
--==============================================================



local BaseClass = newClass('Class', {

	__tostring = function(self)
		return ('%s(%s)'):format(self.class.__name, instances[self])
	end,

	extend = extend,

	def = def,
	defget = defget,
	defset = defset,

	is = is,
	as = as,

	init = function()end,

})



--==============================================================



local class = {

	base = BaseClass,

	def = def,
	defget = defget,
	defset = defset,

	is = is,
	as = as,

}
setmetatable(class, {

	__call = function(t, ...)
		return BaseClass:extend(...)
	end,

})

return class



--==============================================================
--=
--=  MIT License
--=
--=  Copyright © 2017 Marcus 'ReFreezed' Thunström
--=
--=  Permission is hereby granted, free of charge, to any person obtaining a copy
--=  of this software and associated documentation files (the "Software"), to deal
--=  in the Software without restriction, including without limitation the rights
--=  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
--=  copies of the Software, and to permit persons to whom the Software is
--=  furnished to do so, subject to the following conditions:
--=
--=  The above copyright notice and this permission notice shall be included in all
--=  copies or substantial portions of the Software.
--=
--=  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--=  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--=  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--=  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--=  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
--=  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
--=  SOFTWARE.
--=
--==============================================================
