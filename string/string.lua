-- 不能直接改变字符串的字符，不过可以通过创建一个新的字符串达到此目的
local a = "one string"
local b = string.gsub(a, "one", "another")
assert(a == "one string")
assert(b == "another string")

-- 多行字符串
page = [[
<html>
<head>
    <title>An HTML Page</title>
</head>
</html>
]]
print(page)

-- 为了避免文本中有]]，可以在[[之间加上若干个=
page = [===[
<html>
<head>
    <title>[[hello]]</title>
</head>
</html>
]===]
print(page)

-- 强制类型转换(运行时)

-- 数值 -> 字符串,可以使用 .. 或者 tostring
local s = 10 .. 20
assert(s == "1020")
assert(tostring(10) == "10")

-- utf8转义字符 \u{xxx}
s = "\u{3b1}"
print(s) --> α

-- 长字符串，\z表示忽略掉空白，直到遇到一个非空白字符
s = "hello\z
     world"
assert(s == "helloworld")

print("[TEST] string PASS")