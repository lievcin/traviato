class AddSourceType < ActiveRecord::Migration[5.1]
  def change
  	add_column :sources, :content, :string
  end
end
