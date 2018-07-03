class Work < ActiveRecord::Base
  validates :name, presence: true
	validates :uri, presence: true

	belongs_to :composer, inverse_of: :works

	def self.searchable_columns
	  [:aka, :name, :wikipedia_text]
	end
end
