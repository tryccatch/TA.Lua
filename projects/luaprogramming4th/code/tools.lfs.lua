lfs = require("lfs")

-- lfs.currentdir()
-- [[
local path = lfs.currentdir()
print("path==>\t" .. path)
--]]
-- lfs.attributes(path)
--[[
local attr = lfs.attributes(path)

local attrName = {
    'dev',          -- on Unix systems, this represents the device that the inode resides on. On Windows systems, represents the drive number of the disk containing the file
    'ino',          -- on Unix systems, this represents the inode number. On Windows systems this has no meaning
    'mode',         -- string representing the associated protection mode (the values could be file, directory, link, socket, named pipe, char device, block device or other)
    'nlink',        -- number of hard links to the file
    'uid',          -- user-id of owner (Unix only, always 0 on Windows)
    'gid',          -- group-id of owner (Unix only, always 0 on Windows)
    'rdev',         -- on Unix systems, represents the device type, for special file inodes. On Windows systems represents the same as dev
    'access',       -- time of last access
    'modification', -- time of last data modification
    'change',       -- time of last file status change
    'size',         -- file size, in bytes
    'permissions',  -- file permissions string
    'blocks',       -- block allocated for file; (Unix only)
    'blksize',      -- optimal file system I/O blocksize; (Unix only)
}

for _, value in ipairs(attrName) do
    print(value .. ":" .. (attr[value] and attr[value] or "nil"))
end
-- ]]
-- lfs.dir(path)
--[[
for file in lfs.dir(path) do
    -- print(file)
    print(file .. ":" .. lfs.attributes(path .. '/' .. file).mode)
end
-- ]]
-- lfs.chdir(path)
--[[
print(lfs.currentdir())
lfs.chdir(path .. "/" .. "code")
print(lfs.currentdir())
-- ]]
-- lfs.mkdir(path)
--[[
for i = 1, 33 do
    local index = (i < 10 and "00" or "0") .. i
    lfs.mkdir("../notes/base/p" .. index)
end
-- ]]

for i = 1, 33 do
    local index = (i < 10 and "00" or "0") .. i
    lfs.mkdir("code/ps/p" .. index)
end
