require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('./controllers/employees.rb')
require_relative('./controllers/clients.rb')
require_relative('./controllers/gymclasses.rb')

get '/' do
  erb( :index )
end
