-- table.sort 可以对表排序, 可以提供一个匿名函数来设置排序规则

network = {
    {name = "grrauna", IP = "210.26.30.34"},
    {name = "arraial", IP = "210.26.30.23"},
    {name = "lua", IP = "210.26.23.12"},
    {name = "derain", IP = "210.26.23.20"},
}

table.sort(network, function(a, b)
    return a.name > b.name
end)

for _,v in pairs(network) do
    print(v.name, v.IP)
end