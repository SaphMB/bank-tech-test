class Printer
  def print_statement(transactions)
    puts 'date || credit || debit || balance'
    transactions.each { |transaction| puts transaction.to_string }
  end
end
