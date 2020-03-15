-- 少数情况下，需要区分整型值和浮点型值时，可以使用 math.type 函数
print(math.type(3))	--> integer
print(math.type(3.0))	--> float

print(type(3))		--> number
print(type(3.0))	--> number
