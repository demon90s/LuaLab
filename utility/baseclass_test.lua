require "baseclass"
--[[
	
测试　BaseClass

可以重写基类的　_init 和 _delete 方法

执行 .New() 后调用 _init, 先调用基类的, 然后是派生类的

执行 :DeleteMe() 后调用 _delete, 先调用派生类的, 然后是基类的

其余的方法将采取多态调用

--]]

BaseView = BaseView or BaseClass()

function BaseView:__init()
	print("BaseView:__init")
	--print(debug.traceback())
end

function BaseView:__delete()
	print("BaseView:__delete")
end

function BaseView:Print()
	print("View:Print")
end

------------------------------------------------

DerivedView = DerivedView or BaseClass(BaseView)

function DerivedView:__init()
	print("DerivedView:__init")
end

function DerivedView:__delete()
	print("DerivedView:__delete")
end

function DerivedView:Print()
	print("DerivedView:Print")

	-- 调用父类的方法
	BaseView.Print(self)
end

------------------------------------------------

-- 先执行父类的__init，然后执行子类的__init
local derived_view = DerivedView.New()

-- 普通的成员方法，执行多态调用，如果子类有实现，调用子类的，否则调用父类的
derived_view:Print()

-- 先执行子类的__delete，然后执行父类的__delete
derived_view:DeleteMe()

-- New出来的是一个新的对象
print("DerivedView:", DerivedView)
print("derived_view:", derived_view)
