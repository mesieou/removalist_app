class LocationsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def show
    @book
  end

  def new
    @location = Location.new
  end

  def create
    @location_pick_up = Location.new(params[:from])
    @location_pick_up.pick_up_or_drop_off = 'pick up'
    @location_drop_off = Location.new(params[:to])
    @location_drop_off.pick_up_or_drop_off = 'drop_off'

    if @location_pick_up.create! && @location_drop_off.create!
      redirect_to
    else
      render new_location_booking_index_path status: :unprocessable_entity
    end

  end

  private
  def location_params
    params.require(:location).permit(:address)
  end
end
