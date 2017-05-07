require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative ( '../models/owner.rb' )

get '/animals' do
  @animals = Animal.all
  erb(:"animals/index")
end

get '/animals/new' do
  erb(:"animals/new")
end

post "/animals" do
  @animal = Animal.new(params)
  @animal.save
  erb(:"animals/create")
end

get "/animals/:id" do 
  @animal = Animal.find(params[:id])
  erb(:"animals/show")
end


get "animals/:id/edit" do
  @animal = Animal.find(params[:id])
  erb(:"animals/edit")
end

post '/animals/:id' do
  @animal = Animal.new(params)
  @animal.update()
  erb(:update)
end

delete '/animals/:id' do
  @animal = Animal.find(params[:id])
  @animal.delete
  erb(:destroy)
end
