class ListingMapper < ActiveRecord::Base
  validates :work_uri, presence: true
  validates :work_uri, uniqueness: { scope: [:source_id, :composer, :work] }

	belongs_to :master_work, class_name: "Work", foreign_key: :work_uri, primary_key: :uri
	has_many :listings, primary_key: :map_key, foreign_key: :map_key

end
