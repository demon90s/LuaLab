--[[

loadfile从文本中加载lua代码,但它不会运行它,而是编译代码.

然后将编译好的代码作为一个函数返回.

失败时,它不会抛出异常,而是返回nil和错误信息.

]]

local f = loadfile("hello.lua")     -- 编译代码
if nil ~= f then
    print(hello)    --> nil
    f()             -- 运行代码
    hello()
end