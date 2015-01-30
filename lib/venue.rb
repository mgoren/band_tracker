class Venue < ActiveRecord::Base
  has_and_belongs_to_many :bands, -> {order('name')}
  validates(:name, {:presence => true})
  validates_uniqueness_of(:name, {:case_sensitive => false})
  before_save(:titlecase_venue_name)
  Band.order('name')

  default_scope {order('name')}


  private

  define_method(:titlecase_venue_name) do
    self.name=(name().titlecase())
  end

end