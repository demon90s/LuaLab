-- lua 使用原型来表达类的概念

local PersonProto = {name = "anonymous"}

local mt = {__index = PersonProto}

function PersonProto.new(o)
    o = o or {}
    setmetatable(o, mt)
    return o
end

-- test below

local p1 = PersonProto.new {name = "liudiwen"}
local p2 = PersonProto.new()

print(p1.name)          --> liudiwen
print(p2.name)          --> anonymous