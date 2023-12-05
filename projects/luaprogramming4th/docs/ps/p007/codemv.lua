local function isWin()
    return package.config:sub(1, 1) == "\\"
end

local function changeCurDir(target)
    local path = arg[0]
    if isWin() then
        os.execute("move " .. path .. " " .. target)
    else
        os.execute("mv " .. path .. " " .. target)
    end
end

os.execute("chcp 65001")
changeCurDir("p007/codemv.lua")
