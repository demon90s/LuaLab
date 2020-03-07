-- 格式化标准输出函数
function fwrite(fmt, ...)
	return io.write(string.format(fmt, ...))
end

-- 分割字符串,存入一个 table 里返回
-- "test 1 2 3" -> {"test", "1", "2", "3"}
function split(str)
	local list = {}
	for i in string.gmatch(str, "%S+") do
		table.insert(list, i)
	end

	return list
end

-- 返回数组中最大值和其下标
function maximum(a)
    local mi = 1    -- 最大值索引
    local m = a[mi] -- 最大值
    for i = 1, #a do
        if a[i] > m then
            mi = i; m = a[i]
        end
    end
    return m, mi
end

-- 返回数组中最小值和其下标
function minimum(a)
    local mi = 1    -- 最小值索引
    local m = a[mi] -- 最小值
    for i = 1, #a do
        if a[i] < m then
            mi = i; m = a[i]
        end
    end
    return m, mi
end


--[[
使用 ListToMap(tt, "id") 后将 tt = {
{id = 2, name = "23", sex = 1},
{id = 3, name = "23", sex = 1},
{id = 4, name = "23", sex = 1},
}
变为
tt = {
	[2] = {
		id = 2
    	name = 23
    	sex = 1
	 }
 	[3] ={
    	id = 3
		name = 23
     	sex = 1
	}
	[4] = {
		id = 4
		name = 23
		sex = 1
	}
}
--]]

function ListToMap(list, ...)
	if nil == list then
		return nil
	end

	local map = {}
	local key_list = {...}
	local max_depth = #key_list

	if max_depth <= 0 then
		return nil
	end

	function parse_item(t, item, depth)
		local key_name = key_list[depth]
		local key = item[key_name]
		if nil == t[key] then
			t[key] = {}
		end

		if depth < max_depth then
			parse_item(t[key], item, depth + 1)
		else
			t[key] = item
		end
	end

	for i,v in ipairs(list) do
		parse_item(map, v, 1)
	end

	return map
end
