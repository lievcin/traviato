class ProposalsController < ApplicationController

  def index
    @composer = params[:composer]
    @work = params[:work]
    @source_id = params[:source_id]

    @results = Work.includes(:composer).basic_search(@work + ' ' + @composer)

  end

 private

  def set_listing
    @listing = Listing.find(params[])
  end

end
