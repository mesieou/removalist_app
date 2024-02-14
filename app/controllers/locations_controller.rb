class LocationsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def new
    @location = Location.new
    @booking = Booking.new
  end

  def create
  end
end
