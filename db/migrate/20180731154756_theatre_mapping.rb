class TheatreMapping < ActiveRecord::Migration[5.1]
  def change
    create_table :theatre_mapping do |t|
    	t.string :name
    	t.string :opera_america_name
    	t.timestamps
    end
  end
end
