class AddDatesToListings < ActiveRecord::Migration[5.1]
  def change
  	add_column :listings, :date_start, :date
  	add_column :listings, :date_end, :date
  	add_column :listings, :performance_count, :integer
  end
end
