Serializer = Serializer or { data = "", read_pos = 1 }

function Serializer:Size()
    return #self.data
end

function Serializer:Data()
    return self.data
end

function Serializer:Reset()
    self.data = ""
    read_pos = 1
end

function Serializer:WriteStrN(v, len)
    local fmt = string.format("c%d", len)
    local s = string.pack(fmt, v)
    self.data = self.data .. s
end

function Serializer:WriteFloat(v)
    local s = string.pack("f", v)
    self.data = self.data .. s
end

function Serializer:WriteDouble(v)
    local s = string.pack("d", v)
    self.data = self.data .. s
end

function Serializer:WriteInteger(v, len, is_unsigned)
    local fmt
    if is_unsigned then
        fmt = string.format("I%d", len)
    else
        fmt = string.format("i%d", len)
    end

    local s = string.pack(fmt, v)
    self.data = self.data .. s
end

function Serializer:WriteChar(v)
    self:WriteInteger(v, 1)
end

function Serializer:WriteUChar(v)
    self:WriteInteger(v, 1, true)
end

function Serializer:WriteShort(v)
    self:WriteInteger(v, 2)
end

function Serializer:WriteUShort(v)
    self:WriteInteger(v, 2, true)
end

function Serializer:WriteInt(v)
    self:WriteInteger(v, 4)
end

function Serializer:WriteUInt(v)
    self:WriteInteger(v, 4, true)
end

function Serializer:WriteLL(v)
    self:WriteInteger(v, 8)
end

function Serializer:WriteULL(v)
    self:WriteInteger(v, 8, true)
end

function Serializer:ReadStrN(len)
    local fmt = string.format("c%d", len)
    local v
    v, self.read_pos = string.unpack(fmt, self.data, self.read_pos)
    return v
end

function Serializer:ReadFloat()
    local v
    v, self.read_pos = string.unpack("f", self.data, self.read_pos)
    return v
end

function Serializer:ReadDouble()
    local v
    v, self.read_pos = string.unpack("d", self.data, self.read_pos)
    return v
end

function Serializer:ReadInteger(len, is_unsigned)
    local fmt
    if is_unsigned then
        fmt = string.format("I%d", len)
    else
        fmt = string.format("i%d", len)
    end

    local v
    v, self.read_pos = string.unpack(fmt, self.data, self.read_pos)
    return v
end

function Serializer:ReadChar()
    return self:ReadInteger(1)
end

function Serializer:ReadUChar()
    return self:ReadInteger(1, true)
end

function Serializer:ReadShort()
    return self:ReadInteger(2)
end

function Serializer:ReadUShort()
    return self:ReadInteger(2, true)
end

function Serializer:ReadInt()
    return self:ReadInteger(4)
end

function Serializer:ReadUInt()
    return self:ReadInteger(4, true)
end

function Serializer:ReadLL()
    return self:ReadInteger(8)
end

function Serializer:ReadULL()
    return self:ReadInteger(8, true)
end