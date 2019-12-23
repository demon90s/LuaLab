-- 表标准库 即 table

-- table.insert(arr, pos, v) 向序列的某一个位置插入元素, 后面的元素往后边移动
arr = {1, 2, 3}
table.insert(arr, 1, 100)       --> arr change to {100, 1, 2, 3}

for i,v in ipairs(arr) do
    print(i, v)
end

print("---------------------------------the test end")

-- table.insert(t, v) 向序列的最后的位置插入元素
t = {"hi", "wow"}
table.insert(t, "heiheihei")

for i,v in ipairs(t) do
    print(i, v)
end

print("---------------------------------the test end")

-- table.remove(t) 删除序列中最后一个元素
-- table.remove(t, 1) 删除序列中第一个元素, 其余元素往前移动以免造成空洞
t = {1, 2, 3}
table.remove(t)
table.remove(t, 1)

for i,v in ipairs(t) do
    print(i, v)         --> only 1 2
end