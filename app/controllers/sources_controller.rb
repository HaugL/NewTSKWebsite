class SourcesController < ApplicationController

  def new
  	@source = Source.new
  	render 'edit'
  end

  def create
  	@source = Source.new(params[:source])

  	if @source.save
  		redirect_to source_path(@source)
  	else
  		render 'edit'
  	end

  end

  ###################################

  def edit
  	@source = Source.find(params[:id])
  end

  def update
  	@source = Source.find(params[:id])
  	@source.update_attributes(params[:source])

  	if @source.save
  		redirect_to source_path(@source)
  	else
  		render 'edit'
  	end
  end

  ####################################

  def index
  	@sources = Source.all
  end

  def show
  	@source = Source.find(params[:id])
  end

  ####################################
  def destroy
  	source = Source.find(params[:id])
  	#cannot destroy if there are products using this source
  end

end
