-- 闭包, 简单说就是一个函数外加能够使该函数正确访问非局部变量所需的其他机制

function newCounter()
    local count = 0         -- 对于下面定义的匿名函数, count 就是一个非局部变量
    return function()
            count = count + 1
            return count
        end
end

c1 = newCounter()           -- c1是一个闭包
print(c1())     --> 1
print(c1())     --> 2

c2 = newCounter()           -- c2是另一个闭包
print(c2())     --> 1

-- 下面使用一个表构建了一个闭包
function makeButton(digit)  -- 对于下面的匿名表, digit 就是一个非局部变量
    return {
            name = tostring(digit),
            action = function()
                        print("Click button", digit)
                     end
        }
end

-- 两个不同的闭包
bc1 = makeButton(1)
bc2 = makeButton(2)

bc1.action()
bc2.action()