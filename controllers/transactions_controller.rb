require ('sinatra')
require ('sinatra/contrib/all')
require ('pry')
require_relative ('../models/transaction.rb')
require_relative ('../models/merchant.rb')
require_relative ('../models/tag.rb')

get '/transactions' do
  puts params
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

get '/transactions/tags/:id' do
  tag_id = params[:id].to_i
  @merchants = Merchant.all
  @tags = Tag.all
  @transactions = Transaction.tag(tag_id)
  erb( :"transactions/tags")
end

# get '/transactions/tags/:id' do
#   @merchants = Merchant.all
#   @tags = Tag.all
#   tag = params[:id].to_i
#   results = Transaction.all
#   @transactions = results.select{ |result| result[:tag_id] = tag }
#   erb( :"/transactions/tags")
# end