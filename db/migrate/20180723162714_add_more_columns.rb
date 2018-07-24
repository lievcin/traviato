class AddMoreColumns < ActiveRecord::Migration[5.1]
  def change
    enable_extension "hstore"
    add_column :composers, :information, :hstore
    add_column :works, :information, :hstore
  end
end
