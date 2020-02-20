-- __index元方法
-- 当访问一个表中不存在的字段时，会去找元表的__index方法，如果存在，用它来提供结果.

local mt = {}
local win_prototype = {x = 0, y = 0, width = 100, height = 100}

function win_new(o)
    setmetatable(o, mt)
    return o
end

mt.__index = win_prototype

-- test below
local w = win_new({x = 10, y = 20})
print(w.width, w.height)    --> 100, 100 (w不存在width字段,但其元表存在__index,就从__index绑定的表去查width字段)

local w2 = win_new({})
w2.width = 200
w2.height = 200

print(w2.width, w2.height)  --> 200, 200
print(w.width, w.height)    --> 100, 100 元表是独立的
