-- seek用于获取或设置文件的读写位置
-- seek(whence, offset)
-- whence 取值为 "set"(开头) "end"(结尾) "cur"(当前)，默认为 cur , offset 默认为0
-- 返回新位置到文件头的偏移字节

-- 获取文件的大小（字节）
function fsize(file)
    local current = file:seek()             -- 保存当前读写位置
    local size = file:seek("end")           -- 获取文件大小
    file:seek("set", current)               -- 重置
    return size
end

f = assert(io.open("./io-seek.lua", "r"))
print(fsize(f))