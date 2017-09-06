class Withdrawal
  attr_reader :amount, :date, :new_balance

  def initialize(amount)
    @amount = amount
    @date = Time.now.strftime('%d/%m/%y')
  end

  def update_balance(balance)
    @new_balance = balance
  end

  private

  def to_string
    "#{date} || #{format_currency(amount)} || || #{format_currency(new_balance)}"
  end

  def format_currency(number)
    sprintf('%.2f', number)
  end
end
