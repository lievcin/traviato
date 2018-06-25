class Source < ActiveRecord::Migration[5.1]
  def change
    create_table :sources do |t|
    	t.string :name
    	t.text :comments
    	t.timestamps
    end
  end
end
