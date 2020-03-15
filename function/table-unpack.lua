-- table.unpack 的参数是一个数组, 返回值是数组中的所有元素

print(table.unpack {1, 2, 3})       --> 1   2   3
a, b = table.unpack {1, 2, 3}       --> a = 1, b = 2, 3被丢弃
print(a, b)                         -->> 1   2

-- unpack 可以指定一个范围
print(table.unpack({"Sun", "Mon", "Tue", "Wed"}, 2, 3))     --> Mon Tue