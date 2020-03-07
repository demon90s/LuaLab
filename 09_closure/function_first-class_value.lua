-- Lua 中, 函数是第一类值, 可以像普通变量一样使用

a = {p = print}     -- a.p 指向 print 函数
a.p("Hello")        --> Hello

-- 地址是一样的
assert(a.p == print)

-- 函数构造器 function(x) body end
local func = function() print("function called") end
assert(type(func) == "function")

print("[TEST] PASS")