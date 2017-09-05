class Account
  DEFAULT_BALANCE = 0

  attr_reader :balance, :transactions

  def initialize
    @transactions = []
    @balance = DEFAULT_BALANCE
  end

  def deposit(deposit)
    increase_balance(deposit)
    deposit.update_balance(balance)
    add_transaction(deposit)
  end

  def withdraw(withdrawal)
    decrease_balance(withdrawal)
    withdrawal.update_balance(balance)
    add_transaction(withdrawal)
  end

  def print_statement(print_class)
    print_class.new.print_statement(@transactions)
  end

  private

  attr_writer :balance, :transactions

  def increase_balance(deposit)
    @balance += deposit.amount

  end

  def decrease_balance(withdrawal)
    @balance -= withdrawal.amount
  end

  def add_transaction(transaction)
    @transactions << transaction
  end

  def sort_by_date
    @transactions.sort_by! {|transaction| transaction.date}
  end
end
