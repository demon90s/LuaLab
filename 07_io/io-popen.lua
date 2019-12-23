-- os.popen(cmd, mode) 执行一个系统命令, 并可以重定向输入输出流, 比如, mode 为 "r" 则从 cmd 中读取, "w" 向 cmd 写入
-- 返回一个文件句柄, 通过它和 cmd 进行输入或输出
local t = io.popen("ls -l", "r")

for line in t:lines() do
    io.write(line, "\n")
end