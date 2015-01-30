require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  @bands = Band.all()
  erb(:bands)
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
  venue_ids = params['venue_ids']
  name = params['name']
  if venue_ids
    band.add_venues(params.fetch('venue_ids'))
  end
  if name
    band.update({:name => name})
  end
  redirect back
end

delete("/bands/:id") do
  band = Band.find(params.fetch('id').to_i())
  band.destroy()
  redirect("/bands")
end

delete("/venues/:id") do
  venue = Venue.find(params.fetch('id').to_i())
  venue.destroy()
  redirect("/venues")
end

patch("/venues/:id") do
  venue = Venue.find(params.fetch('id').to_i())
  band = Band.find(params.fetch('band_id').to_i())
  venue.bands.delete(band)
  redirect back
end