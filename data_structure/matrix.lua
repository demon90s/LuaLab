-- 多维数组或矩阵

-- 定义
M = 3
N = 4
local mt = {}
for i = 1,M do
    local row = {}
    mt[i] = row
    for j = 1,N do
        row[j] = 0
    end
end

-- output
for i = 1,M do
    for j = 1,N do
        io.write(string.format("%d ", mt[i][j]))
    end
    io.write('\n')
end