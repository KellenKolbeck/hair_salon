require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")

DB = PG.connect({:dbname => "hair_salon_test"})

get('/') do
  @name = Stylist.all()
  erb(:index)
end

get("/new_stylist") do
  @name = Stylist.all()
  erb(:index)
end

post("/new_stylist") do
  name = params.fetch('name')
  @name = Stylist.all()
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  redirect("/new_stylist")
end

# get("/stylist_client_list") do
#
# end
