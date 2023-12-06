local mt = {} -- 集合的元表

-- function Set.new(l) -- 第二个版本
--     local set = {}
--     setmetatable(set, mt)
--     for _, v in ipairs(l) do
--         set[v] = true
--     end
--     return set
-- end