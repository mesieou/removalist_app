class LocationsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :edit, :update]

  def show
    @book
  end

  def new
    @location = Location.new
    @api = ENV["GOOGLEAPI"]
  end

  def create
    @location = Location.new(location_params)
    if @location.save!
      redirect_to add_accesibility_booking_index_path(@location)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    @location.update(location_params)
    if @location.save
      redirect_to items_booking_index_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private
  def location_params
    params.require(:location).permit(:pick_up, :drop_off, :pick_up_type_of_place, :drop_off_type_of_place, :pick_up_number_of_stories, :drop_off_number_of_stories, :pick_up_stairs_or_lift, :drop_off_stairs_or_lift)
  end
end
