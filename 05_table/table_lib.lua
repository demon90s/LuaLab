-- 表标准库 即 table

-- table.remove(t) 删除序列中最后一个元素
-- table.remove(t, 1) 删除序列中第一个元素, 其余元素往前移动以免造成空洞
t = {1, 2, 3}
table.remove(t)
table.remove(t, 1)

for i,v in ipairs(t) do
    print(i, v)         --> only 1 2
end