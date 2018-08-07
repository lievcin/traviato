class AddLocationToListings < ActiveRecord::Migration[5.1]
  def change
  	add_column :listings, :theatre, :string
  	add_column :listings, :city, :string
  	add_column :listings, :state, :string
  	add_column :listings, :country, :string
  end
end
