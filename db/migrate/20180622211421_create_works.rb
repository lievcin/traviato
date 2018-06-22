class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
    	t.string :name
    	t.string :url
    	t.string :uri
    	t.string :composer_uri
    	t.timestamps
    end
  end
end
