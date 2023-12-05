--#region 用于集合的简单模块
-- [[
local Set = require("p020Set")



s1 = Set.new { 10, 20, 30, 50 }
s2 = Set.new { 30, 1 }
print(getmetatable(s1))
print(getmetatable(s2))

-- 加法 => 集合的并集
-- mt.__add = Set.union

s3 = s1 + s2
print(Set.tostring(s3))

-- 乘法 => 集合的交集
-- mt.__mul = Set.intersection
print(Set.tostring((s1 + s2) * s1))

-- 加法 => 混合类型
s = Set.new { 1, 2, 3 }
-- s = s + 8
-- bad argument #1 to 'for iterator' (table expected, got number)
-- attmept to 'add' a set with a non-set value
print(Set.tostring(s))


-- 比较集合(__le, __lt, __eq)

s1 = Set.new { 2, 4 }
s2 = Set.new { 4, 10, 2 }
print(s1 <= s2)
print(s1 < s2)
print(s1 >= s1)
print(s1 > s1)
print(s1 == s2 * s1)



print({})

-- __tostring
s1 = Set.new { 10, 4, 5 }
print(s1)

-- mt.__metatable = "not your business"
s1 = Set.new {}
print(getmetatable(s1)) --> not your business
setmetatable(s1, {})

-- ]]
--#endregion



--#region 星期的只读表
--[[
function readOnly(t)
    local proxy = {}
    local mt = {
        __index = t,
        __newindex = function(t, k, v)
            error("attempt to update a read-only table", 2)
        end
    }
    setmetatable(proxy, mt)
    return proxy
end

days = readOnly { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }

print(days[1])
days[2] = "Noday"
-- ]]
--#endregion
