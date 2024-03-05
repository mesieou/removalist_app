class BookingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :available]
  def index
  end
  def available
    @bookings = Booking.all
  end

  def create_available_slots(travel_time_to, travel_time_from, booking_duration, day)
    Time.zone = 'Melbourne'
    next_day =  Date.tomorrow.to_time + day.day
    end_day = next_day
    next_available_start_time = next_day.change(hour: 6, min: 0, sec: 0).in_time_zone
    next_available_end_time = end_day.change(hour: 17, min: 0, sec: 0).in_time_zone
    bookings_ordered = Booking.where('start_date_time >= ?', next_available_start_time).order(:start_date_time)

    next_booking = bookings_ordered.first
    next_booking_start_time = next_booking.start_date_time
    next_booking_end_time = next_booking.end_date_time
    time_slots = []
    count = 0
    if (next_booking_start_time - end_day) <= 0
      time_slots << [next_available_start_time, next_available_end_time]
      return
    else
      while next_available_start_time < next_available_end_time
        if ((next_booking_start_time - next_available_start_time) / 60 ) > (booking_duration.minutes + travel_time_to.minutes)
          available_end_date_time = next_booking_start_time - travel_time_to.minutes
          available_start_date_time = next_available_start_time
          time_slots << [available_start_date_time, available_end_date_time]
        end
        if next_booking_end_time > next_available_end_time
          next_available_start_time += 1.day
          count += 1
          next_booking = bookings_ordered[count]
          next_booking_start_time = next_booking.start_date_time
          next_booking_end_time = next_booking.end_date_time
        else
          next_available_start_time = (next_booking_end_time + travel_time_from.minutes)
          next_booking = bookings_ordered[count]
          next_booking_start_time = next_booking.start_date_time
          next_booking_end_time = next_booking.end_date_time
        end
      end
    end
    time_slots
  end

  def display_available_slots
    travel_time_to = 30
    travel_time_from = 30
    booking_duration = 120
    @day_slots = []
    (0..6).to_a.each do |day|
      create_available_slots(travel_time_to, travel_time_from, booking_duration, day)
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


    end_day = sunday
    next_available_start_time = 7 am
    next_available_end_time = sunday 5 pm


    next_booking_start_time = 11 am
    next_booking_end_time = 1 pm
    time_slots = []

while tues 7 am < sunday 5 pm
  if tues 11 am - tues 7 am < (booking_duration.minutes + travel_time.minutes(next job))
    available_end_date_time = (11 am - 120) 9 am + travel time 30 min 8:30
    available_start_date_time = 7 am
    time_slots << [available_start_date_time, available_end_date_time]
  end
  next_available_start_time = next_booking_end_time
  next_booking = next_booking.next
  next_booking_start_time = next_booking.start_date_time
  next_booking_end_time = next_booking.end_date_time
end
