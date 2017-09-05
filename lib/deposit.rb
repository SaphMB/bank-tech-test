class Deposit
  attr_reader :amount, :date, :new_balance

  def initialize(amount)
    @amount = amount
    @date = Time.new.strftime('%d/%m/%y')
  end

  def update_balance(balance)
    @new_balance = balance
  end

  def to_string
    convert
  end

  private

  def convert
    "#{date} || #{amount} || || #{new_balance}"
  end
end
