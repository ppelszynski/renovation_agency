class BuildingLocationsController < ApplicationController
  before_action :set_form

  def new; end

  def edit; end

  def create
    if @form.save
      flash[:success] = 'Location created.'
      redirect_to building_locations_path
    else
      render :new
    end
  end

  def update
    if @form.save
      flash[:success] = 'Location updated.'
      redirect_to building_locations_path
    else
      render :new
    end
  end

  def destroy
    if BuildingLocation.find(params[:id]).destroy
      flash[:success] = 'Location deleted.'
      redirect_to building_locations_path
    else
      render :new
    end
  end

  def index
    @locations = BuildingLocation.all
  end

  private

  def set_form
    @form ||= if params[:id]
                BuildingLocationForm.new(BuildingLocation.find(params[:id]), params[:building_location])
              elsif params[:building_location]
                BuildingLocationForm.new(BuildingLocation.new, params[:building_location])
              else
                BuildingLocationForm.new(BuildingLocation.new)
              end
  end
end
