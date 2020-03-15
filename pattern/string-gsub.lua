-- string.gsub 参数：目标字符串，模式字符串，替换字符串
-- 返回替换后的结果
local s = string.gsub("lua is cute", "cute", "greate")
assert(s == "lua is greate")

-- string.gsub 还会返回第二个结果，表示发生替换的次数
-- 查询元音的数量
local text = "I am a programmer."
_, nvow = string.gsub(text, "[AEIOUaeiou]", "")
assert(nvow == 6)

print("[TEST] string.gsub PASS")