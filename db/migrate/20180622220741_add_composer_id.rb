class AddComposerId < ActiveRecord::Migration[5.1]
  def change
    add_column :works, :composer_id, :integer
  end
end
