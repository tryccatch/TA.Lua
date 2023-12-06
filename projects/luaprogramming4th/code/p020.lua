-- #region 用于集合的简单模块
--[[
local Set = require("p020Set")

local mt = {}       -- 集合的元表

function Set.new(l) -- 第二个版本
    local set = {}
    setmetatable(set, mt)
    for _, v in ipairs(l) do
        set[v] = true
    end
    return set
end

s1 = Set.new { 10, 20, 30, 50 }
s2 = Set.new { 30, 1 }
print(getmetatable(s1))
print(getmetatable(s2))


-- 加法
mt.__add = Set.union

s3 = s1 + s2
print(Set.tostring(s3))


-- 乘法运算符来计算集合的交集
mt.__mul = Set.intersection

print(Set.tostring((s1 + s2) * s1))

-- s = Set.new { 1, 2, 3 }
-- s = s + 8

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

-- 等于(__eq)、小于(__lt)和小于等于(__le)
mt.__le = function(a, b) -- 子集
    for k in pairs(a) do
        if not b[k] then
            return false
        end
    end
    return true
end

mt.__lt = function(a, b) -- 真子集
    return a <= b and not (b <= a)
end

mt.__eq = function(a, b)
    return a <= b and b <= a
end

s1 = Set.new { 2, 4 }
s2 = Set.new { 4, 10, 2 }
print(s1 <= s2)
print(s1 < s2)
print(s1 >= s1)
print(s1 > s1)
print(s1 == s2 * s1)


mt.__tostring = Set.tostring

s1 = Set.new { 10, 4, 5 }
print(s1)

mt.__metatable = "not your business"

s1 = Set.new {}
print(getmetatable(s1)) --> not your business
setmetatable(s1, {})
-- ]]
--#endregion



-- #region 元方法 __index
--[[
prototype = {
    x = 0,
    y = 0,
    width = 100,
    height = 100
}

local mt = {} -- 创建一个元表
-- 声明构造函数
function new(o)
    setmetatable(o, mt)
    return o
end

mt.__index = function(_, key)
    return prototype[key]
end

mt.__index = prototype

w = new {
    x = 10,
    y = 20
}
print(w.width)
-- ]]
-- #endregion

-- #region 元方法 __newindex
--[[
--[==[
function setDefault(t, d)
    local mt = {
        __index = function()
            return d
        end
    }
    setmetatable(t, mt)
end

tab = { x = 10, y = 20 }
print(tab.x, tab.z)
setDefault(tab, 0)
print(tab.x, tab.z)
-- ]==]

--[==[
local mt = {
    __index = function(t)
        return t.___
    end
}
function setDefault(t, d)
    t.___ = d
    setmetatable(t, mt)
end
-- ]==]

-- [==[
local key = {} -- 唯一的键

local mt = {
    __index = function(t)
        return t[key]
    end
}

function setDefault(t, d)
    t[key] = d
    setmetatable(t, mt)
end
-- ]==]
-- ]]
-- #endregion



-- #region
--[[
function track(t)
    local proxy = {} -- 't'的代理表

    -- 为代理创建元表
    local mt = {
        __index = function(_, k)
            print("*access to element " .. tostring(k))
            return t[k] -- 访问原来的表
        end,
        __newindex = function(_, k, v)
            print("*update of element " .. tostring(k) .. " to " .. tostring(v))
            t[k] = v -- 更新原来的表
        end,
        __pairs = function()
            return function(_, k)      -- 迭代函数
                local nextkey, nextvalue = next(t, k)
                if nextkey ~= nil then -- 避免最后一个值
                    print("*traversing element" .. tostring(nextkey))
                end
                return nextkey, nextvalue
            end
        end,
        __len = function()
            return #t
        end
    }
    setmetatable(proxy, mt)

    return proxy
end

t = {}
t = track(t)
t[2] = "hello"

print(t[2])

t = track({ 10, 20 })
print(#t)
for k, v in pairs(t) do
    print(k, v)
end
-- ]]
-- #endregion



-- #region 星期的只读表
-- [[
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
-- #endregion
