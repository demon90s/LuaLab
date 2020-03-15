-- 数学库提供了三个取整函数：
-- floor 向负无穷取整
-- ceil 向正无穷取整
-- modf 向0取整，还会返回第二个值，是小数部分

print(math.floor(3.3))	--> 3
print(math.ceil(3.3))	--> 4
print(math.modf(3.3))	--> 3 0.3
