# Bank tech test

The Bank Account script allows a user to create a bank account, make deposits, make withdrawals and view their transaction in a statement.

## Approach

My approach to solving this problem began with my creating a series of user stories. These user stories outlined how one would want to interact with the application. From these user stories, I created a model outlining the objects as well as their attributes and methods.

In order to better understand how one would interact with the methods, I also created a feature test outlining the user journey. This also helped to inform how to best encapsulate the objects and their methods.

## Code structure

The program is divided into four classes, each of which have minimal responsibility. The Account class is responsible for creating instances of an account and well as how the user would interact with their account, namely making withdrawals, deposits and printing statements. However, the methods responsible for the actions that the Account class can trigger site within their own classes.

The transaction classes (Deposit and Withdrawal) are similar, responsible for creating instances of a withdrawal or deposit, recording the balance after the transaction has been made and converting the transaction into a string.

Finally the Printer class prints each of the transactions as well as a heading outlining the columns for the output.

Taking this approach allowed me to follow the single responsibility principle. However, this did pose the question of how best to make the classes and methods accessible to each other. To achieve this, duck typing proved a useful tool. Class instances can be passed as parameters and class methods accessed via these parameters. For example, the Account class instance method deposit can receive instances of deposit. The method, amount, can be called on this instance and this, in turn, means that the decrease_balance method can be called on the instance.

## Model

|Account   |Deposit   |Withdraw   |Printer   |
|---|---|---|---|
|.balance   |.amount   |.amount   |#print_statement   |
|.transactions   |.new_balance   |.new_balance   |   |
|#deposit   |#update_balance   |#update_balance   |   |
|#withdraw   |   |   |   |
|#print_statement   |   |   |   | |

## User stories

```
As a customer,
So that I can manage my funds,
I would like to be able to open a bank account
```
```
As a customer,
So that I can save money,
I would like to be able to deposit funds in my account.
```
```
As a customer,
So that I can access my funds,
I would like to be able to withdraw money from my account.
```
```
As a fiscally responsible customer,
So that I can stay out of debt,
I do not want to be able to have a negative balance.
```
```
As a customer,
So that I can review my account activity,
I would like to be able to print a statement with my transactions and their date.
```
```
As a busy customer,
So that I can easily view my finances,
I would like my statement to list my most recent transactions first.
```
```
As a customer,
So I am not overwhelmed when I view my statement,
I would like my statement to only show transactions from the last 28 days.
```

## How to use

### Setup

```
# clone this respository
$ git clone https://github.com/SaphMB/bank-tech-test
```
```
# install the dependencies
$ bundle install
```

### Using the program

Use a REPL like IRB or pry to interact with the program.

```
# open your REPL
$ pry

[1] pry(main)> require './lib/account.rb'
=> true

[2] pry(main)> require './lib/deposit.rb'
=> true

[3] pry(main)> require './lib/withdrawal.rb'
=> true

[4] pry(main)> require './lib/printer.rb'
=> true

[5] pry(main)> account = Account.new
=> #<Account:0x007f85030420d8 @balance=0, @transactions=[]>

[6] pry(main)> account.deposit(Deposit.new(500))
=> [#<Deposit:0x007f8502884170
  @amount=500,
  @date="05/09/17",
  @new_balance=500>]

[7] pry(main)> account.withdraw(Withdrawal.new(200))
=> [#<Deposit:0x007f8502884170
  @amount=500,
  @date="05/09/17",
  @new_balance=500>,
 #<Withdrawal:0x007f850285fa78
  @amount=200,
  @date="05/09/17",
  @new_balance=300>]

[8] pry(main)> account.print_statement(Printer)
date || credit || debit || balance
05/09/17 || 500 || || 500
05/09/17 || 200 || || 300
```
