class CleanupComposers < ActiveRecord::Migration[5.1]
  def change
    add_column :composers, :url, :string
    add_column :composers, :uri, :string
    add_column :composers, :country, :string

    remove_column :composers, :year_of_birth
    remove_column :composers, :year_of_death
    remove_column :composers, :bio
    remove_column :composers, :place_of_birth
    remove_column :composers, :other_names

  end
end
