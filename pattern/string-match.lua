-- string.match(str, pattern)
-- 在　str 中查询到匹配　pattern 的子串（第一个），返回它，找不到返回 nil

local s = string.match("hello world", "hello")
assert(s == "hello")

s = string.match("hello world", "hi")
assert(s == nil)

local text = "Deadline is 30/05/1999, from"
s = string.match(text, "%d%d/%d%d/%d%d%d%d")
assert(s == "30/05/1999")

-- 查询一个数字序列
s = string.match("the number 1298 is even", "%d+")
assert(s == "1298")

print("[TEST] string.match PASS")