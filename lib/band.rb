class Band < ActiveRecord::Base
  has_and_belongs_to_many :venues, -> {order('name')}
  validates(:name, {:presence => true})
  validates_uniqueness_of(:name, {:case_sensitive => false})
  before_save(:capitalize_band_name)
  Band.order('name')

  default_scope {order('name')}

  define_method(:add_venues) do |venue_ids|
    venue_ids.each() do |venue_id|
      self.venues << Venue.find(venue_id.to_i())
    end
  end


  private

  define_method(:capitalize_band_name) do
    self.name[0]=(name[0].capitalize())
  end

end