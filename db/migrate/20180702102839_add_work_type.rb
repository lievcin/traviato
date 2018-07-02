class AddWorkType < ActiveRecord::Migration[5.1]
  def change
    add_column :works, :work_type, :string
  end
end
