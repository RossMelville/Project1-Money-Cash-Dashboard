require ('sinatra')
require ('sinatra/contrib/all')
require ('pry')
require_relative ('../models/merchant.rb')
require_relative ('./transactions_controller.rb')

get '/merchants/new' do
  erb( :"merchants/new" )
end

post '/merchants' do
  @merchants = Merchant.new( params )
  @merchants.save
  redirect to '/transactions'
end