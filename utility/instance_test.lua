require "instance"

SomeManager.New()
--SomeManager.New() -- 不能够创建两次, 不然提示错误

local foo = SomeManager.Instance:GetFoo()
print(foo)  --> 42

SomeManager.Instance:DeleteMe()

-- can not use any more
--SomeManager.Instance:GetFoo()

print("test ok if no error occurred~~~")
