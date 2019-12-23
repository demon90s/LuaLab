-- 程序只能操作指向表的引用, 当一个表的引用没有的时候, Lua 就回收它

a = {}          --> 创建一个表, 然后用其引用赋值
a["k"] = 10     --> 新元素, key 是 "k" , 值是10
a[5] = "xxx"    --> 新元素, key 是5, 值是 "xxx"
print(a["k"])   --> 10
print(a[5])     --> xxx
a["k"] = "great"    --> 修改元素的值
print(a["k"])   --> greate

b = a
print(b["k"])   --> greate
b = nil         --> 减少一个表的引用

-- 把表当做结构体
a = {}
a.x = 10        --> 等价于 a["x"] = 10
print(a.x)      --> 10
print(a.y)      --> nil

-- 构造器
-- array like (key是下标，从1开始)
days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}
print(days[2])  --> Monday

-- record like
a = {x = 10, y = 20}
print(a.x)      --> 10

-- 通用的构造器
foo = {["key"] = "value", [1] = 100, [2] = 42, [-1] = 88}
print(foo.key)  --> value
print(foo[1])   --> 100
print(foo[-1])  --> 88