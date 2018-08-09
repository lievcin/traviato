class AddSourceToReviews < ActiveRecord::Migration[5.1]
  def change
  	add_column :reviews, :source_id, :integer
  	remove_column :reviews, :source
		add_index :reviews, :source_id
  end
end
