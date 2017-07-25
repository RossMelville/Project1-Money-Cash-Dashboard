require ('sinatra')
require ('sinatra/contrib/all')
require ('pry')
require_relative ('../models/account.rb')
require_relative ('../models/transaction.rb')
require_relative ('./transactions_controller.rb')

get '/accounts' do
  @accounts = Account.all
  erb( :"accounts/index")
end

