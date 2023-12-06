--#region
-- [[
--[==[
Account = {
    balance = 0
}

--[=[
-- 提，取（银行账户中的钱款）
function Account:withdraw(v)
    self.balance = self.balance - v
end

Account.withdraw(100.00)

a, Account = Account, nil
a.withdraw(100.00)
-- ]=]

function Account.withdraw(self, v)
    self.balance = self.balance - v
end

a1 = Account;
-- Account = nil
a1.withdraw(a1, 100.00)

a2 = { balance = 0, withdraw = Account.withdraw }
a2.withdraw(a2, 260.00)

function Account:withdraw(v)
    self.balance = self.balance - v
end
-- ]==]

-- [=[
--[==[
Account = {
    balance = 0
}

function Account:withdraw(v)
    self.balance = self.balance - v
end
-- ]==]

-- [==[
Account = {
    balance = 0,
    withdraw = function(self, v)
        self.balance = self.balance - v
    end
}
-- ]==]

function Account:deposit(v)
    self.balance = self.balance + v
end

Account.deposit(Account, 200.00)
Account:withdraw(100.00)
-- ]=]

-- ]]
--#endregion

--#region 类
-- [[
local mt = { __index = Account }

function Account.new(o)
    o = o or {}
    setmetatable(o, mt)
    return o
end

a = Account.new { balance = 0 }
a:deposit(100.00)

getmetatable(a).__index.deposit(a, 100.00) --> Account.deposit(a, 100.00)

function Account:new(o)
    o = o or {}
    self.__index = self
    setmetatable(o, self)
    return o
end

b = Account:new()
print(b.balance)
-- ]]
--#endregion

--#region 继承
-- [[
Account = { balance = 0 }

function Account:new(o)
    o = o or {}
    self.__index = self
    setmetatable(o, self)
    return o
end

function Account:deposit(v)
    self.balance = self.balance + v
end

function Account:withdraw(v)
    if v > self.balance then
        error "insufficient funds"
    end
    self.balance = self.balance - v
end

SpecialAccount = Account:new()
s = SpecialAccount:new { limit = 1000.00 }

print(s)
-- ]]
--#endregion

print("p021")