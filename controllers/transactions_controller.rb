require ('sinatra')
require ('sinatra/contrib/all')
require ('pry')
require_relative ('../models/transaction.rb')
require_relative ('../models/merchant.rb')
require_relative ('../models/tag.rb')

get '/transactions' do
  if params['type'] != nil
    @transactions = Transaction.tag(params[:type])
  else
    @transactions = Transaction.all
  end
  
  @merchants = Merchant.all
  @tags = Tag.all
  
  erb( :"transactions/index" )
end

post '/transactions' do
  @transaction = Transaction.new( params )
  @transaction.save
  redirect to '/transactions'
end

