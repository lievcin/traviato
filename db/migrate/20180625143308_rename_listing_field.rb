class RenameListingField < ActiveRecord::Migration[5.1]
  def change
  	rename_column :listing_mappers, :listing_composer, :composer
  	rename_column :listing_mappers, :listing_work, :work
  end
end
