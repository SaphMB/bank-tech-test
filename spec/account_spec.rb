require 'account'

describe Account do
  subject(:account) { described_class.new }

  describe 'upon initialization' do
    it 'should have a balance of 0' do
      expect(account.balance).to eq 0
    end
  end

  describe '#deposit' do
    let(:deposit) { double 'deposit' }

    before do
      allow(deposit).to receive(:amount) { 50 }
    end

    it 'updates the balance by the deposit amount' do
      expect { account.deposit(deposit) } .to change { account.balance } .by(50)
    end

    it 'adds the deposit to the transactions' do
      account.deposit(deposit)
      expect(account.transactions).to include deposit
    end
  end

  describe '#withdrawal' do
    let(:withdrawal) { double 'withdrawal' }

    before do
      allow(withdrawal).to receive(:amount) { 50 }
    end

    it 'updates the balance by the deposit amount' do
      expect { account.withdraw(withdrawal) } .to change { account.balance } .by(-50)
    end

    it 'adds the deposit to the transactions' do
      account.withdraw(withdrawal)
      expect(account.transactions).to include withdrawal
    end
  end
end
