account = Account.new

account.deposit(Deposit.new(1000))
account.withdraw(Withdrawal.new(300))
account.withdraw(Withdrawal.new(1000))
account.print_statement
