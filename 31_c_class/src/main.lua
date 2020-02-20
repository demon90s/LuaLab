local vector = require "libvector"

local vec = vector.new(10)

print(vector.size(vec))

vector.free(vec)