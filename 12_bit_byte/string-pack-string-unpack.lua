--[[
    string.pack(fmt, ...) 把值打包为二进制字符串

    string.unpack(fmt, str, pos) 从字符串中提取值, 接受第三个参数, 表示从哪里开始

    函数的第一个参数都是格式串, 可以有:

    b       char
    h       short
    i       int
    l       long
    j       Lua中的整数
    in      n个字节的整数

    z       \0 结束的字符串
    cn      字节数为n的字符串
    s       字符串, 会用一个 size_t 类型的数据保存其长度
    sn      使用n个字节存储字符串长度

    大写字母表示无符号的格式, 比如 B 代表 unsigned char
--]]

-- string.pack 的第一个参数是格式化字符串, 后面跟对应要打包的参数
-- 返回打包好的字符串
s = string.pack("iii", 3, -27, 42)      -- 打包3个整数

-- string.unpack 第一个参数是格式化字符串, 后面是欲解包的字符串
-- 返回解包的参数, 最后还有一个解包到的位置
print(string.unpack("iii", s))          -- 解包3个整数 --> 3 -27 42 13
print(string.unpack("iii", s))          -- 解包不会改变s, 重复解包3个整数 --> 3 -27 42 13

print "--------------------------------end this test"

-- z 代表以 \0 结束的字符串
s = "hello\0Lua\0world\0"
local i = 1
while i < #s do
    local res
    res, i = string.unpack("z", s, i)
    print(res)
end

print "--------------------------------end this test"

-- s1 表示把字符串长度保存在一个字节中
s = string.pack("s1", "hello")
for i = 1, #s do
    print(string.unpack("b", s, i))
end