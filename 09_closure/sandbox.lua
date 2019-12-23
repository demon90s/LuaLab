-- 沙盒，一种编程技巧，它可以修改原来的函数版本，阻止旧函数被调用，从而创建一个安全的运行时环境

-- 一个简单的例子，把　print 函数改造，之后不能再访问到原来的　print
do
    local old_print = print
    local times = 0

    print = function(...)
        times = times + 1
        io.write(string.format("[%d] ", times))
        old_print(...)
    end
end

print("wow~")
print("hi~")
print("hei~")