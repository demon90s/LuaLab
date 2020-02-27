-- 一个简单的lua配置文件
width = 200
height = 300

function traceback(msg)
    local log = "[LUA-ERROR]: " .. msg .. "\n" .. debug.traceback()
	
	print(log)

	return msg
end

function f(x, y)
	--error("fuckkk")
    return x * y
end