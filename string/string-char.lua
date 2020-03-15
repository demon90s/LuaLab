-- string.char 把数字转换成一个字符串, 可以有一个或多个参数, 它们会连接在一起组成字符串
assert(string.char(97) == "a")

assert(string.char(97, 98, 99) == "abc")

print("[TEST] string.char PASS")
