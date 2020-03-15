-- 使用 pairs 迭代器遍历表
-- 元素出现的顺序不能确定, 这是底层实现机制决定的
t = {10, print, x = 12, k = "hi"}
t["wow"] = true
for k,v in pairs(t) do
    print(k, v)
end
print("-----------------------------end this test")

-- 对于序列, 可以用 ipairs 迭代器, 此时, Lua 确保是按照顺序遍历
t = {10, print, 12, "hi"}
for i,v in ipairs(t) do
    print(i, v)
end
print("-----------------------------end this test")

-- 还可以通过数值型 for 循环遍历序列
for i=1,#t do
    print(i, t[i])
end