require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative ( './models/animal.rb' )
require_relative ( './models/owner.rb' )


get '/home' do
  erb( :index )
end

get '/animals' do
  @animals = Animal.all
  erb(:"animals/index")
end