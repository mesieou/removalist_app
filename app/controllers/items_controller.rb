class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :create]
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    if current_user
      @kart = Kart.find_by(user_id: current_user.id)
    else
    @kart = Kart.create if @kart.nil?
    @distance_matrix_array = fetch_distances
    raise
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
    distance_matrix_array = []

    #looping through the next 7 days
    (0..6).to_a.each_with_index do |day, index|
      Time.zone = 'Melbourne'
      next_day =  Date.tomorrow.to_time + day.day
      start_time = next_day.change(hour: 6, min: 0, sec: 0).in_time_zone
      end_time = next_day.change(hour: 17, min: 0, sec: 0).in_time_zone
      todays_bookings = get_todays_bookings(day)

      # Added distance matrix object when no bookings
      if todays_bookings.count == 0
        pairs = []
        distance_matrix_request_1 = {
        origins: [home_address],
        destinations: [new_address_pick_up, new_address_drop_off],
        travelMode: 'DRIVING'
        }
        pairs << { "pair #{index}" => [distance_matrix_request_1] }
        distance_matrix_array << pairs

      # Added distance matrix object when 1 booking
      elsif todays_bookings.count == 1
        pairs = []
        next_booking_pick_up = todays_bookings.first.location.pick_up
        next_booking_drop_off = todays_bookings.first.location.drop_off
        #before 1st booking
        distance_matrix_request_1 = {
        origins: [next_booking_pick_up],
        destinations: [new_address_drop_off, home_address],
        travelMode: 'DRIVING'
        }
        #after 1st booking
        distance_matrix_request_2 = {
        origins: [next_booking_drop_off],
        destinations: [new_address_pick_up],
        travelMode: 'DRIVING'
        }
        distance_matrix_request_3 = {
        origins: [new_address_drop_off],
        destinations: [home_address],
        travelMode: 'DRIVING'
        }
        pairs << { "pair #{index}" => [distance_matrix_request_1, distance_matrix_request_2, distance_matrix_request_3] }
        distance_matrix_array << pairs
      # Added distance matrix object when 2 or more bookings
      else
        todays_bookings.each_with_index do |booking, index|
          pairs = []
          if booking != todays_bookings.last && booking != todays_bookings.first
            next_booking_pick_up = todays_bookings[index].location.pick_up
            next_booking_drop_off = todays_bookings[index].location.drop_off
            if todays_bookings.length > 3
              after_next_booking_pick_up = todays_bookings[index + 1].location.pick_up
              after_next_booking_drop_off = todays_bookings[index + 1].location.drop_off
            end
            distance_matrix_request_1 = {
            origins: [next_booking_drop_off],
            destinations: [new_address_pick_up],
            travelMode: 'DRIVING'
            }
            distance_matrix_request_2 = {
            origins: [new_address_drop_off],
            destinations: [after_next_booking_pick_up],
            travelMode: 'DRIVING'
            }
            pairs << { "pair #{index}" => [distance_matrix_request_1, distance_matrix_request_2] }
          elsif booking == todays_bookings.first
            next_booking_pick_up = todays_bookings.first.location.pick_up
            next_booking_drop_off = todays_bookings.first.location.drop_off
            #before 1st booking
            distance_matrix_request_1 = {
              origins: [next_booking_pick_up],
              destinations: [new_address_drop_off, home_address],
              travelMode: 'DRIVING'
            }
            pairs << { "pair #{index}" => [distance_matrix_request_1] }
          elsif booking == todays_bookings.last
            next_booking_pick_up = todays_bookings.last.location.pick_up
            next_booking_drop_off = todays_bookings.last.location.drop_off
            #after 1st booking
            distance_matrix_request_1 = {
              origins: [next_booking_drop_off],
              destinations: [new_address_pick_up],
              travelMode: 'DRIVING'
             }
            distance_matrix_request_2 = {
              origins: [new_address_drop_off],
              destinations: [home_address],
              travelMode: 'DRIVING'
             }
            pairs << { "pair #{index}" => [distance_matrix_request_1, distance_matrix_request_2] }
          end
          distance_matrix_array << pairs
        end
      end
    end
    distance_matrix_array
  end

  def get_todays_bookings(day)
    next_available_start_time = set_available_times(day)[0]
    next_available_end_time = set_available_times(day)[1]
    todays_bookings = Booking.where('start_date_time >= ? AND start_date_time <= ?', next_available_start_time, next_available_end_time).order(:start_date_time)
  end

  def set_available_times(day)
    Time.zone = 'Melbourne'
    end_day =  Date.tomorrow.to_time + day.day
    next_available_start_time = end_day.change(hour: 6, min: 0, sec: 0).in_time_zone
    next_available_end_time = end_day.change(hour: 17, min: 0, sec: 0).in_time_zone
    [next_available_start_time, next_available_end_time]
  end

  def item_params
    params.require(:item).permit(:name, :estimated_total_loading_time, :kart_id)
  end
end
