require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")
require('pry')

DB = PG.connect({:dbname => "hair_salon_test"})

get('/') do
  erb(:index)
end

get("/new_stylist") do
  erb(:stylist_form)
end

post("/stylist_list") do
  name = params.fetch('name')
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  redirect("/stylist_list")
end

get("/stylist_list") do
  @stylists = Stylist.all()
  erb(:stylist_list)
end

get("/stylist/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i)
  erb(:stylist_page)
end
