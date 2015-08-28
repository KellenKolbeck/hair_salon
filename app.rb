require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")

DB = PG.connect({:dbname => "hair_salon_test"})

get('/') do
  erb(:index)
end

get("/new_stylist") do
  erb(:new_stylist)
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
  @new_stylist = Stylist.find(params.fetch('id').to_i)
  erb(:stylist_page)
end

post("/clients") do
  title = params.fetch("title")
  stylist_id = params.fetch("stylist_id").to_i()
  @stylist = Stylist.find(stylist_id)
  @client = Client.new({:name => name, :stylist_id => stylist_id})
  @client.save()
  redirect("/stylist/:id")
end

# get("/stylists/:id/edit") do
#   @stylist = Stylist.find(params.fetch("id").to_i())
#   erb(:stylist_edit)
# end

patch("/stylists/:id") do
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name})
  erb(:stylist)
end

delete("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
end
