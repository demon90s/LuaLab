-- string.gmatch 返回一个函数，通过它可以遍历字符串中匹配到模式的子串

local s = "hello world"
local words = {}

for w in string.gmatch(s, "%a+") do
    words[#words + 1] = w
end

assert(words[1] == "hello" and words[2] == "world")

print("[TEST] string.gmatch PASS")