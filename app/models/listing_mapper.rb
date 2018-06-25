class ListingMapper < ActiveRecord::Base
  validates :work_uri, presence: true
  validates :work_uri, uniqueness: { scope: [:source_id, :composer, :work] }
end
