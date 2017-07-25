require ('sinatra')
require ('sinatra/contrib/all')
require ('pry')
require_relative ('../models/tag.rb')
require_relative ('../models/transaction.rb')
require_relative ('./transactions_controller.rb')

get '/tags' do
  @tags = Tag.all
  erb( :"tags/index")
end

get '/tags/new' do
  erb( :"tags/new")
end

post '/tags' do
  @tags = Tag.new( params )
  @tags.save
  redirect to '/transactions'
end