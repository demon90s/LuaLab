-- table.insert(arr, pos, v) 向序列的某一个位置插入元素, 后面的元素往后边移动
arr = {1, 2, 3}
table.insert(arr, 1, 100)       --> arr change to {100, 1, 2, 3}

assert(arr[1] == 100)

-- table.insert(t, v) 向序列的最后的位置插入元素
t = {"hi", "wow"}
table.insert(t, "heiheihei")

assert(t[3] == "heiheihei")

print("[TEST] table.insert PASS")