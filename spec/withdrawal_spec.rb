require 'withdrawal'

describe Withdrawal do
  Timecop.freeze(Time.local(1990))
  subject(:withdrawal) { described_class.new(50) }

  describe 'upon initialization' do
    it 'allows the user the specify the withdrawal amount' do
      expect(withdrawal.amount).to eq 50
    end

    it 'stores the date the withdrawal was created at' do
      expect(withdrawal.date).to eq Time.now.strftime('%d/∞m/∞y')
    end
  end

  describe '#new_balance' do
    it 'stores a balance' do
      withdrawal.update_balance(50)
      expect(withdrawal.new_balance).to eq 50
    end
  end
end
