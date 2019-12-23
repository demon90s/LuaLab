-- try: lua arg.lua a b c

-- 启动脚本的参数会放在一个 arg 表里
-- arg[0] 是脚本名字 随后是参数

print("script name: ", arg[0])
for i=1,#arg do
	print(string.format("arg[%d]: %s", i, arg[i]))
end

print("--------------------------------")

-- ... 包含了所有的参数,不包括脚本名字
local arguments = {...}
print("param", "value")
for k,v in ipairs(arguments) do
	print(k, v)
end
