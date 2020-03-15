-- 数学库提供了三个取整函数：
-- floor 向负无穷取整
-- ceil 向正无穷取整
-- modf 向0取整，还会返回第二个值，是小数部分

-- 如果要进行四舍五入，需要自己实现

assert(math.floor(3.3) == 3)
assert(math.floor(-3.3) == -4)

assert(math.ceil(3.3) == 4)
assert(math.ceil(-3.3) == -3)

local a, b = math.modf(3.3)
assert(a == 3)
assert(b - 0.3 <= 0.0001)

a, b = math.modf(-3.3)
assert(a == -3)
assert(math.abs(b + 0.3) <= 0.0001) -- b = -0.3

-- 四舍五入（不能处理数值溢出的情况）
function round(x)
    return math.floor(x + 0.5)
end

assert(round(3.3) == 3)
assert(round(3.6) == 4)
assert(round(-3.3) == -3)
assert(round(-3.6) == -4)

print("[TEST] math.floor math.ceil math.modf PASS")