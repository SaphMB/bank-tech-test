require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:deposit) { double 'deposit' }

  describe 'upon initialization' do
    it 'should have a balance of 0' do
      expect(account.balance).to eq 0
    end
  end

  describe '#deposit' do

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
end
