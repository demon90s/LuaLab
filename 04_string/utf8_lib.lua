-- Lua5.3 引入了用于操作 utf8 编码的标准库, 名字就叫做 utf8

-- utf8.len(s) 返回字符串中 UTF-8 字符(也叫代码点)的个数
-- 该函数还会验证字符串, 如果该函数发现字符串中包含无效的字节序列, 则返回 false 和一个无效字节位置
print(utf8.len("你好呀"))    --> 3
print(utf8.len("abc"))      --> 3
print(utf8.len("ab\x93"))   --> nil 3

-- utf8.codepoint 和 string.byte 一样, 都是把字符串转换成对应的数字
-- 注意, 由于后面位置参数是字节的意思, 需要用 utf.offset 得到第几个字符所处的正确的字节
local str = "你好呀"
print(utf8.codepoint(str, utf8.offset(str, 2)))        --> 22909
-- 解释: offset 获得 str 中第二个 utf8 字符的字节位置, 然后 codepoint 获得此位置对应的数字 

-- utf8.char 和 string.char 一样, 都是把数字转换成字符串
print(utf8.char(22909))     --> 好

-- utf8.codes(str) 可以用于遍历 str 的每一个字符的数字表示
for i, v in utf8.codes("你好呀") do
    print(i, v)     --> i 是字节位置 v 是代码点的数字值
end