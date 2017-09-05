require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:deposit) { double 'deposit' }
  let(:withdrawal) { double 'withdrawal' }

  before do
    allow(deposit).to receive(:amount) { 50 }
    allow(deposit).to receive(:update_balance) { 50 }
    allow(withdrawal).to receive(:amount) { 50 }
    allow(withdrawal).to receive(:update_balance) { 50 }
  end

  describe 'upon initialization' do
    it 'should have a balance of 0' do
      expect(account.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'updates the balance by the deposit amount' do
      expect { account.deposit(deposit) } .to change { account.balance } .by(50)
    end

    it 'adds the deposit to the transactions' do
      account.deposit(deposit)
      expect(account.transactions).to include deposit
    end
  end

  describe '#withdrawal' do
    it 'updates the balance by the deposit amount' do
      account.deposit(deposit)
      expect { account.withdraw(withdrawal) } .to change { account.balance } .by(-50)
    end

    it 'adds the deposit to the transactions' do
      account.deposit(deposit)
      account.withdraw(withdrawal)
      expect(account.transactions).to include withdrawal
    end

    it 'prevents withdrawals that result in a negative balance' do
      account.deposit(deposit)
      account.withdraw(withdrawal)
      expect { account.withdraw(withdrawal) } .to raise_error(RuntimeError, 'Insufficient funds')
    end
  end
end
