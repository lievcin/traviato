class FixListing < ActiveRecord::Migration[5.1]
  def change
		add_column :listings, :map_key, :string
		add_column :listing_mappers, :map_key, :string
  end
end
