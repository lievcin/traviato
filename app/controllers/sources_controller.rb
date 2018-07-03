class SourcesController < ApplicationController

  before_action :set_source, only: [:show]

  def index
    @sources = Source.all
  end

  def show
  	@listings = ActiveRecord::Base.connection.execute("SELECT l.source_id, l.composer, l.work, count(*) as count_entries
  		FROM listings l LEFT JOIN listing_mappers lm ON l.map_key = lm.map_key
  		WHERE lm.source_id IS NULL AND l.source_id = " + params[:id].to_s + " GROUP BY l.source_id, l.composer, l.work ORDER BY 4 DESC")
  end

 private

  def set_source
    @source = Source.find(params[:id])
  end

end
