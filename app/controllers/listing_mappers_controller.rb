class ListingMappersController < ApplicationController

  def create
    source_id = params[:source_id]
    listing_mapper = ListingMapper.new(listing_mappers_params)
    listing_mapper.map_key = params[:composer].downcase + params[:work].downcase

		if listing_mapper.save
			redirect_to source_path(source_id)
		end
  end

  private

    def listing_mappers_params
      params.permit(:composer, :work, :work_uri)
    end

end