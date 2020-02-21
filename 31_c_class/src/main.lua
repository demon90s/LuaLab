local vector = require "libvector"

local vec = vector.new(10)

print(vector.size(vec))
--print(vector.size(io.stdin))  --> bad argument #1 to 'size' (libvectorint expected, got FILE*)

vector.free(vec)