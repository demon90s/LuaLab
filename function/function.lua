-- 调用函数的方法是使用一个圆括号括起来参数列表
-- 如果只有一个参数且这个参数是字符串或者表, 那么就可以不用圆括号...
print("hi")     --> hi
print "hi"      --> hi
print(type({}))  --> table
print(type {})   --> table

print("---------------------------------end this test")

-- 定义一个函数语法
function foo(a, b)
    print(a, b)
end

-- 调用的时候可以不传全部参数, 缺少的默认为 nil , 多余的被丢掉
foo(1, 2)       --> 1 2
foo(1)          --> 1 nil
foo()           --> nil nil
foo(1, 2, 3)    --> 1 2

print("---------------------------------end this test")

-- Lua 的函数可以返回多个值
-- 注意, 函数必须是表达式系列中最后一个表达式的时候, 才会返回多个值, 否则只返回第一个值
function maximum(a)
    local mi = 1    -- 最大值索引
    local m = a[mi] -- 最大值
    for i = 1, #a do
        if a[i] > m then
            mi = i; m = a[i]
        end
    end
    return m, mi    -- 返回数组中最大值和其下标
end

print(maximum{8, 10, 23, 12, 5})       --> 23 3

print("---------------------------------end this test")

-- 可变长参数, 即使用 ... 作为函数的参数
function add(...)   -- 求参数之和
    local s = 0
    for _, v in ipairs{...} do
        s = s + v
    end
    return s
end

print(add(1, 2, 3))    --> 6