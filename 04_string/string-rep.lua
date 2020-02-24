-- string.rep(s, n) 获得一个字符串, 是s重复n次的结果
local s = string.rep("a", 5)
assert(s == "aaaaa")

-- 获得了一个1MB的字符串
local s = string.rep('a', 2^20)
assert(#s == 2^20)

print("[TEST] string.rep PASS")