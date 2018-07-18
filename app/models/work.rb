class Work < ActiveRecord::Base
  validates :name, presence: true
	validates :uri, presence: true

	belongs_to :composer, inverse_of: :works, optional: true
	has_many :listing_mappers, primary_key: :uri, foreign_key: :work_uri
	has_many :listings, through: :listing_mappers


	def self.searchable_columns
	  [:aka, :name, :wikipedia_text]
	end

	def composer_name
	  composer.try(:name)
	end

	def composer_name=(name)
	  self.composer = Composer.find_by(name: name) if name.present?
	end
end
