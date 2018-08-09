class AddMapping < ActiveRecord::Migration[5.1]
  def change
		add_column :reviews, :map_key, :string
		remove_column :reviews, :work_uri
		remove_column :reviews, :processed
  end
end
