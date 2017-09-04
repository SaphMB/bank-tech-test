require 'deposit'

describe Deposit do
  Timecop.freeze(Time.local(1990))
  subject(:deposit) { described_class.new(50) }

  describe 'upon initialization' do
    it 'allows the user the specify the deposit amount' do
      expect(deposit.amount).to eq 50
    end

    it 'stores the date the deposit was created at' do
      expect(deposit.date).to eq Time.now.strftime('%d/∞m/∞y')
    end
  end

  describe '#new_balance' do
    it 'stores a balance' do
      deposit.update_balance(50)
      expect(deposit.new_balance).to eq 50
    end
  end
end
