class BookingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :available]
  def index
  end
  def available
    @bookings = Booking.all
    @slots = display_available_slots()
    @kart = Kart.last
    raise
  end

  private
  def create_available_slots(travel_time_to, travel_time_from, booking_duration, day)
    Time.zone = 'Melbourne'
    next_day =  Date.tomorrow.to_time + day.day
    end_day = next_day
    next_available_start_time = next_day.change(hour: 6, min: 0, sec: 0).in_time_zone
    next_available_end_time = end_day.change(hour: 17, min: 0, sec: 0).in_time_zone
    bookings_ordered = Booking.where('start_date_time >= ?', next_available_start_time).order(:start_date_time)
    todays_bookings = Booking.where('start_date_time >= ? AND start_date_time <= ?', next_available_start_time, next_available_end_time)

    next_booking = bookings_ordered.first
    if !next_booking.nil?
     next_booking_start_time = next_booking.start_date_time
     next_booking_end_time = next_booking.end_date_time
     time_slots = []
     count = 0
     while next_available_start_time < next_available_end_time && next_booking.present?
      if todays_bookings.count == 0
        available_end_date_time = next_available_end_time
        available_start_date_time = next_available_start_time
        time_slots << [available_start_date_time, available_end_date_time]
      elsif ((next_booking_start_time - next_available_start_time) / 60 ).minutes >         (booking_duration.minutes + travel_time_to.minutes)
       available_end_date_time = next_booking_start_time - travel_time_to.minutes
       available_start_date_time = next_available_start_time
       if available_end_date_time > next_available_end_time
          time_slots << [available_start_date_time, next_available_end_time]
       else
          time_slots << [available_start_date_time, available_end_date_time]
       end
      end
      if next_booking_end_time > next_available_end_time
        next_available_start_time += 1.day
        count += 1
        next_booking = bookings_ordered[count]
        return time_slots if next_booking.nil?
        next_booking_start_time = next_booking.start_date_time
        next_booking_end_time = next_booking.end_date_time
      else
        next_available_start_time = (next_booking_end_time + travel_time_from.minutes)
        count += 1
        next_booking = bookings_ordered[count]
        return time_slots if next_booking.nil?
        next_booking_start_time = next_booking.start_date_time
        next_booking_end_time = next_booking.end_date_time
      end
    end
    time_slots
    else
      time_slots
    end
  end

  def display_available_slots
    travel_time_to = 20
    travel_time_from = 30
    booking_duration = 120
    day_slots = []
    (0..6).to_a.each do |day|
      day_slots << create_available_slots(travel_time_to, travel_time_from, booking_duration, day)
    end
    day_slots
  end
end
