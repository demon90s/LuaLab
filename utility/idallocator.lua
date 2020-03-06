IDAllocator = IDAllocator or {}

function IDAllocator.New(N)
    local t = {}
    local mt = { __index = IDAllocator }
    setmetatable(t, mt)
    t.id_list = {}
    for i=1,N do
        t.id_list[i] = N - i
    end
    return t
end

function IDAllocator:AllocID()
    if #self.id_list == 0 then
        return -1
    end
    
    local id = self.id_list[#self.id_list]

    table.remove(self.id_list)

    return id
end

function IDAllocator:Recycle(id)
    table.insert(self.id_list, id)
end