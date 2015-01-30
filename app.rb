require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  erb(:index)
end

get("/bands") do
  @bands = Band.all()
  erb(:bands)
end

get("/venues") do
  @venues = Venue.all()
  erb(:venues)
end

post("/venues") do
  Venue.create({:name => params.fetch('name')})
  redirect("/venues")
end

post("/bands") do
  Band.create({:name => params.fetch('name')})
  redirect("/bands")
end

get("/bands/:id") do
  @band = Band.find(params.fetch('id').to_i())
  @venues = Venue.all()
  erb(:band)
end

get("/venues/:id") do
  @venue = Venue.find(params.fetch('id').to_i())
  erb(:venue)
end

patch("/bands/:id") do
  band = Band.find(params.fetch('id').to_i())
  band.add_venues(params.fetch('venue_ids'))
  redirect back
end

