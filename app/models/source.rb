class Source < ActiveRecord::Base
  validates :name, presence: true

  has_many :listings, inverse_of: :source
  attr_accessor :count_entries

  def total_entries
    q = "SELECT SUM(CASE WHEN l.source_id IN (6, 11) THEN CAST(l.additional_text AS INT) ELSE 1 END) " +
        "FROM listings l WHERE l.source_id = " + id.to_s
    ActiveRecord::Base.connection.execute(q)[0]["sum"]
  end

  def total_mapped_entries
		q = "SELECT SUM(CASE WHEN l.source_id IN (6, 11) THEN CAST(l.additional_text AS INT) ELSE 1 END) " +
			  "FROM listings l INNER JOIN listing_mappers lm ON l.map_key = lm.map_key " +
			  "WHERE l.source_id = " + id.to_s
    ActiveRecord::Base.connection.execute(q)[0]["sum"]
  end

  def total_unmapped_entries
    q = "SELECT SUM(CASE WHEN l.source_id IN (6, 11) THEN CAST(l.additional_text AS INT) ELSE 1 END) " +
        "FROM listings l LEFT JOIN listing_mappers lm ON l.map_key = lm.map_key " +
        "WHERE lm.work_uri IS NULL AND l.source_id = " + id.to_s
    ActiveRecord::Base.connection.execute(q)[0]["sum"] || 0
  end

  def percent_listings_mapped
    # binding.pry
  	100 * total_mapped_entries / ([total_mapped_entries + total_unmapped_entries, 1].max)
  end

  def total_mapped_works
    Listing.find_by_sql("SELECT DISTINCT l.composer, l.work
      FROM listings l INNER JOIN listing_mappers lm ON l.map_key = lm.map_key " +
      "AND l.source_id = " + id.to_s).count
  end

  def total_unmapped_works
    Listing.find_by_sql("SELECT DISTINCT l.composer, l.work
      FROM listings l LEFT JOIN listing_mappers lm ON l.map_key = lm.map_key
      WHERE lm.work_uri IS NULL AND l.source_id = " + id.to_s).count
  end

  def percent_works_mapped
    100 * total_mapped_works / ([total_mapped_works + total_unmapped_works, 1].max)
  end

end
