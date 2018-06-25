class Listing < ActiveRecord::Base
	belongs_to :source, inverse_of: :listings
  attr_accessor :count_entries
end
