-- io.open(filename, mode) 打开一个文件, mode 可以包含 "r" "w" "a" "b"
-- 它返回对应文件的流, 发生错误时, 返回 nil 错误信息 错误码

print(io.open("non-existent-file", "r"))        --> nil     non-existent-file: No such file or directory    2

print(io.open("/etc/passwd", "w"))              --> nil     /etc/passwd: Permission denied  13

local f = assert(io.open("./test_file.lua", "r"))  -- 如果打开失败, 打印错误信息和堆栈

-- 读写流, 和 io.read, io.write 的用法一样, 不过需要用 : 操作符
local t = f:read("a")
io.write(t)
f:close()

-- 有三个预定义的 IO 流句柄: io.stdin io.stdout io.stderr
io.stderr:write("wow, an error", "\n")