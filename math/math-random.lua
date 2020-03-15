-- math.random 用于生成伪随机数
-- math.randomseed 用于设置随机数种子，如果不设置，默认采取1
-- math.random() 生成一个 [0,1) 的伪随机数
-- math.random(n) 生成一个 [1, n] 范围的伪随机整数
-- math.random(l, u) 生成一个在范围 [l, u] 的随机整数

math.randomseed(os.time())

print(math.random())
print(math.random(1, 6))

