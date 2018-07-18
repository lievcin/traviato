class RemoveSourceListMapper < ActiveRecord::Migration[5.1]
  def change
    remove_column :listing_mappers, :source_id
  end
end
