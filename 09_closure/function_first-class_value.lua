-- Lua 中, 函数是第一类值, 可以像普通变量一样使用

a = {p = print}     -- a.p 指向 print 函数
a.p("Hello")        --> Hello

-- 打印出地址, 是一样的
print(a.p)
print(print)

-- 函数构造器 function(x) body end
local func = function() print("function called") end
func()