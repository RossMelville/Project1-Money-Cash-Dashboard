require ('sinatra')
require ('sinatra/contrib/all')
require ('pry')
require_relative ('../models/transaction.rb')
require_relative ('../models/merchant.rb')
require_relative ('../models/tag.rb')

get '/transactions' do

  if params['tag'] != nil
    @tag = Tag.find(params[:tag])
    @transactions = Transaction.tag(params[:tag])
    @tagtotal = Transaction.tag_total_spent(params[:tag])
  
  elsif params['date1'] != nil
    @transactions = Transaction.by_dates(params[:date1], params[:date2])

  elsif params['merchant'] != nil
    @merchant = Merchant.find(params[:merchant])
    @transactions = Transaction.merchant(params[:merchant])
    @merchanttotal = Transaction.merchant_total_spent(params[:merchant])
  
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

get '/transactions/:id/edit' do
  @transaction = Transaction.find(params[:id])
  @merchants = Merchant.all
  @tags = Tag.all
  erb( :"transactions/edit")
end

post '/transactions/:id' do
  @transaction = Transaction.new( params )
  @transaction.update
  redirect to '/transactions'
end

post '/transactions/delete/:id' do
  @transaction = Transaction.find( params[:id] )
  @transaction.delete
  redirect to '/transactions'
end