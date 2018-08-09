class AddReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
    	t.string :source
    	t.string :title
    	t.string :work
    	t.string :composer
    	t.string :venue
    	t.date :review_date
    	t.text :full_text
    	t.integer :rating
    	t.hstore :processed
    	t.string :work_uri
    	t.timestamps
    end
  end
end
