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

post("/new_stylist") do
  name = params.fetch('name')
  id = params.fetch('id').to_i
  @name = Stylist.all()
  erb(:index)
end
