--[[
    可以对整数做位运算
    
    & 按位与
    | 按位或
    ~ 按位异或
    一元~ 按位去反

    >> 逻辑右移
    << 逻辑左移

    lua 的整数有64位, 逻辑移位操作用0来填补空出来的位
--]]

print(string.format("0xff & 0xaabb = %x", 0xff & 0xaabb))           --> bb

print(string.format("0xff | 0xaabb = %x", 0xff | 0xaabb))           --> aaff

print(string.format("0xf0 ~ 0x0f = %x", 0xf0 | 0x0f))               --> ff

print(string.format("~0xff = %x", ~0xff))                           --> ffffffffffffff00

print(string.format("0xff << 8 = %x", 0xff << 8))                   --> ff00

print(string.format("0xff >> 4 = %x", 0xff >> 4))                   --> f