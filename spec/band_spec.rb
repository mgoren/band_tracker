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



end