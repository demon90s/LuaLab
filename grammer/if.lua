-- if-then
local a = 10
if a > 0 then
    print("a > 0")
end

-- if-then-else
if a > 100 then
    print("a > 100")
else
    print("a <= 100")
end

-- if-then-elseif
if a > 100 then
    print("a > 100")
elseif a > 5 then
    print("a > 5")
elseif a > 0 then
    print("a > 0")
else
    print("a <= 0")
end