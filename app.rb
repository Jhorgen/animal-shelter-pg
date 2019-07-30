require('sinatra')
require('sinatra/reloader')
require('pry')
require("pg")
require("./lib/customer.rb")
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "animal_shelter"})
# categories = ["funny", "not_funny", "movies", "music", "general"]

get ('/') do
  Customer.clear()
  redirect to ('/customers')
end

post ('/customers') do
  # binding.pry
  Customer.new({:name => params[:name], :phone => params[:phone].to_i, :animal_preference => params[:animal_preference], :breed_preference => params[:breed_preference]}). save()
  redirect to ('/customers')
end

# post ('/customers/:id/animals') do
#   Animal.new({"name" => params[:name], "species" => params[:species], "breed" => params[:breed], "gender" => params[:gender], "owner_id" => params[:id].to_i).save()
#   redirect to ("customer/#{params[:id].to_i}")
# end


get ('/customers/new') do
  erb :customer
end

get ('/animals/new') do
  erb :animal
end

get ('/customers') do
  @customers = Customer.all()
  erb :customers
end

get ('/customers/:id') do
  @customer = Customer.find(params[:id].to_i)
end
