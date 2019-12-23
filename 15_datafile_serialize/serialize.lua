function serialize(o)
    local t = type(o)
    if t == "number" or 
        t == "string" or 
        t == "boolean" or 
        t == "nil" then
        io.write(string.format("%q", o))    -- lua5.3 %q可用于数值,nil,boolean,并且能够保存浮点数的精度
    elseif t == "table" then
        io.write("{\n")
        for k,v in pairs(o) do
            io.write(" ", k, " = ")
            serialize(v)
            io.write(",\n")
        end
        io.write("}")
    end
end

-- serialize(100)
-- serialize(3.14)
-- serialize("hello")

serialize({name = "liudiwen",
    age = 29,
    child = "liuyiya"})