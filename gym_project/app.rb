require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('./controllers/gymclass.rb')
require_relative('./controllers/clients.rb')
require_relative('./controllers/bookings.rb')

get '/' do
  erb( :index )
end
