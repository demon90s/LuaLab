-- __newindex 元方法在**更新**(赋值)一个表中不存在的字段时被调用

-- 把表设置成只读的
function readyOnly(t)
    local proxy = {}
    local mt = {
        __index = t,
        __newindex = function() error("cannot modify read-only table") end
    }
    setmetatable(proxy, mt)
    return proxy
end

local week = readyOnly {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}

print(week[2])      --> Monday
week[2] = "Mon"     --> error
print(week[2])