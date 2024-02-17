class LocationsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def show
    @book
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    session[:pending_location] = @location.attributes
    redirect_to new_accesibility_booking_index_path
  end

  private
  def location_params
    params.require(:location).permit(addresses_attributes: [:pick_up, :drop_off],
    )
  end
end
