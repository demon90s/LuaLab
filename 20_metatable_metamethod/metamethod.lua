--[[
    元表案例

    为Set提供+ *的能力，分别表示取并集、取交集。

    类似的算数元操作有：
    __add           加法
    __mul           乘法
    __sub           减法
    __div           除法
    __idiv          floor除法
    __unm           负数
    __mod           取模
    __pow           幂运算

    位操作：
    __band          按位与
    __bor           按位或
    __bxor          按位异或
    __bnot          按位取反
    __shl           向左移位
    __shr           向右移位
    
    其他：
    __concat        定义连接运算符的行为
    __tostring      默认的 tostring 方法，比如print函数首先就会调用元表的该方法，如果存在的话
    ____metatable   保护元表，设置之后，不能再修改元表为其他元表
]]

local Set = {}
local mt = {}
mt.__metatable = "none of your business"

-- 创建一个Set
function Set.new(l)
    local set = {}
    setmetatable(set, mt)
    for _,v in ipairs(l) do
        set[v] = true
    end
    return set
end

-- 取并集操作
function Set.union(a, b)
    local set = Set.new {}
    for v in pairs(a) do set[v] = true end
    for v in pairs(b) do set[v] = true end
    return set
end

mt.__add = Set.union

-- 取交集操作
function Set.intersection(a, b)
    local set = Set.new {}
    for v in pairs(a) do
        set[v] = b[v]
    end
    return set
end

mt.__mul = Set.intersection

-- tostring
function Set.tostring(set)
    local l = {}
    for e in pairs(set) do
        l[#l + 1] = tostring(e)
    end

    return "{" .. table.concat(l, ',') .. "}"
end

mt.__tostring = Set.tostring

---test below

local s1 = Set.new {1, 2, 3, 4, 5}
local s2 = Set.new {3, 4, 5, 6, 7}

local s_union = s1 + s2
print(Set.tostring(s_union))    --> 1,2,3,4,5,6,7

local s_inter = s1 * s2
--print(Set.tostring(s_inter))    --> 3,4,5 (不一定按顺序)
print(s_inter)

--setmetatable(s1, {}) --> cannot change a protected metatable