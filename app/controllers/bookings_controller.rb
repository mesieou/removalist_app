class BookingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :available]
  def index
  end
  def available
    @bookings = Booking.all
  end

  def create_available_slots(minutes_needed)
    next_day = DateTime.now + 1
    next_available_start_time = next_day.change(hour: 6, min: 0, sec: 0)
    next_available_end_time = next_day.change(hour: 17, min: 0, sec: 0)
    bookings_ordered = Booking.all.order(:start_date_time)
    next_booking = bookings_ordered.first
    next_booking_start_time = next_booking.start_date_time
    next_booking_end_time = next_booking.end_date_time
    time_slots = []
    while next_available_start_time < next_available_end_time
      if next_booking_start_time - next_available_start_time < minutes_needed.minutes
        latest_available_time = next_booking_start_time - minutes_needed.minutes
        available_start_date_time = next_available_start_time
        available_end_date_time = latest_available_time
        time_slots << [available_start_date_time, available_end_date_time]
        next_available_start_time = next_booking_end_time
        next_booking = next_booking.next
      end
      next_available_start_time = next_available_start_time + 15.minutes
    end
  end
end
    # seed bookings
    # loop into each 30 min
    # is there a booking yes?
    # calculate total duration of the current booking with the found one
    # calculate total with location, accesibility, items
    # calculate total price of the current booking with the found one
    # check if the current booking duration has enough time
    # if so save it into available bookings
    # if not
    # calculate total duration of the current booking
    # calculate total with location, accesibility, items
    # calculate total price of the current booking
    # check if the current booking duration has enough time
    # if so save it into available bookings
    # end
    # show the available bookings
11 - 7 = 354 m
