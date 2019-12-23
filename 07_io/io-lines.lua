-- io.lines() 对文件的行进行迭代, 每一次迭代获取到下一行, 不包含最后的换行符
function test1()
    -- 以下是对文件的行进行排序的例子
    local lines = {}

    -- 将所有行读取到表 lines 中
    for line in io.lines() do
        lines[#lines + 1] = line
    end

    -- 排序
    table.sort(lines)

    -- 输出所有的行
    for _, l in ipairs(lines) do
        io.write(l, "\n")
    end
end

-- io.lines(sz) 只读取 sz 个字节
function test2()
    local f = assert(io.open("./io-lines.lua", "rb"))
    local blocksize = 8
    for bytes in f:lines(blocksize) do
        print(bytes)
    end
end

--test1()
test2()