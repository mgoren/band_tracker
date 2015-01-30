require('spec_helper')

describe(Band) do
  it{should have_and_belong_to_many(:venues)}
  it{should validate_presence_of(:name)}
  it{should validate_uniqueness_of(:name)}

  describe(:titlecase_band_name) do
    it("will titlecase band name") do
      band1 = Band.create({:name => "world inferno friendship society"})
      expect(band1.name()).to(eq("World Inferno Friendship Society"))
    end
  end

  describe(:add_venues) do
    it("will add associate venue_ids from checkboxes with this band") do
      band1 = Band.create({:name => "world inferno friendship society"})
      venue1 = Venue.create({:name => "music hall of williamsburg"})
      venue2 = Venue.create({:name => "hammerstein ballroom"})
      venue3 = Venue.create({:name => "Tipitina's"})      
      checkbox_return1 = [venue1.id().to_s()]
      checkbox_return2 = [venue2.id().to_s(), venue3.id().to_s()]
      band1.add_venues(checkbox_return1)
      band1.add_venues(checkbox_return2)
      expect(band1.venues()).to eq([venue2, venue1, venue3]) # rearranged because will return in alphebatical order
    end
  end


end