-- io.input() 和　io.output() 获取当前输入输出流
-- io.input(handle) 和　io.output(handle) 设置当前输入输出流
-- handle 也可以是一个文件名字
-- 如果设置失败，会打印错误信息和堆栈

local old_input = io.input()
io.input("test_file.lua")
local t = io.input():read("a")
io.output():write(t)

io.input(old_input)
t = io.input():read("l")
io.output():write(t, "\n")