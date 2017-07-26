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

post '/accounts' do
  @accounts = Account.new( params )
  @accounts.save
  redirect to '/accounts'
end

get '/accounts/:id/edit' do
  @account = Account.find( params[:id] )
  erb( :"accounts/edit")
end

post '/accounts/:id' do
  @account = Account.new( params )
  @account.update
  redirect to '/accounts'
end

post '/accounts/delete/:id' do
  @account = Account.find( params[:id] )
  @account.delete
  redirect to '/accounts'
end
