require "small_functions"

function test_ListToMap()
	t = {
		{id = 916, name = "diwen", age = 28},
		{id = 919, name = "miemie", age = 3},
		{id = 524, name = "meili", age = 31},
	}

	local m = ListToMap(t, "id")

	-- print to see
	for k,v in pairs(m) do
		io.write(string.format("%d -> ", k))
		io.write(string.format("name: %s, age: %d\n", v.name, v.age))
	end
end

local function main()
	-- test fwrite
	--fwrite("hello, %d\n", 100)

	-- test split
	-- local list = split("test 1 2 3")
	-- for k, v in ipairs(list) do
	-- 	print(k, v)
	-- end

	-- test maximum minimum
	--print(maximum{10, 20, 15})
	--print(minimum{10, 20, 15})

	test_ListToMap()
end
main()
