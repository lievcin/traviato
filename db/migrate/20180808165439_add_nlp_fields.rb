class AddNlpFields < ActiveRecord::Migration[5.1]
  def change
		add_column :reviews, :sentiment_score, :decimal
		add_column :reviews, :sentiment_magniture, :decimal
  end
end
