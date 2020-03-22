local a = 42

A = 42

do
    local a
    a = 100
end

-- 不会改变外面这个a
assert(a == 42)