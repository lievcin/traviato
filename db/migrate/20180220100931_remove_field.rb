class RemoveField < ActiveRecord::Migration[5.1]
  def change
    remove_column :composers, :mood_score
  end
end
