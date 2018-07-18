class UniqueListingMapper < ActiveRecord::Migration[5.1]
  def change
		add_index :listing_mappers, [:composer, :work], :unique => true
  end
end
