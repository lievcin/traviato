class AddVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
    	t.string :name
    	t.string :url
    	t.string :city
    	t.string :state
    	t.string :country
    	t.timestamps
    end
  end
end
