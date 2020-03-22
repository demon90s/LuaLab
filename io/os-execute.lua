-- os.execute(cmd) 执行一个系统命令，　等价于C语言的 system 函数
-- 如果命令正常结束，返回 true，否则反馈false并且第二个参数是 "exit" or "signal"
-- 第三个参数是返回码或信号码
local ok = os.execute("ls -l")
assert(ok)