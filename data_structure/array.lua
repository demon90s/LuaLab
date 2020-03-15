--[[
    用表实现数组
    长度不固定
    习惯用1作为起始下标
]]

local a = {}
for i = 1,100 do
    a[i] = 0
end

-- 获得数组的长度
print(#a)

-- 通过表构造器构造数组
array = {6,5,4,3,2,1}
for i = 1,#array do
    print(array[i])
end