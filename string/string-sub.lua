-- string.sub(s, i, j) 从s中提取子串, 范围是[i,j], 字符串的下标从1开始, 
-- 如果是负数下标, 那么 -1 是最后一个字符, -2 是倒数第二个, 依次类推
local s = string.sub("Nihaoya", 3, 5)
assert(s == "hao")

s = string.sub("Nihaoya", 3, -1)
assert(s == "haoya")

-- 最后一个参数默认是-1
s = string.sub("Nihaoya", 2)
assert(s == "ihaoya")

print("[TEST] string.sub PASS")
