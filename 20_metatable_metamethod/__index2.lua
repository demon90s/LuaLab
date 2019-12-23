-- __index元方法也可以是一个闭包

-- 给表不存在的字段设置默认值
function SetDefault(t, d)
    local mt = {__index = function() return d end}
    setmetatable(t, mt)
end

t = {x = 10, y = 20}
print(t.x, t.z)             --> 10 nil

SetDefault(t, 0)
print(t.x, t.z)             --> 10 0