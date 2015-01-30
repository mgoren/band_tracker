class CreateTables < ActiveRecord::Migration
  def change

    create_table(:bands) do |t|
      t.column(:name, :string)
    end

    create_table(:venues) do |t|
      t.column(:name, :string)
    end

    create_table(:bands_venues) do |t|
      t.column(:band_id, :integer)
      t.column(:venue_id, :integer)
    end

    def self.up
      add_index :bands_venues, :band_id
      add_index :bands_venues, :venue_id
      add_index :bands, :name
      add_index :venues, :name
    end

    def self.down
      remove_index :bands_venues, :band_id
      remove_index :bands_venues, :venue_id
      remove_index :bands, :name
      remove_index :venues, :name
    end

  end
end
