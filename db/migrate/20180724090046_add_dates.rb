class AddDates < ActiveRecord::Migration[5.1]
  def change
  	add_column :composers, :date_of_birth, :integer
  	add_column :composers, :date_of_death, :integer
  end
end
