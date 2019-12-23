-- 整型值的最大值： math.maxinteger
-- 整型值的最小值： math.mininteger

-- 标准 Lua 使用64个比特位来存储整型值

print(math.maxinteger)
print(math.mininteger)

-- 当在做整型操作时，如果出现比最大值更大或比最小值更小的数值时，就会出现回环（wrap around）
function test_wrap_around()
	-- true
	if math.maxinteger + 1 == math.mininteger then
		print("math.maxinteger + 1 == math.mininteger")
	end

	-- true
	if math.mininteger - 1 == math.maxinteger then
		print("math.mininteger - 1 == math.maxinteger")
	end

	if math.mininteger == -math.mininteger then
		print("math.mininteger == -math.mininteger")
	end
end
test_wrap_around()
