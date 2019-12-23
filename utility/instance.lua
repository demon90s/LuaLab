--[[
    一个单例模式的例子
--]]

require "baseclass"

SomeManager = SomeManager or BaseClass()

function SomeManager:__init()
    if SomeManager.Instance ~= nil then
        print("[SomeManager] attempt to create singleton twice!")
        return
    end

    SomeManager.Instance = self

    -- init data below
    self.foo = 42
end

function SomeManager:__delete()
	SomeManager.Instance = nil
end

-- Get data functions
function SomeManager:GetFoo()
    return self.foo
end
