-- 使用函数 type 可获取一个值对应的类型名称
-- type 的返回值是一个 string

print(type(nil))       --> nil
print(type(true))      --> boolean
print(type(10.4 * 3))  --> number
print(type("Hello"))   --> string
print(type(io.stdin))  --> userdata
print(type(print))     --> function
print(type({}))        --> table
print(type(type(X)))   --> string