function Test()
    local mt = {}
    local t1 = { a = 42, b = "hello" }
    setmetatable(t1, mt)

	local t2 = Clone(t1)
	t2.a = 100

	assert(t2.a == 100 and t2.b == "hello")
    assert(t1.a == 42 and t1.b == "hello")
    assert(getmetatable(t1) == getmetatable(t2)) --> 这个方法会共享元表
end

dofile("clone.lua")

Test()

print("[TEST] Clone PASS")