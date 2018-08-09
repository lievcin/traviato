class ReviewFieldRename < ActiveRecord::Migration[5.1]
  def change
		rename_column :reviews, :venue, :theatre
  end
end
