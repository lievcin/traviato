class AddCompRestr < ActiveRecord::Migration[5.1]
  def change
		add_index :composers, [:uri], :unique => true
  end
end