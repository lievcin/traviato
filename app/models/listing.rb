class Listing < ActiveRecord::Base
	belongs_to :source, inverse_of: :listings
	belongs_to :listing_mapper, primary_key: :map_key, foreign_key: :map_key
  attr_accessor :count_entries

  def master_work
  	listing_mapper.master_work
  end
end
