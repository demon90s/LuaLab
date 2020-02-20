print "===l_map test begin"

function Pow(n)
    return n*n
end

local arr = {1, 2, 3, 4, 5}

l_map(arr, Pow)
for i,v in ipairs(arr) do
    print(i, v)
end

print "===l_map test end"

print "===l_str_split=== begin"

local t = l_str_split("hello:world:ni:hao", ":")
for i,v in ipairs(t) do
    print(i, v)
end

print "===l_str_split=== end"

print "===l_str_concat=== beign"

local s = l_str_concat(1, 2, 3, "hello")
print (s)   -- 123hello

print "===l_str_concat=== end"

print "===l_str_concat2=== beign"

local s = l_str_concat2("hello", " world")
print (s)   -- [hello world]

print "===l_str_concat2=== end"

print "===l_str_toupper=== begin"

local s = l_str_toupper("hello world")
print (s) --> HELLO WORLD

print "===l_str_toupper=== end"

print "===l_t_concat=== begin"

local s = l_t_concat({ "hello", "world", "ni", "hao" }, "-");
print (s) --> hello-world-ni-hao

print "===l_t_conca=== end"