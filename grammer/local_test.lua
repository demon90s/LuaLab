dofile("local.lua")

assert(a == nil)    -- a 在local.lua中定义成了local变量
assert(A == 42)

print("[TEST] local PASS")