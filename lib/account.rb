class Account

  DEFAULT_BALANCE = 0

  attr_reader :balance

  def initialize
    @transactions = []
    @balance = DEFAULT_BALANCE
  end

end
