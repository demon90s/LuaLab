StringCommon = StringCommon or {}

function StringCommon.Trim(s)
    s = string.gsub(s, "^%s*(.-)%s*$", "%1")
    return s
end

-- test below
local s = " hello world  "
assert(StringCommon.Trim(s) == "hello world")

print("[TEST] StringCommon.Trim PASS")