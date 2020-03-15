-- table.move(a, f, e, t)
-- 将序列a位置f,e移动到t位置，其实是拷贝

local t = {1, 2, 3, 4}
table.move(t, 2, 4, 1)
assert(t[1] == 2)
assert(t[2] == 3)
assert(t[3] == 4)
assert(t[4] == 4)

-- table.move(a, f, e, t, tbl)
-- 最后一个参数若是一个表，则是移动到该表，返回这个表
t1 = {1, 2, 3}
local t2 = {}
t2 = table.move(t1, 1, 4, 1, {}) -- clone t1 -> t2
assert(t2[1] == 1)
assert(t2[2] == 2)
assert(t2[3] == 3)

print("[TEST] table.move PASS")