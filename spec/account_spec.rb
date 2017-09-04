require 'account'

describe Account do

  subject(:account) { described_class.new }

  describe 'upon initialization' do
    it 'should have a balance of 0' do
      expect(account.balance).to eq 0
    end
  end

end
