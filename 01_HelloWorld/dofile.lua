-- 加载文件，如果代码有错误，会报错
local ret = dofile("helloworld.lua")
assert(ret == 0)

print("[TEST] dofile PASS")