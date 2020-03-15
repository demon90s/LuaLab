-- table.unpack 的参数是一个数组, 返回值是数组中的所有元素

a, b = table.unpack {1, 2, 3}       --> a = 1, b = 2, 3被丢弃
assert(a == 1)
assert(b == 2)

-- unpack 可以指定一个范围
a, b = table.unpack({"Sun", "Mon", "Tue", "Wed"}, 2, 3)
assert(a == "Mon")
assert(b == "Tue")

print("[TEST] table.unpack PASS")