local s = "hello [world]"

-- string.find 返回两个结果，如果找到，就是搜索子串的起始位置和结束位置
-- 否则返回 nil
local i, j = string.find(s, "hello")

assert(1 == 1 and j == 5)

-- string.find 可以有四个参数，第三个表示搜索的起始位置，第四个表示是否使用平凡搜索
-- 如果不是平凡搜索，那么可能会在遇到遇到模式字符的时候报错
local ok, err_msg = pcall(function () string.find(s, "[world") end)

assert(ok == false)
print(err_msg)

i, j = string.find(s, "[world", 1, true)
assert(i == 7 and j == 12)

i = string.find(s, "lll")
assert(i == nil)

print("[TEST] string.find PASS")