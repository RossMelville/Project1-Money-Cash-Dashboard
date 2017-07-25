require ('sinatra')
require ('sinatra/contrib/all')
require ('pry')
require_relative ('../models/merchant.rb')
require_relative ('../models/transaction.rb')
require_relative ('./transactions_controller.rb')

get '/merchants' do
  @merchants = Merchant.all
  erb( :"merchants/index")
end

get '/merchants/new' do
  erb( :"merchants/new" )
end

post '/merchants' do
  @merchants = Merchant.new( params )
  @merchants.save
  redirect to '/transactions'
end