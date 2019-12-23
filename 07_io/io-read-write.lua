-- io.read 从标准输入读

-- io.read() 从标准输入读取一行, 丢弃换行符
-- local line = io.read()
-- print(line)

--[[
    io.read(method) 按照不同的方式读取, method 可以是:
    - "a" 读取整个文件, 如果当前读取位置是文件尾, 返回空字符串
    - "l" 读取下一行, 丢弃换行符, 也是默认的, 和 io.lines 一样
    - "L" 读取下一行, 保留换行符
    - "n" 读取一个数值, 忽略后续的空格后, 读不了就返回 nil
    - num 以字符串读取 num 个字符, 到了文件尾返回 nil . io.read(0) 可以测试文件尾, 如果有数据读, 返回空字符串, 否则返回 nil
--]]
-- local t = io.read("a")
-- t = string.gsub(t, "bad", "good")
-- print(t)

--print("------------------------------------------end this test")

-- read block
-- while true do
--     local block = io.read(2^10 * 8)     -- block 8KB
--     if not block then break end
--     io.write(block)
-- end

-- print("------------------------------------------end this test")

-- io.read 支持多个参数, 函数根据每个参数返回相应的结果
local n1, n2, n3 = io.read("n", "n", "n")
print(n1, n2, n3)

-- print("------------------------------------------end this test")

-- io.write 向标准输入写, 支持多个参数
io.write(1, 2, 3, '\n')      --> 123\n