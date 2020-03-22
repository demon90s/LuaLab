-- goto 限制条件
-- 1. 不能跳转到一个代码块中的标签
-- 2. 不能跳转到函数外
-- 3. 不能跳转到局部变量作用域

function f()
    do goto the_end end
    print("never execute")

::the_end::
    print("f end")
end

f()

-- 输出奇数
for i=1,10 do
    if i % 2 == 0 then goto continue end
    print(i)
    ::continue::
end