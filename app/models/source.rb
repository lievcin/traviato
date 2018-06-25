class Source < ActiveRecord::Base
  validates :name, presence: true

  has_many :listings, inverse_of: :source

  def total_entries
  	listings.count
  end

  def total_mapped_entries
		Listing.find_by_sql("SELECT *
			FROM listings l INNER JOIN listing_mappers lm ON l.composer = lm.composer
			AND l.work = lm.work AND l.source_id = lm.source_id WHERE l.source_id = " + id.to_s).count
  end

  def total_unmapped_entries
		Listing.find_by_sql("SELECT *
			FROM listings l LEFT JOIN listing_mappers lm ON l.composer = lm.composer
			AND l.work = lm.work AND l.source_id = lm.source_id
			WHERE lm.source_id IS NULL AND l.source_id = " + id.to_s).count
  end

  def percent_listings_mapped
  	100 * total_mapped_entries / ([total_mapped_entries + total_unmapped_entries, 1].max)
  end

  def total_mapped_works
    Listing.find_by_sql("SELECT DISTINCT l.composer, l.work
      FROM listings l INNER JOIN listing_mappers lm ON l.composer = lm.composer
      AND l.work = lm.work AND l.source_id = lm.source_id AND l.source_id = " + id.to_s).count
  end

  def total_unmapped_works
    Listing.find_by_sql("SELECT DISTINCT l.composer, l.work
      FROM listings l LEFT JOIN listing_mappers lm ON l.composer = lm.composer
      AND l.work = lm.work AND l.source_id = lm.source_id
      WHERE lm.source_id IS NULL AND l.source_id = " + id.to_s).count
  end

  def percent_works_mapped
    100 * total_mapped_works / ([total_mapped_works + total_unmapped_works, 1].max)
  end

end
