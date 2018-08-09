class FixSpelling < ActiveRecord::Migration[5.1]
  def change
  	rename_column :reviews, :sentiment_magniture, :sentiment_magnitude
  end
end
