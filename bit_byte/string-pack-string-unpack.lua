--[[
    string.pack(fmt, ...) 把值打包为二进制字符串

    string.unpack(fmt, str, pos) 从字符串中提取值, 接受第三个参数, 表示从哪里开始

    函数的第一个参数都是格式串, 可以有:

    b       char
    h       short
    i       int
    l       long
    j       Lua中的整数
    in      n个字节的整数，溢出会报错

    f       单精度浮点
    d       双精度浮点

    z       \0 结束的字符串
    cn      字节数为n的字符串
    s       字符串, 会用一个 size_t 类型的数据保存其长度
    sn      使用n个字节存储字符串长度

    大写字母表示无符号的格式, 比如 B 代表 unsigned char
--]]

-- string.pack 的第一个参数是格式化字符串, 后面跟对应要打包的参数
-- 返回打包好的字符串
s = string.pack("iii", 3, -27, 42)      -- 打包3个整数

-- 3 * 4 = 12个字节
assert(#s == 12)

-- 溢出，会报错
local ok, err = pcall(function() string.pack("i1", 1000) end)
assert(not ok)
print(string.format("[ERROR OVERFLOW]: %s", err))

-- string.unpack 第一个参数是格式化字符串, 后面是欲解包的字符串
-- 返回解包的参数, 最后还有一个解包到的位置
local i1, i2, i3 = string.unpack("iii", s)          -- 解包3个整数 --> 3 -27 42 13
assert(i1 == 3)
assert(i2 == -27)
assert(i3 == 42)

i1, i2, i3 = string.unpack("iii", s)          -- 解包不会改变s, 重复解包3个整数 --> 3 -27 42 13
assert(i1 == 3)
assert(i2 == -27)
assert(i3 == 42)

-- z 代表以 \0 结束的字符串，unpack第三个参数表示从哪个位置读取
s = "hello\0Lua\0world\0"
local i = 1
local res
while i < #s do
    res, i = string.unpack("z", s, i)
end
assert(res == "world")

-- s1 表示把字符串长度保存在一个字节中
s = string.pack("s1", "hello")
local len = string.unpack("b", s)
assert(len == 5)

print("[TEST] string.pack string.unpack PASS")