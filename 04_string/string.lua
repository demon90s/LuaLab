-- 不能直接改变字符串的字符，不过可以通过创建一个新的字符串达到此目的
a = "one string"
b = string.gsub(a, "one", "another")
print(a)	--> one string
print(b)	--> another string

-- 多行字符串
page = [[
<html>
<head>
    <title>An HTML Page</title>
</head>
</html>
]]
print(page)

-- 强制类型转换(运行时)

-- 数值 -> 字符串,可以使用 .. 或者 tostring
print(10 .. 20)     --> 1020
print(tostring("10"))   --> 10

-- 字符串 -> 数值, 使用 tonumber 函数
print(tonumber("-3"))   --> -3
print(tonumber("10e4")) --> 100000.0

-- tonumber 默认采取十进制转换,但也可以加入第二个参数,使用任意进制
print(tonumber("1000", 2))  --> 8

-- tonumber 不能转换的时候,返回 nil
print(tonumber("xxx")) --> nil