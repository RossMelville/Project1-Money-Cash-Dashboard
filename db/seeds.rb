require_relative ('../models/merchant.rb')
require_relative ('../models/tag.rb')
require_relative ('../models/transaction.rb')
require_relative ('../models/account.rb')
require ('pry')

Transaction.delete_all
Tag.delete_all
Merchant.delete_all
Account.delete_all

tag1 = Tag.new('name' => 'Clothes')
tag1.save

tag2 = Tag.new('name' => 'Food')
tag2.save

tag3 = Tag.new('name' => 'Bill')
tag3.save

tag4 = Tag.new('name' => 'Entertainment')
tag4.save

tag5 = Tag.new('name' => 'Rent')
tag5.save

tag6 = Tag.new('name' => 'Misc')
tag6.save

merchant1 = Merchant.new('name' => 'Tesco')
merchant1.save

merchant2 = Merchant.new('name' => 'Sainsbury')
merchant2.save

merchant3 = Merchant.new('name' => 'Edinburgh Council')
merchant3.save

merchant4 = Merchant.new('name' => 'O2')
merchant4.save

merchant5 = Merchant.new('name' => 'Scottish Hydro')
merchant5.save

merchant6 = Merchant.new('name' => 'Car Insurrance')
merchant6.save

merchant7 = Merchant.new('name' => 'The Chanter')
merchant7.save

merchant8 = Merchant.new('name' => 'Rettie Housing')
merchant8.save

merchant9 = Merchant.new('name' => 'River Island')
merchant9.save

transaction1 = Transaction.new('value' => 4450, 'transaction_date' => '2017-07-02', 'merchant_id' => 1, 'tag_id' => 1 )
transaction1.save

transaction2 = Transaction.new('value' => 555, 'transaction_date' => '2017-06-02', 'merchant_id' => 1, 'tag_id' => 2 )
transaction2.save

transaction3 = Transaction.new('value' => 10000, 'transaction_date' => '2017-07-10', 'merchant_id' => 2, 'tag_id' => 3 )
transaction3.save

transaction4 = Transaction.new('value' => 85000, 'transaction_date' => '2017-07-02', 'merchant_id' => 2, 'tag_id' => 3 )
transaction4.save

transaction5 = Transaction.new('value' => 3365, 'transaction_date' => '2017-06-12', 'merchant_id' => 3, 'tag_id' => 5 )
transaction5.save

transaction6 = Transaction.new('value' => 7750, 'transaction_date' => '2017-07-02', 'merchant_id' => 4, 'tag_id' => 6)
transaction6.save

transaction7 = Transaction.new('value' => 340, 'transaction_date' => '2017-07-12', 'merchant_id' => 6, 'tag_id' => 4 )
transaction7.save

account1 = Account.new('name' => 'current account', 'balance' => 1000 )
account1.save

Account.delete_all

binding.pry

nil








