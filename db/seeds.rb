require_relative ('../models/merchant.rb')
require_relative ('../models/tag.rb')
require_relative ('../models/transaction.rb')
require ('pry')

Tag.delete_all

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