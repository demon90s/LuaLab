-- os.getenv(env) 获取环境变量的值
print(os.getenv("HOME"))        --> /home/diwen

-- os.execute(cmd) 执行一个系统命令，　等价于C语言的 system 函数
os.execute("ls -l")