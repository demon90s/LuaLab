-- string.format 格式化字符串
local s = string.format("x=%d, y=%.2f", 10, 3.14)
assert(s == "x=10, y=3.14")

print("[TEST] string.format PASS")