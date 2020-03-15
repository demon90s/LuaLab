-- string.len(s) 获取字符串的长度, 等价于 #s

local l = string.len("hello")
assert(l == 5)

l = #"hello"
assert(l == 5)

-- 非ASC字符，可能一个字符的长度要大于1
l = #"你"
assert(l > 1)   --> 实际上测试可能等于3

l2 = string.len("你")
assert(l == l2) -- 等价

print("[TEST] string.len PASS")
