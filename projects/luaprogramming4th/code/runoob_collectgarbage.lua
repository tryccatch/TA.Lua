mytable = { "apple", "orange", "banana" }

print(collectgarbage("count"))

mytable = nil

print(collectgarbage("count"))

print(collectgarbage("collect"))

print(collectgarbage("count"))

local t = {
    year = 1998,
    month = 9,
    day = 16,
    yday = 259,
    wday = 4,
    hour = 23,
    min = 48,
    sec = 10,
    isdst = false
}

local t = 1024

if os.time(os.date("*t", t)) == t then
    print("==")
end
