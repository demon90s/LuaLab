--[[

assert检查第一个参数是否为真,如果是返回该参数.
否则引发一个错误,参数2是一个可选的错误信息.

]]

function Simple()
    local n = io.read()
    assert(tonumber(n), "You must enter a number")
end

Simple()