-- error(err_obj, level)

-- 引发一个错误，第一个参数是错误的内容，第二个是错误发生的层级，第一层是1

function foo (str)
    if type(str) ~= "string" then
        error("foo: string expected", 2)
    else
        print (str)
    end
end

local ok, msg = pcall(function() foo(42) end)

assert(not ok)

print(msg)

print("[DEBUG] error PASS")