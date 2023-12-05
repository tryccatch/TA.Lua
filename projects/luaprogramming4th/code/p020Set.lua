--#region 用于集合的简单模块
-- [[
local Set = {}

-- 使用指定的列表创建一个新的集合
--[[
function Set.new(l)
    local set = {}
    for _, v in ipairs(l) do
        set[v] = true
    end
    return set
end

function Set.union(a, b)
    local res = Set.new {}
    for k, v in pairs(a) do
        res[k] = true
    end
    for k, v in pairs(b) do
        res[k] = true
    end
    return res
end

-- ]]

local mt = {}       -- 集合的元表

function Set.new(l) -- 第二个版本
    local set = {}
    setmetatable(set, mt)
    for _, v in ipairs(l) do
        set[v] = true
    end
    return set
end

function Set.union(a, b)
    if getmetatable(a) ~= mt or getmetatable(b) ~= mt then
        error("attmept to 'add' a set with a non-set value", 2)
    end
    local res = Set.new {}
    for k, v in pairs(a) do
        res[k] = true
    end
    for k, v in pairs(b) do
        res[k] = true
    end
    return res
end

function Set.intersection(a, b)
    local res = Set.new {}
    for k in pairs(a) do
        res[k] = b[k]
    end
    return res
end

-- 将集合表示为字符串
function Set.tostring(set)
    local l = {}
    for e in pairs(set) do
        l[#l + 1] = e
    end
    return "{" .. table.concat(l, ", ") .. "}"
end

mt.__add = Set.union

mt.__mul = Set.intersection

-- __le(小于等于，子集关系)
mt.__le = function(a, b) -- 子集
    for k in pairs(a) do
        if not b[k] then
            return false
        end
    end
    return true
end

-- __lt(小于，真子集关系)
mt.__lt = function(a, b) -- 真子集
    return a <= b and not (b <= a)
end

mt.__eq = function(a, b)
    return a <= b and b <= a
end

mt.__tostring = Set.tostring

-- mt.__metatable = "not your business"


return Set
