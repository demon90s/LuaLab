dofile("serializer.lua")

assert(Serializer:Size() == 0)

Serializer:WriteChar(-1)
Serializer:WriteUChar(1)
Serializer:WriteShort(-42)
Serializer:WriteUShort(42)
Serializer:WriteInt(-10240)
Serializer:WriteUInt(10240)
Serializer:WriteLL(-2^20)
Serializer:WriteULL(2^20)
Serializer:WriteStrN("hello", 32)
Serializer:WriteFloat(3.14)
Serializer:WriteDouble(3.141592653)

assert(Serializer:Size() == 1 + 1 + 2 + 2 + 4 + 4 + 8 + 8 + 32 + 4 + 8)

local v = Serializer:ReadChar()
assert(v == -1)

v = Serializer:ReadUChar()
assert(v == 1)

v = Serializer:ReadShort()
assert(v == -42)

v = Serializer:ReadUShort()
assert(v == 42)

v = Serializer:ReadInt()
assert(v == -10240)

v = Serializer:ReadUInt()
assert(v == 10240)

v = Serializer:ReadLL()
assert(v == -2^20)

v = Serializer:ReadULL()
assert(v == 2^20)

v = Serializer:ReadStrN(32)
local str = string.sub(v, 1, 5)
assert(str == "hello" and #v == 32)

v = Serializer:ReadFloat()
assert(math.abs(v - 3.14) < 0.001)

v = Serializer:ReadDouble()
assert(math.abs(v - 3.141592653) < 0.001)

Serializer:Reset()
assert(Serializer:Size() == 0)

print("[TEST] Serializer PASS")
