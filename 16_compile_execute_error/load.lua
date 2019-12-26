--[[

load和loadfile功能一样,只不过它是从字符串或者函数中读取lua代码.

它主要用于执行外部代码

]]

function Simple()
    local f = load("i = i + 1")
    i = 0
    f()         -- 从全局空间读取变量
    print(i)    --> 1
end

function Expression()
    print "Enter your expression: "
    local line = io.read()
    local f = load("return " .. line)
    if nil ~= f then
        local ret = f()
        print("The value of the expression is:", ret)
    end
end

Simple()
--Expression()