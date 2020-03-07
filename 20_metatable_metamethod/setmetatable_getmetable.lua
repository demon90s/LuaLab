--[[
    lua中每一个值（一般是用于表）都可以有元表。

    新创建的表没有元表，通过 setmetatable 函数设置/修改元表。
]]

t = {}
assert(getmetatable(t) == nil)

metat = {}
setmetatable(t, metat)

assert(type(getmetatable(t)) == "table")
assert(getmetatable(t) == metat)

print("[TEST] setmetatable getmetatable PASS")