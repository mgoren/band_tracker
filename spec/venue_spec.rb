require('spec_helper')

describe(Venue) do
  it{should have_and_belong_to_many(:bands)}
  it{should validate_presence_of(:name)}
  it{should validate_uniqueness_of(:name)}

  describe(:titlecase_venue_name) do
    it("will titlecase venue name") do
      venue1 = Venue.create({:name => "music hall of williamsburg"})
      expect(venue1.name()).to(eq("Music Hall Of Williamsburg"))
    end
  end




end