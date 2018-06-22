class Work < ActiveRecord::Base
  validates :name, presence: true

	belongs_to :composer, inverse_of: :works
end
