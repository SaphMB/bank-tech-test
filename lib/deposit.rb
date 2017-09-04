class Deposit
  attr_reader :amount, :date, :new_balance

  def initialize(amount)
    @amount = amount
    @date = Time.now.strftime('%d/∞m/∞y')
  end

  def update_balance(balance)
    @new_balance = balance
  end
end
