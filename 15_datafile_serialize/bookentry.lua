-- 读取数据文件 bookdata.lua

function EntryBook(t)
    local name = t.name or "unkown"
    local author = t.author or "unkown"
    local year = t.year or 0
    print(string.format("book:%s, author: %s, year: %d", name, author, year))
end
dofile("bookdata.lua")