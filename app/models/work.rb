class Work < ActiveRecord::Base
  validates :name, presence: true
	validates :uri, presence: true

	belongs_to :composer, inverse_of: :works
	has_many :listing_mappers, primary_key: :uri, foreign_key: :work_uri
	has_many :listings, through: :listing_mappers


	def self.searchable_columns
	  [:aka, :name, :wikipedia_text]
	end
end
