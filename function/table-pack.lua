-- table.pack(...) 函数和 {...} 有点像, 可以把所有参数变成一个表
-- 不过, table.pack 返回的表中有一个字段 n , 表示参数的个数

-- 检查参数中是否没有 nil
function nonils(...)
    local arg = table.pack(...)
    for i = 1, arg.n do
        if arg[i] == nil then return  false end
    end
    return true
end

assert(nonils(2, 3, nil) == false)
assert(nonils(2, 3) == true)

print("[TEST] table.pack PASS")