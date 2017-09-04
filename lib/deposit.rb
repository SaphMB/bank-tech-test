class Deposit
  attr_reader :amount, :date

  def initialize(amount)
    @amount = amount
    @date = Time.now.strftime('%d/∞m/∞y')
  end
end
