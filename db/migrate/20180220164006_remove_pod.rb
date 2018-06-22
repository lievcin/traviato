class RemovePod < ActiveRecord::Migration[5.1]
  def change
    remove_column :composers, :place_of_death
  end
end
