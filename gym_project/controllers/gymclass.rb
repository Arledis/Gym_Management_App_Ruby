require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/gymclass.rb' )
also_reload( '../models/*' )


get '/gymclasses' do
  @gymclasses = Gymclass.all()
  erb (:"gymclasses/index")
end

get '/gymclasses/new' do
  @client = Gymclass.all
  erb(:"gymclasses/new")
end

post '/gymclasses' do
  Gymclass.new(params).save
  redirect to '/gymclasses'
end

get '/gymclasses/:id' do
  @gymclass = Gymclass.find(params['id'].to_i)
  erb( :"gymclasses/show")
end
