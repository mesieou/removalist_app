class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :create]
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    if current_user
      @kart = Kart.find_by(user_id: current_user.id)
    else
    @kart = Kart.create if @kart.nil?
    end

    if params[:search_input].present?
      @items = ListOfItem.search(params[:search_input])
    else
      @items = ListOfItem.limit(8)
    end
  end

  def create
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
        format.html { redirect_to available_path, notice: 'Items were successfully added to your kart.'}
        format.json
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json
      end
    end
  end



  def fetch_distances
    home_address = "1 Aberdeen Road, Blackburn South VIC"
    new_address_pick_up = Location.last.pick_up
    new_address_drop_off = Location.last.drop_off

    bookings = get_bookings_ordered(0)

    next_booking_pick_up = bookings.first.location.pick_up
    next_booking_drop_off = bookings.first.location.drop_off

    after_next_booking_pick_up = bookings.second.location.pick_up
    after_next_booking_drop_off = bookings.second.location.drop_off

    distance_matrix_array = []

    (0.6).to_a.each do |day|
      Time.zone = 'Melbourne'
      next_day =  Date.tomorrow.to_time + day.day
      start_time = next_day.change(hour: 6, min: 0, sec: 0).in_time_zone
      end_time = next_day.change(hour: 17, min: 0, sec: 0).in_time_zone
      todays_bookings = get_todays_bookings(day)

      # no bookings
      if todays_bookings.count == 0
        distance_matrix_request_1 = {
        origins: [home_address],
        destinations: [new_address_pick_up, new_address_drop_off],
        travelMode: 'DRIVING',
        transitOptions: TransitOptions,
        drivingOptions: DrivingOptions,
        unitSystem: UnitSystem,
        avoidHighways: Boolean,
        avoidTolls: Boolean
       }
        distance_matrix_array << distance_matrix_request_1

      # 1 booking
      elsif todays_bookings.count == 1
       #before 1st booking
       distance_matrix_request_1 = {
        origins: [next_booking_pick_up],
        destinations: [new_address_drop_off, home_address],
        travelMode: 'DRIVING',
        transitOptions: TransitOptions,
        drivingOptions: DrivingOptions,
        unitSystem: UnitSystem,
        avoidHighways: Boolean,
        avoidTolls: Boolean
       }
       #after 1st booking
       distance_matrix_request_2 = {
        origins: [next_booking_drop_off],
        destinations: [new_address_pick_up],
        travelMode: 'DRIVING',
        transitOptions: TransitOptions,
        drivingOptions: DrivingOptions,
        unitSystem: UnitSystem,
        avoidHighways: Boolean,
        avoidTolls: Boolean
       }
       distance_matrix_request_3 = {
        origins: [new_address_drop_off],
        destinations: [home_address],
        travelMode: 'DRIVING',
        transitOptions: TransitOptions,
        drivingOptions: DrivingOptions,
        unitSystem: UnitSystem,
        avoidHighways: Boolean,
        avoidTolls: Boolean
       }
       distance_matrix_array << [ distance_matrix_request_1, distance_matrix_request_2, distance_matrix_request_3 ]

      # 2+ bookings
      else
        distance_matrix_request_1 = {
        origins: [next_booking_drop_off],
        destinations: [new_address_pick_up],
        travelMode: 'DRIVING',
        transitOptions: TransitOptions,
        drivingOptions: DrivingOptions,
        unitSystem: UnitSystem,
        avoidHighways: Boolean,
        avoidTolls: Boolean
        }
        distance_matrix_request_2 = {
        origins: [new_address_drop_off],
        destinations: [after_next_booking_pick_up],
        travelMode: 'DRIVING',
        transitOptions: TransitOptions,
        drivingOptions: DrivingOptions,
        unitSystem: UnitSystem,
        avoidHighways: Boolean,
        avoidTolls: Boolean
        }
        distance_matrix_array << [ distance_matrix_request_1, distance_matrix_request_2 ]
      end
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

  def item_params
    params.require(:item).permit(:name, :estimated_total_loading_time, :kart_id)
  end
end
