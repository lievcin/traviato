class AddUniqueConstrain < ActiveRecord::Migration[5.1]
  def change
		add_index :works, [:uri, :composer_uri], :unique => true
  end
end
