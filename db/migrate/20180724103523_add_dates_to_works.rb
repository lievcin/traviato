class AddDatesToWorks < ActiveRecord::Migration[5.1]
  def change
  	add_column :works, :premiere_date, :integer
  end
end
