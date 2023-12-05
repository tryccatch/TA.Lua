local titles = {
    "001_Lua语言入门",
    "002_小插曲：八皇后问题",
    "003_数值",
    "004_字符串",
    "005_表",
    "006_函数",
    "007_输入输出",
    "008_补充知识",
    "009_闭包",
    "010_模式匹配",
    "011_小插曲：出现频率最高的单词",
    "012_日期和时间",
    "013_位和字节",
    "014_数据结构",
    "015_数据文件和序列化",
    "016_编译、执行和错误",
    "017_模块和包",
    "018_迭代器和泛型for",
    "019_小插曲：马尔可夫链算法",
    "020_元表和元方法",
    "021_面向对象(Object - Oriented)编程",
    "022_环境(Environment)",
    "023_垃圾收集",
    "024_协程(Coroutine)",
    "025_反射(Reflection)",
    "026_小插曲：使用协程实现多线程",
    "027_C语言API总览",
    "028_扩展应用",
    "029_在Lua中调用C语言",
    "030 编写C函数的技巧",
    "031_C语言中的用户自定义类型",
    "032_资源管理",
    "033_线程和状态",
}




-- lfs = require("lfs")

--[[
for index, value in ipairs(titles) do
    local notename = "../notes/ps/p" .. value .. ".md"
    io.open(notename, "w")

    local dirname = "ps/p" .. (index < 10 and ("00" .. index) or ("0" .. index))

    lfs.mkdir(dirname)

    local filename = dirname .. "/_example.lua"
    io.open(filename, "w")
end
--]]


-- for i = 4, 33 do
--     local notename = "../notes/ps/p" .. (i < 10 and ("00" .. i) or ("0" .. i)) .. ".md"
--     io.open(notename, "w")
-- end
-- [[

--]]
