require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/booking.rb' )
require_relative( '../models/client.rb' )
require_relative( '../models/gymclass.rb' )
also_reload( '../models/*' )


get '/bookings' do
  @bookings = Booking.all
  erb ( :"bookings/index" )
end

get '/booking_not_available' do
  erb( :"bookings/not_available")
end

get '/bookings/new' do
  @clients = Client.all
  @gymclasses = Gymclass.all
  erb(:"bookings/new")
end

post '/bookings' do

  booking = Booking.new(params)
  clients = Booking.clients_in_class(params["gymclass_id"])
  gymclass = Gymclass.find(params["gymclass_id"])
  if clients >= gymclass.capacity
    redirect to("/booking_not_available")
  end
  booking.save
  redirect to("/bookings")
end

post '/bookings/:id/delete' do
  Booking.delete(params[:id])
  redirect to("/bookings")
end
