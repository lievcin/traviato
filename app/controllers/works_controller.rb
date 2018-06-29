class WorksController < ApplicationController

  def search
  	@composer = params[:composer]
  	@work = params[:work]
  	@source_id = params[:source_id]

  	if params[:search_field]=='composer'
  		@results = Composer.includes(:works).basic_search(params[:search_param])
  		@results = @results.map{|c| c.works}.flatten
  	elsif params[:search_field]=='work'
  		@results = Work.includes(:composer).basic_search(params[:search_param])
  	end

  end

end