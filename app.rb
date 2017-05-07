require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative ( './models/animal.rb' )
require_relative ( './models/owner.rb' )


get '/home' do
  erb(:index)
end

get '/animals' do
  @animals = Animal.all
  erb(:"animals/index")
end

get '/animals/new' do
  erb(:"animals/new")
end

get "/animals/:id" do 
  @animal = Animal.find(params[:id])
  erb(:"animals/show")
end

post "/animals" do
  @animal = Animal.new(params)
  @animal.save
  erb(:"animals/create")
end