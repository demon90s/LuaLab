-- 模式，以 % 开头来代表一个模式，这些字符只有用于模式匹配相关的函数时才有意义。

-- 字符模式：
--[[
模式           意义         
.          任意字符       
%a            字母         
%d            数字         
%g    除空格外的可打印字符 
%l          小写字母       
%p          标点符号       
%s          空白字符       
%u          大写字母       
%w         字母和数字      
%x        十六进制数字
--]]

-- 它们对应的大写表示其补集，比如 %A 代表所有非字母的字符。

local s = "abc123"
assert(string.match(s, "%a") == "a")
assert(string.match(s, "%A") == "1")

-- 魔法字符: `( ) . % + - * ? [ ] ^ $` , 魔法字符会有特殊的功能，见后续
-- 使用 % 对它们转义, 比如 `%%` 表示一个百分号， `%.` 表示一个点。

local s = "are you ok."
assert(string.gsub(s, "%.", "?") == "are you ok?")

--[[
    
[] 内的表示一个字符集, 存在于此字符集内的字符则匹配。比如:

[0-9] 表示数字0到9的字符
[^0-9] 表示所有 0-9 之外的字符
--]]

local s = "123456789"
assert(string.gsub(s, "[2468]", "") == "13579")
assert(string.gsub(s, "[^1234]", ".") == "1234.....")

--[[
另外可使用如下修饰符:

修饰符            意义           
+          重复一次或多次      
*          重复零次或多次      
-     重复零次或多次(最小匹配) 
?       可选(出现零次或一次)   

比如: `%a+` 表示一个或多个字母。
--]]

local s = "hello world 1990 ()"
assert(string.match(s, "%a+") == "hello")
assert(string.match(s, "%d+") == "1990")

local s = "() (  )"
assert(string.gsub(s, "%(%s*%)", "[]") == "[] []")  --> %s* 表示0个或多个空格

local s = "hello,world, wowowo"
assert(string.match(s, ".-,") == "hello,")
assert(string.match(s, ".*,") == "hello,world,")

--[[

以^开头的表示从目标字符串开头匹配，$结尾的表示以目标字符串为结尾
如果^不在开头，$不在结尾，它们就只是普通的字符

--]]

function check_num(s)
    return string.find(s, "^[-+]?%d+$")
end
assert(check_num("1234"))
assert(check_num("-111"))
assert(check_num("+42"))
assert(check_num("111.2") == nil)

--[[
%bxy 表示成对的字符串。xy是两个不同的字符。
--]]

local s = "nihao [abc]"
assert(string.match(s, "%b[]") == "[abc]")

print("[TEST] pattern PASS")