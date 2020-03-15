assert(tonumber("-3") == -3)
assert(tonumber("10e4") == 100000)

-- tonumber 默认采取十进制转换,但也可以加入第二个参数,使用任意进制
assert(tonumber("1000", 2) == 8)

-- tonumber 不能转换的时候,返回 nil
assert(tonumber("xxx") == nil)

print("[TEST] tonumber PASS")