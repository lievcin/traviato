class Source < ActiveRecord::Base
  validates :name, presence: true
  has_many :listings, inverse_of: :source
  attr_accessor :count_entries

  scope :of_listings, -> { where(content: 'listings') }
  scope :of_reviews, -> { where(content: 'reviews') }

  def total_entries
    if content=='listings'
      q = "SELECT SUM(l.performance_count) " +
          "FROM listings l WHERE l.source_id = " + id.to_s
      ActiveRecord::Base.connection.execute(q)[0]["sum"]
    elsif content=='reviews'
      q = "SELECT count(*) " +
          "FROM reviews r WHERE r.source_id = " + id.to_s
      ActiveRecord::Base.connection.execute(q)[0]["count"]
    end

  end

  def total_mapped_entries
    if content=='listings'
      q = "SELECT SUM(l.performance_count) " +
          "FROM listings l INNER JOIN listing_mappers lm ON l.map_key = lm.map_key " +
          "WHERE l.source_id = " + id.to_s
      ActiveRecord::Base.connection.execute(q)[0]["sum"]
    elsif content=='reviews'
      q = "SELECT COUNT(*) " +
          "FROM reviews r INNER JOIN listing_mappers lm ON r.map_key = lm.map_key " +
          "WHERE r.source_id = " + id.to_s
      ActiveRecord::Base.connection.execute(q)[0]["count"]
    end

  end

  def total_unmapped_entries
    if content=='listings'
      q = "SELECT SUM(l.performance_count) " +
          "FROM listings l LEFT JOIN listing_mappers lm ON l.map_key = lm.map_key " +
          "WHERE lm.work_uri IS NULL AND l.source_id = " + id.to_s
      ActiveRecord::Base.connection.execute(q)[0]["sum"] || 0
    elsif content=='reviews'
      q = "SELECT COUNT(*) " +
          "FROM reviews r LEFT JOIN listing_mappers lm ON r.map_key = lm.map_key " +
          "WHERE lm.work_uri IS NULL AND r.source_id = " + id.to_s
      ActiveRecord::Base.connection.execute(q)[0]["count"] || 0
    end

  end

  def percent_listings_mapped
    # binding.pry
  	100 * total_mapped_entries / ([total_mapped_entries + total_unmapped_entries, 1].max)
  end

  def total_mapped_works
    if content=='listings'
      Listing.find_by_sql("SELECT DISTINCT l.composer, l.work
        FROM listings l INNER JOIN listing_mappers lm ON l.map_key = lm.map_key " +
        "AND l.source_id = " + id.to_s).count
    elsif content=='reviews'
      Listing.find_by_sql("SELECT DISTINCT r.composer, r.work
        FROM reviews r INNER JOIN listing_mappers lm ON r.map_key = lm.map_key " +
        "AND r.source_id = " + id.to_s).count
    end
  end

  def total_unmapped_works
    if content=='listings'
      Listing.find_by_sql("SELECT DISTINCT l.composer, l.work
        FROM listings l LEFT JOIN listing_mappers lm ON l.map_key = lm.map_key
        WHERE lm.work_uri IS NULL AND l.source_id = " + id.to_s).count
    elsif content=='reviews'
      Listing.find_by_sql("SELECT DISTINCT r.composer, r.work
        FROM reviews r LEFT JOIN listing_mappers lm ON r.map_key = lm.map_key
        WHERE lm.work_uri IS NULL AND r.source_id = " + id.to_s).count
    end
  end

  def percent_works_mapped
    100 * total_mapped_works / ([total_mapped_works + total_unmapped_works, 1].max)
  end

end
