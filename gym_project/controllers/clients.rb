require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative( '../models/client.rb' )
also_reload( '../models/*' )


get '/clients' do
  @clients = Client.all()
  erb (:"clients/index")
end

get '/clients/new' do
  @client = Client.all
  erb(:"clients/new")
end

post '/clients' do
  Client.new(params).save
  redirect to '/clients'
end

get '/clients/:id/edit' do
  @client = Client.find(params['id'])
  erb(:"clients/edit")
end

get '/clients/:id' do
  @client = Client.find(params['id'].to_i)
  erb( :"clients/show")
end

post '/clients/:id/edit' do
  client = Client.new(params)
  client.update
  redirect to "/clients"
end

post '/clients/:id/delete' do
  Client.delete(params[:id])
  redirect to "/clients"
end
