class Source < ActiveRecord::Base
  validates :name, presence: true

  has_many :listings, inverse_of: :source

  def total_entries
  	listings.count
  end

  def total_mapped_entries
		Listing.find_by_sql("SELECT *
			FROM listings l INNER JOIN listing_mappers lm ON l.composer = lm.listing_composer
			AND l.work = lm.listing_work AND l.source_id = lm.source_id").count
  end

  def total_unmapped_entries
		Listing.find_by_sql("SELECT *
			FROM listings l LEFT JOIN listing_mappers lm ON l.composer = lm.listing_composer
			AND l.work = lm.listing_work AND l.source_id = lm.source_id
			WHERE lm.source_id IS NULL").count
  end

  def percent_listings_mapped
  	100 * total_mapped_entries / (total_mapped_entries + total_unmapped_entries)
  end

end
