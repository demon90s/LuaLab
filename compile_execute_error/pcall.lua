--[[

如果要在代码里处理错误,应该用pcall进行封装

pcall会以保护模式运行它的第一个参数,无论是否有错误发生,pcall都不会引发错误.而是返回错误结果.

可以用 error 函数来抛出异常, 其第二个参数表示错误的责任方(1是函数自身,2是主调函数)

]]

function main()
    math.randomseed(os.time())
    local ret = math.random(1, 2)
    if ret == 1 then
        error("random error", 1)
    end
end

local ok, msg = pcall(main)

if ok then
    -- regular code
    print("program exit normally")
else
    -- error-handlling code
    print("program exit with err:", msg)
end