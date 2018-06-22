class UpdateDob < ActiveRecord::Migration[5.1]
  def change
    remove_column :composers, :date_of_birth
    remove_column :composers, :date_of_death
    add_column :composers, :year_of_birth, :integer
    add_column :composers, :year_of_death, :integer
  end
end
