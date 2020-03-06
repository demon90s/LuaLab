dofile("idallocator.lua")

local arr = IDAllocator.New(10)

local id = arr:AllocID()
assert(id == 0)

local id2 = arr:AllocID()
assert(id2 == 1)

arr:Recycle(id)
arr:Recycle(id2)
id3 = arr:AllocID()
assert(id3 == 1)

id4 = arr:AllocID()
assert(id4 == 0)

for i=1,8 do
    assert(arr:AllocID() ~= -1)
end
assert(arr:AllocID() == -1)

print("[TEST] idallocator PASS")