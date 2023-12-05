-- local lfs = require("lfs")

-- print(lfs.currentdir())

print(2 ^ 1023)

girl = { money = 1000 };

function girl:GetMoney(someMoney)
    self.money = self.money - someMoney
end

girl.GetMoney(girl, 400)
-- girl:GetMoney(400)
print(girl.money)


function girl:PrintMoney()
    print(666)
end

girl:PrintMoney()


mytable = { "apple", "orange", "banana" }

print(collectgarbage("count"))

mytable = nil

print(collectgarbage("count"))

print(collectgarbage("collect"))

print(collectgarbage("count"))
