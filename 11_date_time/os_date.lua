--[[
    os.date

    将当前时间戳转换成高级形式

    可以提供一个时间戳表示此时间戳的高级形式
]]

local d = os.date()     -- 获得当前时间字符串形式
print(d)

--[[
    *t表示获得一张时间表，得到当前日期
    这个表有字段：year, month, day, hour, min, sec, wday. yday
]]
local t = os.date("*t")
print(string.format("%d-%02d-%02d %02d:%02d:%02d, wday: %d, yday: %d", 
                    t.year, t.month, t.day, t.hour, t.min, t.sec, t.wday, t.yday))

--[[
    其他格式串，列举
    %A 星期几全称
    %B 月份全称
    %c 日期时间字符串
    %H 24小时制的小时
    %m 月份
    %M 分钟
    %S 秒数
    %Y 完整年份
    %x 日期
    %X 时间

    %% 百分号
]]
d = os.date("%X")
print(d)