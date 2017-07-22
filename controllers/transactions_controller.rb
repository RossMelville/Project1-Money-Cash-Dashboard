require ('sinatra')
require ('sinatra/contrib/all')
require ('pry')
require_relative ('../models/transaction.rb')
require_relative ('../models/merchant.rb')
require_relative ('../models/tag.rb')

get '/transactions' do
  @merchants = Merchant.all
  @tags = Tag.all
  @transactions = Transaction.all
  erb( :"transactions/index" )
end

post '/transactions' do
  @transaction = Transaction.new( params )
  @transaction.save
  redirect to '/transactions'
end