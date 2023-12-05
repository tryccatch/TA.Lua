-- 面向对象编程（Object Oriented Programming，OOP）是一种非常流行的计算机编程架构。

Account = { balance = 0 }
function Account.withdraw(v)
    Account.balance = Account.balance - v
    print(Account.balance)
end

Account.withdraw(100.00)
