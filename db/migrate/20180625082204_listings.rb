class Listings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
    	t.integer :source_id
    	t.string :composer
    	t.string :work
    	t.string :additional_text
    	t.timestamps
    end
  end
end
