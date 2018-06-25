class Listing < ActiveRecord::Base
	belongs_to :source, inverse_of: :listings
end
