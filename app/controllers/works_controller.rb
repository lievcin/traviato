class WorksController < ApplicationController

  def search
  	@composer = params[:composer]
  	@work = params[:work]
  	@source_id = params[:source_id]
    @new_work = Work.new

  	if params[:search_field]=='composer'
  		@results = Composer.includes(:works).basic_search(params[:search_param])
  		@results = @results.map{|c| c.works}.flatten
  	elsif params[:search_field]=='work'
  		@results = Work.includes(:composer).basic_search(params[:search_param])
  	end

  end

  def create
    source_id = params[:source_id]
    uri = 'W' + (Work.last.id+1).to_s

    work = Work.new(name: params[:work][:name],
                    uri: uri,
                    aka: params[:work][:name]
                    )

    if not params[:work][:composer].empty?
      composer = Composer.find_by(name: params[:work][:composer])
      composer_id = composer.id
      composer_uri = composer.uri
      work.composer_id = composer_id
      work.composer_uri = composer_uri
    end

    if work.save
      listing_mapper = ListingMapper.new(work_uri: uri, composer: params[:listing_composer], work: params[:listing_work])
      listing_mapper.map_key = params[:listing_composer].downcase + params[:listing_work].downcase
      if listing_mapper.save
        redirect_to source_path(source_id)
      end
    end

  end

end