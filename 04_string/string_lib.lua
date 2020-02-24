-- Lua 解释器处理字符串的能力十分有限, 对于字符串的处理的完整能力来自于 string 标准库

local str = "Hello"

-- string.reverse(str) 得到字符串翻转后的副本
print(string.reverse(str))      --> olleH

-- string.lower(s) 返回 s 的副本, 其中所有大写字母变成小写
print(string.lower(str))        --> hello

-- string.upper(s) 返回 s 的副本, 其中所有小写字符变成大写
print(string.upper(str))        --> HELLO

-- string.sub(s, i, j) 从s中提取子串, 范围是[i,j], 字符串的下标从1开始, 
-- 如果是负数下标, 那么 -1 是最后一个字符, -2 是倒数第二个, 依次类推
print(string.sub("Nihaoya", 3, 5))      --> hao
print(string.sub("Nihaoya", 3, -1))     --> haoya

-- string.char 把数字转换成一个字符串, 可以有一个或多个参数, 它们会连接在一起组成字符串
print(string.char(97))          --> a
print(string.char(97, 98, 99))  --> abc

-- string.byte(s, pos) 返回字符串s中的第pos位置上的字符的数值表示, pos 忽略则为1
-- string.byte(s, i, j) 返回字符串s中[i,j]所有字符的数值表示
print(string.byte("abc"))       --> 97
print(string.byte("abc", 2))    --> 98
print(string.byte("abc", 1, -1))--> print(97, 98, 99) --> 97 98 99

-- string.format 格式化字符串
print(string.format("x=%d, y=%.2f", 10, 3.14))    --> x=10, y=3.14

-- string.find 查找子串, 返回其开始位置和结束位置, 找不到返回 nil
print(string.find("hello world", "orl"))    --> 8 10
print(string.find("hello world", "orx"))    --> nil

-- string.gsub 把所有匹配的模式用另一个字符串替换, 第二个返回参数是替换的次数
print(string.gsub("hello world", "l", ".")) --> he..o wor.d     3