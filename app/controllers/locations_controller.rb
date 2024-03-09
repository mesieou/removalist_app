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

  def fetch_distances
    home_address = "1 Aberdeen Road, Blackburn South VIC"
    location = Location.find(params[:id])
    bookings = get_bookings_ordered(0)
    todays_bookings = get_todays_bookings(0)
    next_booking = bookings.first

    if next_booking == todays_bookings.first && todays_bookings.length == 1
      start_address = home_address
      end_address =  home_address
    elsif next_booking == todays_bookings.first && todays_bookings.length >= 1
      start_address = home_address
      end_address = next_booking.location.address
    elsif next_booking != todays_bookings.first && todays_bookings.length >= 1 && next_booking != todays_bookings.last
      start_address = previous_booking.location.address
      end_address = next_booking.location.address
    elsif next_booking == todays_bookings.last && todays_bookings.length >= 1
      start_address = previous_booking.location.address
      end_address = home_address
    end
  end

  def get_bookings_ordered(day)
    next_available_start_time = set_available_times(day)[0]
    bookings_ordered = Booking.where('start_date_time >= ?', next_available_start_time).order(:start_date_time)
  end

  def get_todays_bookings(day)
    next_available_start_time = set_available_times(day)[0]
    next_available_end_time = set_available_times(day)[1]
    todays_bookings = Booking.where('start_date_time >= ? AND start_date_time <= ?', next_available_start_time, next_available_end_time)
  end

  def set_available_times(from_day)
    Time.zone = 'Melbourne'
    next_day =  Date.tomorrow.to_time + from_day.day
    end_day = next_day
    next_available_start_time = next_day.change(hour: 6, min: 0, sec: 0).in_time_zone
    next_available_end_time = end_day.change(hour: 17, min: 0, sec: 0).in_time_zone
    [next_available_start_time, next_available_end_time]
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
