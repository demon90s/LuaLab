local n = math.max(7, 1, 8, 6)
assert(n == 8)

n = math.min(7, 1, 8, 6)
assert(n == 1)

print ("[TEST] math.max math.min PASS")