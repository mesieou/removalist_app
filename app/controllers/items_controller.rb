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
    todays_bookings = get_todays_bookings(0)

    next_booking_pick_up = bookings.first.location.pick_up
    next_booking_drop_off = bookings.first.location.drop_off

    after_next_booking_pick_up = bookings.second.location.pick_up
    after_next_booking_drop_off = bookings.second.location.drop_off
    addresses = []

    (0.6).to_a.each do |day|
      Time.zone = 'Melbourne'
      next_day =  Date.tomorrow.to_time + day.day
      start_time = next_day.change(hour: 6, min: 0, sec: 0).in_time_zone
      end_time = next_day.change(hour: 17, min: 0, sec: 0).in_time_zone

      # no bookings
      # 1 booking
       #before 1st booking
       #after 1st booking
      # 2+ bookings
       #loop through todays bookings
        #if first booking of the day
        #if last booking of the day
        #if booking in the middle

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
