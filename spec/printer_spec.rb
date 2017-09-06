require 'printer'

describe Printer do
  subject(:printer) { described_class.new }
  describe '#print_statement' do
    let(:deposit_1) { double 'deposit' }
    let(:deposit_2) { double 'deposit' }
    let(:withdrawal) { double 'deposit' }
    let(:transactions) { [deposit_1, deposit_2, withdrawal] }

    it 'prints the transactions in the correct format' do
      allow(deposit_1).to receive(:to_string) { '20/03/2017 || 100.00 || || 100.00' }
      allow(deposit_2).to receive(:to_string) { '12/03/2017 || 300.00 || || 400.00' }
      allow(withdrawal).to receive(:to_string) { '09/03/2017 || || 200.00 || 200.00' }
      expect { printer.print_statement(transactions) } .to output(
        "date || credit || debit || balance\n" \
        "20/03/2017 || 100.00 || || 100.00\n" \
        "12/03/2017 || 300.00 || || 400.00\n" \
        "09/03/2017 || || 200.00 || 200.00\n"
      ).to_stdout
    end

  end
end
