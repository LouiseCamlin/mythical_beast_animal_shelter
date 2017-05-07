require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative ( '../models/animal.rb' )

get '/owners' do
  @owners = Owner.all
  erb(:"owners/index")
end

post "/owners" do
  @owner = Owner.new(params)
  @owner.save
  erb(:"owners/create")
end

get '/owners/new' do
  erb(:"owners/new")
end
get "/owners/:id" do 
  @owner = Owner.find(params[:id])
  erb(:"owners/show")
end

get "owners/:id/edit" do
  @owner = Owner.find(params[:id])
  erb(:"owners/edit")
end

post '/owners/:id' do
  @owners = Owner.new(params)
  @owners.update()
  erb(:"owners/update")
end

delete '/owners/:id' do
  @owners = Owner.find(params[:id])
  @owners.delete
  erb(:"owners/destroy")
end

