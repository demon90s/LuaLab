-- string.match(str, pattern)
-- 在　str 中查询到匹配　pattern 的子串（第一个），返回它，找不到返回 nil

local s = string.match("hello world", "hello")
assert(s == "hello")

s = string.match("hello world", "hi")
assert(s == nil)

-- 模式，以 % 开头来代表一个模式
--[[
    字符模式：
    .           任意字符
    %a          字母
    %d          数字
    %g          除空格外的可打印字符
    %l          小写字母
    %p          标点符号
    %s          空白字符
    %u          大写字母
    %w          字母和数字
    %x          十六进制数字

    
    它们对应的大写表示其补集，比如 %A 代表所有非字母的字符
--]]

local text = "Deadline is 30/05/1999, from"
s = string.match(text, "%d%d/%d%d/%d%d%d%d")
assert(s == "30/05/1999")

--[[
    魔法字符: ( ) . % + - * ? [ ] ^ $

    使用 % 对它们转义, 比如 %% 表示一个百分号

    [] 内的表示一个字符集, 存在于此字符集内的字符则匹配.比如:

    [%w_] 表示所有以下划线结尾的字母和数字
    [0-9] 表示数字0到9的字符
    [^0-9] 表示所有 0-9 之外的字符

    另外可使用如下修饰符:
    + 重复一次或多次
    * 重复零次或多次
    - 重复零次或多次(最小匹配)
    ? 可选(出现零次或一次)

    比如:
    %a+ 表示一个或多个字母
--]]

-- 查询一个数字序列
s = string.match("the number 1298 is even", "%d+")
assert(s == "1298")

print("[TEST] string.match PASS")