-- xpcall 和 pcall 都是在保护模式下运行代码，但 pcall 会破坏调用栈
-- xpall 返回前会将调用栈保存好，然后调用一个消息处理函数处理它
-- 常用的一个处理函数是 debug.traceback

function main()
    math.randomseed(os.time())
    local ret = math.random(1, 2)
    if ret == 1 then
        error("random error", 1)
    end
end

local ok, msg = xpcall(main, debug.traceback)

if ok then
    -- regular code
    print("program exit normally")
else
    -- error-handlling code
    print("program exit with err:", msg)
end