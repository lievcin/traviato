class SourcesController < ApplicationController

  before_action :set_source, only: [:show]

  def index
    @content = params[:content]
    if @content=='listings'
      @sources = Source.of_listings
    elsif @content=='reviews'
      @sources = Source.of_reviews
    end
  end

  def show
    if @source.content=='listings'
    	@entries = ActiveRecord::Base.connection.execute("SELECT l.source_id, l.composer, l.work,
        SUM(l.performance_count) as count_entries
    		FROM listings l LEFT JOIN listing_mappers lm ON l.map_key = lm.map_key
    		WHERE lm.work_uri IS NULL AND l.source_id = " + params[:id].to_s + " GROUP BY l.source_id, l.composer, l.work ORDER BY 4 DESC")
    elsif @source.content=='reviews'
      @entries = ActiveRecord::Base.connection.execute("SELECT r.source_id, r.composer, r.work, r.url as count_entries
        FROM reviews r LEFT JOIN listing_mappers lm ON r.map_key = lm.map_key
        WHERE lm.work_uri IS NULL AND r.source_id = " + params[:id].to_s + " GROUP BY r.source_id, r.composer, r.work, r.url ORDER BY r.work")
    end
  end

 private

  def set_source
    @source = Source.find(params[:id])
  end

end
