--[[
	os.time 获取当前时间戳

	可以使用一个日期表作为参数，得到一个此时的时间戳
	这个表必须有 year, month, day 字段，可选 hour, min, sec 字段，默认为12:00:00
--]]

local timestamp = os.time()
print(timestamp)

timestamp = os.time({year=1970, month=1, day=1, hour=8}) --> 0, 因为北京时间8点是UTC时间0点
print(timestamp)
