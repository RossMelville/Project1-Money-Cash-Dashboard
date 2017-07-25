require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
require_relative( 'controllers/transactions_controller' )
require_relative( 'controllers/merchants_controller' )
require_relative( 'controllers/merchants_controller' )

configure do
  set :budget, 200
end


get '/' do
  erb ( :index )
end