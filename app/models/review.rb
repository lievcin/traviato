class Review < ActiveRecord::Base

	belongs_to :listing_mapper, primary_key: :map_key, foreign_key: :map_key

  def master_work
  	listing_mapper.master_work
  end

  # def total_entries()
  #   q = "SELECT SUM(l.performance_count) " +
  #       "FROM listings l WHERE l.source_id = " + id.to_s
  #   ActiveRecord::Base.connection.execute(q)[0]["sum"]
  # end

  # def total_mapped_entries
		# q = "SELECT SUM(l.performance_count) " +
		# 	  "FROM listings l INNER JOIN listing_mappers lm ON l.map_key = lm.map_key " +
		# 	  "WHERE l.source_id = " + id.to_s
  #   ActiveRecord::Base.connection.execute(q)[0]["sum"]
  # end

  # def total_unmapped_entries
  #   q = "SELECT SUM(l.performance_count) " +
  #       "FROM listings l LEFT JOIN listing_mappers lm ON l.map_key = lm.map_key " +
  #       "WHERE lm.work_uri IS NULL AND l.source_id = " + id.to_s
  #   ActiveRecord::Base.connection.execute(q)[0]["sum"] || 0
  # end

  # def percent_listings_mapped
  #   # binding.pry
  # 	100 * total_mapped_entries / ([total_mapped_entries + total_unmapped_entries, 1].max)
  # end

  # def total_mapped_works
  #   Listing.find_by_sql("SELECT DISTINCT l.composer, l.work
  #     FROM listings l INNER JOIN listing_mappers lm ON l.map_key = lm.map_key " +
  #     "AND l.source_id = " + id.to_s).count
  # end

  # def total_unmapped_works
  #   Listing.find_by_sql("SELECT DISTINCT l.composer, l.work
  #     FROM listings l LEFT JOIN listing_mappers lm ON l.map_key = lm.map_key
  #     WHERE lm.work_uri IS NULL AND l.source_id = " + id.to_s).count
  # end

  # def percent_works_mapped
  #   100 * total_mapped_works / ([total_mapped_works + total_unmapped_works, 1].max)
  # end

end
