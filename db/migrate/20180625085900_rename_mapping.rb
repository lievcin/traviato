class RenameMapping < ActiveRecord::Migration[5.1]
  def change
  	rename_table :mapping, :listing_mappers
  end
end
