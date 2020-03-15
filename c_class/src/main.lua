local vector = require "libvector"

local vec = vector.new(10)

print(vec:size())
--print(vector.size(io.stdin))  --> bad argument #1 to 'size' (libvectorint expected, got FILE*)

vec:free()