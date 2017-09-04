class Account
  DEFAULT_BALANCE = 0

  attr_reader :balance, :transactions

  def initialize
    @transactions = []
    @balance = DEFAULT_BALANCE
  end

  def deposit(deposit)
    increase_balance(deposit)
    add_transaction(deposit)
  end

  private

  attr_writer :balance, :transactions

  def increase_balance(deposit)
    @balance += deposit.amount
  end

  def add_transaction(transaction)
    @transactions << transaction
  end


end
