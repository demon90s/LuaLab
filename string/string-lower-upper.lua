local str = "Hello"

-- string.lower(s) 返回 s 的副本, 其中所有大写字母变成小写
assert(string.lower(str) == "hello")

-- string.upper(s) 返回 s 的副本, 其中所有小写字符变成大写
assert(string.upper(str) == "HELLO")

print("[TEST] string.lower string.upper PASS")