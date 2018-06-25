class ListingMapperController < ApplicationController

  def index
    @mappings = ListingMapping.all
  end

end