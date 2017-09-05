require './lib/account'
require './lib/deposit'
require './lib/withdrawal'
require './lib/printer'

account = Account.new

account.deposit(Deposit.new(1000))
account.withdraw(Withdrawal.new(300))
account.print_statement(Printer)
