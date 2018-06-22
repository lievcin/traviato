class AddComposer < ActiveRecord::Migration[5.1]
  def change
    create_table :composers do |t|
    	t.decimal :mood_score
    	t.string :name
      t.string :other_names
    	t.date :date_of_birth
    	t.date :date_of_death
    	t.string :place_of_birth
      t.string :place_of_death
      t.string :gender
      t.text :bio
    	t.timestamps
    end
  end
end
