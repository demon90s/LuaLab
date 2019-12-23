-- table.concat
-- 如果 table 是数组，将每个元素连接起来，返回一个字符串
-- 元素要么是number，要么是string

local t = {1, 2, 3, 4, 5, "one", "two"} 

local str = table.concat(t, ',')
print(str)  --> 1,2,3,4,5,one,two