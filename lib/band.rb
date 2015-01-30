class Band < ActiveRecord::Base
  has_and_belongs_to_many :venues, -> {order('name')}
  validates(:name, {:presence => true})
  validates_uniqueness_of(:name, {:case_sensitive => false})
  before_save(:titlecase_band_name)
  Band.order('name')

  default_scope {order('name')}


  private

  define_method(:titlecase_band_name) do
    self.name=(name().titlecase())
  end

end