-- select 是一种遍历可变长参数的方法
-- select("#", ...) 返回可变参数的总数
-- select(i, ...)   返回从第i个位置开始的可变参数

print(select(1, "a", "b", "c"))     --> a   b   c
print(select(2, "a", "b", "c"))     --> b   c
print(select(3, "a", "b", "c"))     --> c
print(select("#", "a", "b", "c"))   --> 3

function add (...)
    local s = 0
    for i = 1, select("#", ...) do
        s = s + select(i, ...)
    end
    return s
end

print(add(1, 2, 3))     --> 6