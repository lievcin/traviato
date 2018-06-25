class SourceMapping < ActiveRecord::Migration[5.1]
  def change
    create_table :mapping do |t|
    	t.integer :source_id
    	t.string :listing_composer
    	t.string :listing_work
    	t.string :work_uri
    	t.timestamps
    end
  end
end
