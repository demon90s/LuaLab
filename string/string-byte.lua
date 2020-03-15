-- string.byte(s, pos) 返回字符串s中的第pos位置上的字符的数值表示, pos 忽略则为1
-- string.byte(s, i, j) 返回字符串s中[i,j]所有字符的数值表示
assert(string.byte("abc") == 97)

assert(string.byte("abc", 2) == 98)

local a,b,c = string.byte("abc", 1, 3)
assert(a == 97 and b == 98 and c == 99)

print("[TEST] string.byte PASS")