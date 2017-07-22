require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
# require( '')

get '/' do
  erb ( :index )
end