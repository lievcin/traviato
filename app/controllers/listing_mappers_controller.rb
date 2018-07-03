class ListingMappersController < ApplicationController

  def create
    listing_mapper = ListingMapper.new(
    												source_id: params[:source_id],
    												composer: params[:composer],
    												work: params[:work],
    												work_uri: params[:work_uri],
    												map_key: params[:composer].downcase + params[:work].downcase + params[:source_id].to_s
    												)
		if listing_mapper.save
			redirect_to source_path(params[:source_id])
		end
  end

end