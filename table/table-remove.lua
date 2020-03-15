local arr = {1, 2, 3, 4}

assert(arr[4] == 4)

-- 删掉最后的元素
table.remove(arr)

assert(arr[4] == nil)

-- 删掉某个位置的元素，后面的元素往前移动
assert(arr[2] == 2)
table.remove(arr, 2)
assert(arr[2] == 3)

print("[TEST] table.remove PASS")