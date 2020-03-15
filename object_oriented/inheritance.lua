-- 实现继承的一种方式

-- base class
local Animal = {}

function Animal:new(o)
    o = o or {}
    self.__index = self
    setmetatable(o, self)
    return o
end

function Animal:Bar()
    print(string.format("I am %s", self:Name()))
end

function Animal:Name()
    -- override
end

-- derived class
local Cat = Animal:new({name="Kitty"})

function Cat:Name()
    return self.name or "Cat"
end

-- test below
local cat = Cat:new()

cat:Bar()