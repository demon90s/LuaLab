-- 数组的索引可以从任意值开始, 不过 Lua 惯例从1开始

arr = {}
for i = 1, 10 do
    arr[i] = i * i
end

-- 没有空洞的数组被称为序列 sequence
-- 序列长度通过 #arr 取得, arr 不能有空洞, 即中间不可以有 nil 值, 否则 #arr 的操作是不可靠的
print(#arr)     --> 10