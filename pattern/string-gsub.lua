-- string.gsub 参数：目标字符串，模式字符串，替换字符串
-- 返回替换后的结果
local s = string.gsub("lua is cute", "cute", "greate")
assert(s == "lua is greate")

-- string.gsub 还会返回第二个结果，表示发生替换的次数
-- 查询元音的数量
local text = "I am a programmer."
_, nvow = string.gsub(text, "[AEIOUaeiou]", "")
assert(nvow == 6)

-- 甚至还可以有第四个参数，表示替换的次数
s = string.gsub("OK OK OK", "OK", "WOW", 1)
assert(s == "WOW OK OK")

-- gsub使用模式
-- %A代码所有非字母的字符
s = string.gsub("Hello, World!", "%A", ".")
assert(s == "Hello..World.")

print("[TEST] string.gsub PASS")