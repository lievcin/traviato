class ModifyWiki < ActiveRecord::Migration[5.1]
  def change
    add_column :composers, :aka, :text
    add_column :works, :aka, :text
  end
end
