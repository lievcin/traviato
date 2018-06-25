class AddTextToComposers < ActiveRecord::Migration[5.1]
  def change
    add_column :composers, :wikipedia_text, :text
    add_column :works, :wikipedia_text, :text
  end
end
