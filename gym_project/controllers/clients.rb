require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/client.rb' )
also_reload( '../models/*' )


get '/clients' do
  @clients = Client.all()
  erb (:"clients/index")
end


get '/clients/:id' do
  @client = Client.find(params['id'].to_i)
  erb( :"clients/show")
end
