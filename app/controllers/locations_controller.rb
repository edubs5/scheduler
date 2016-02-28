class LocationsController < ApplicationController
  def index
    @locations = current_user.locations
  end

  def new
    @location = Location.new
  end

  def create
    @locations = current_user.locations
    params["location"]["user_id"] = current_user.id
    @location = Location.create(location_params)
    respond_to do |format|
      format.js
    end
  end

  def update
    @locations = current_user.locations
    @location = Location.friendly.find(params[:id])
    @location.update_attributes(location_params)
  end

  def edit
    @location = Location.friendly.find(params[:id])
    @locations = current_user.locations
  end

  def destroy
    @location = Location.find_by_id(params[:id])
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_path }
      format.js
    end
  end

  private

  def location_params
    params.require(:location).permit(
      :name,
      :user_id
    )
  end
end
