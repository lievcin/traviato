class ProposalsController < ApplicationController

  autocomplete :composer, :name, full_search: :true

  def index
    @composer = params[:composer]
    @work = params[:work].camelize
    @source_id = params[:source_id]

    @results = Work.includes(:composer).basic_search(@work)
    # @results = Work.includes(:composer).basic_search(@work + ' ' + @composer)
    # @results = Work.includes(:composer).fuzzy_search(@work + ' ' + @composer)
    @listing_mapper = ListingMapper.new

    @new_work = Work.new

  end

end
