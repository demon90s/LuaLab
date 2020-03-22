local a = 1
local sum = 0
repeat
    sum = sum + a
    a = a + 1
until a == 5   -- 为真时退出循环

assert(sum == 10) -- 1 + 2 + 3 + 4
assert(a == 5)

print("[TEST] repeat-until PASS")