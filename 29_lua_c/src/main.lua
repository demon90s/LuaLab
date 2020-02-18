-- 测试注册的C模块
local cfunc = require "cfunc"

print(type(cfunc))

print "===l_sin test begin==="
io.write ("sin(0) = ", cfunc.l_sin(0), '\n')
print "===l_sin test end==="

print "===l_dir test begin==="
file_list = cfunc.l_dir(".")
for _,v in ipairs(file_list) do
    print(v)
end
print "===l_dir test end==="

--[[
print "===l_sin test begin==="
io.write ("sin(0) = ", l_sin(0), '\n')
print "===l_sin test end==="

print "===l_dir test begin==="
file_list = l_dir(".")
for _,v in ipairs(file_list) do
    print(v)
end
print "===l_dir test end==="
--]]