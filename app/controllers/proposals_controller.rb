class ProposalsController < ApplicationController

  def index
    @composer = params[:composer]
    @work = params[:work]
    @source_id = params[:source_id]

    @results = Work.includes(:composer).basic_search(@work + ' ' + @composer)
    @listing_mapper = ListingMapper.new

  end

end
