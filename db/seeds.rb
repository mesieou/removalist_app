ITEMS = {
  "big cabinet" => 21,
  "3 seater couch" => 17.5,
  "2 seater couch" => 14,
  "fridge" => 14,
  "washing machine" => 14,
  "dryer" => 14,
  "television" => 14,
  "rug" => 7,
  "dining table" => 7,
  "dining chairs" => 1.75,
  "small armchairs" => 3.5,
  "electric chairs" => 14,
  "outdoor chairs" => 1.75,
  "small cabinet" => 7,
  "outdoor table" => 7,
  "coffee table" => 7,
  "book shelve" => 7,
  "queen mattress" => 7,
  "queen frame" => 10.5,
  "bag of golf" => 3.5,
  "Tool box Large" => 3.5,
  "boxes" => 0.7,
  "small bags" => 0.7,
  "suitcase bags" => 3.5
}
ADRESSES = [  "123 Smith Street, Melbourne VIC 3000",
  "142 Gatehouse Street, Parkville",
  "107 Park Street, South Yarra",
  "482 Lygon Street, Carlton",
  "1/1-3 St Kilda Road, St Kilda",
  "8 wellington road, Box Hill",
  "133 drop street Footscray",
  "175 Kelletts road Rowville",
  "1 caledonian lane Melbourne",
  "2 queens parade ashwood",
  "371 harkness road harkness",
  "463 victoria street abbotsford",
  "2 freeman street ringwood east",
  "33 hartington drive wantirna",
  "33 harcourt street hawthorn east",
  "33 halliday street mount waverley",
  "33 harrington avenue balwyn north",
  "9 Ashton rise narre warren south",
]

#Method to destroy and create items in the list_of_items table
def recreate_list_of_items
  puts 'Creating new items'
  ITEMS.each do |item|
    ListOfItem.create!(name: item[0], estimated_total_loading_time: item[1].to_i)
    puts "Created #{item[0]}"
  end
  puts 'All iteams created'

end

#Method to destroy and create new locations
def recreate_locations
  puts 'Creating new locations'

   # Creating house to house location, single story
  Location.create!(
    pick_up: ADRESSES[0],
    drop_off: ADRESSES[1],
    pick_up_type_of_place: 'house',
    drop_off_type_of_place: 'house',
    pick_up_number_of_stories: '1',
    drop_off_number_of_stories: '1',
    pick_up_stairs_or_lift: 'stairs',
    drop_off_stairs_or_lift: 'stairs'
    )
   #creating house to apartment location
  Location.create!(
    pick_up: ADRESSES[2],
    drop_off: ADRESSES[3],
    pick_up_type_of_place: 'house',
    drop_off_type_of_place: 'apartment',
    pick_up_number_of_stories: '1',
    drop_off_number_of_stories: '2',
    pick_up_stairs_or_lift: 'lift',
    drop_off_stairs_or_lift: 'lift'
  )
   #creating apartment to apartment location and stairs
  Location.create!(
    pick_up: ADRESSES[4],
    drop_off: ADRESSES[5],
    pick_up_type_of_place: 'apartment',
    drop_off_type_of_place: 'apartment',
    pick_up_number_of_stories: '2',
    drop_off_number_of_stories: '2',
    pick_up_stairs_or_lift: 'stairs',
    drop_off_stairs_or_lift: 'stairs'
  )
  # Creating house to house location, single story
  Location.create!(
    pick_up: ADRESSES[6],
    drop_off: ADRESSES[7],
    pick_up_type_of_place: 'house',
    drop_off_type_of_place: 'house',
    pick_up_number_of_stories: '1',
    drop_off_number_of_stories: '1',
    pick_up_stairs_or_lift: 'stairs',
    drop_off_stairs_or_lift: 'stairs'
    )
   #creating house to apartment location
  Location.create!(
    pick_up: ADRESSES[8],
    drop_off: ADRESSES[9],
    pick_up_type_of_place: 'house',
    drop_off_type_of_place: 'apartment',
    pick_up_number_of_stories: '1',
    drop_off_number_of_stories: '2',
    pick_up_stairs_or_lift: 'lift',
    drop_off_stairs_or_lift: 'lift'
  )
   #creating apartment to apartment location and stairs
  Location.create!(
    pick_up: ADRESSES[10],
    drop_off: ADRESSES[11],
    pick_up_type_of_place: 'apartment',
    drop_off_type_of_place: 'apartment',
    pick_up_number_of_stories: '2',
    drop_off_number_of_stories: '2',
    pick_up_stairs_or_lift: 'stairs',
    drop_off_stairs_or_lift: 'stairs'
  )
  # Creating house to house location, single story
  Location.create!(
    pick_up: ADRESSES[12],
    drop_off: ADRESSES[13],
    pick_up_type_of_place: 'house',
    drop_off_type_of_place: 'house',
    pick_up_number_of_stories: '1',
    drop_off_number_of_stories: '1',
    pick_up_stairs_or_lift: 'stairs',
    drop_off_stairs_or_lift: 'stairs'
    )
   #creating house to apartment location
  Location.create!(
    pick_up: ADRESSES[14],
    drop_off: ADRESSES[15],
    pick_up_type_of_place: 'house',
    drop_off_type_of_place: 'apartment',
    pick_up_number_of_stories: '1',
    drop_off_number_of_stories: '2',
    pick_up_stairs_or_lift: 'lift',
    drop_off_stairs_or_lift: 'lift'
  )
   #creating apartment to apartment location and stairs
  Location.create!(
    pick_up: ADRESSES[16],
    drop_off: ADRESSES[17],
    pick_up_type_of_place: 'apartment',
    drop_off_type_of_place: 'apartment',
    pick_up_number_of_stories: '2',
    drop_off_number_of_stories: '2',
    pick_up_stairs_or_lift: 'stairs',
    drop_off_stairs_or_lift: 'stairs'
  )
   # Creating house to house location, single story
   Location.create!(
    pick_up: ADRESSES[0],
    drop_off: ADRESSES[1],
    pick_up_type_of_place: 'house',
    drop_off_type_of_place: 'house',
    pick_up_number_of_stories: '1',
    drop_off_number_of_stories: '1',
    pick_up_stairs_or_lift: 'stairs',
    drop_off_stairs_or_lift: 'stairs'
    )
   #creating house to apartment location
  Location.create!(
    pick_up: ADRESSES[2],
    drop_off: ADRESSES[3],
    pick_up_type_of_place: 'house',
    drop_off_type_of_place: 'apartment',
    pick_up_number_of_stories: '1',
    drop_off_number_of_stories: '2',
    pick_up_stairs_or_lift: 'lift',
    drop_off_stairs_or_lift: 'lift'
  )
   #creating apartment to apartment location and stairs
  Location.create!(
    pick_up: ADRESSES[4],
    drop_off: ADRESSES[5],
    pick_up_type_of_place: 'apartment',
    drop_off_type_of_place: 'apartment',
    pick_up_number_of_stories: '2',
    drop_off_number_of_stories: '2',
    pick_up_stairs_or_lift: 'stairs',
    drop_off_stairs_or_lift: 'stairs'
  )
  # Creating house to house location, single story
  Location.create!(
    pick_up: ADRESSES[6],
    drop_off: ADRESSES[7],
    pick_up_type_of_place: 'house',
    drop_off_type_of_place: 'house',
    pick_up_number_of_stories: '1',
    drop_off_number_of_stories: '1',
    pick_up_stairs_or_lift: 'stairs',
    drop_off_stairs_or_lift: 'stairs'
    )
   #creating house to apartment location
  Location.create!(
    pick_up: ADRESSES[8],
    drop_off: ADRESSES[9],
    pick_up_type_of_place: 'house',
    drop_off_type_of_place: 'apartment',
    pick_up_number_of_stories: '1',
    drop_off_number_of_stories: '2',
    pick_up_stairs_or_lift: 'lift',
    drop_off_stairs_or_lift: 'lift'
  )
   #creating apartment to apartment location and stairs
  Location.create!(
    pick_up: ADRESSES[10],
    drop_off: ADRESSES[11],
    pick_up_type_of_place: 'apartment',
    drop_off_type_of_place: 'apartment',
    pick_up_number_of_stories: '2',
    drop_off_number_of_stories: '2',
    pick_up_stairs_or_lift: 'stairs',
    drop_off_stairs_or_lift: 'stairs'
  )
  # Creating house to house location, single story
  Location.create!(
    pick_up: ADRESSES[12],
    drop_off: ADRESSES[13],
    pick_up_type_of_place: 'house',
    drop_off_type_of_place: 'house',
    pick_up_number_of_stories: '1',
    drop_off_number_of_stories: '1',
    pick_up_stairs_or_lift: 'stairs',
    drop_off_stairs_or_lift: 'stairs'
    )
   #creating house to apartment location
  Location.create!(
    pick_up: ADRESSES[14],
    drop_off: ADRESSES[15],
    pick_up_type_of_place: 'house',
    drop_off_type_of_place: 'apartment',
    pick_up_number_of_stories: '1',
    drop_off_number_of_stories: '2',
    pick_up_stairs_or_lift: 'lift',
    drop_off_stairs_or_lift: 'lift'
  )
   #creating apartment to apartment location and stairs
  Location.create!(
    pick_up: ADRESSES[16],
    drop_off: ADRESSES[17],
    pick_up_type_of_place: 'apartment',
    drop_off_type_of_place: 'apartment',
    pick_up_number_of_stories: '2',
    drop_off_number_of_stories: '2',
    pick_up_stairs_or_lift: 'stairs',
    drop_off_stairs_or_lift: 'stairs'
  )
end

#Method to destroy and create new items
def recreate_items
  item_names = ITEMS.keys
  puts 'Creating  2 karts with items'
  2.times {
    kart = Kart.create!
    random_num = rand(1..5)
    random_num.times do
      item_name = item_names.sample
      estimated_total_loading_time = ITEMS[item_name]
      Item.create!(name: item_name, estimated_total_loading_time: estimated_total_loading_time.to_i, kart: kart)
      puts "Created #{item_name}"
    end
    puts 'Kart created with items'
  }
  puts 'All karts with items created'
end

#Method to destroy and create new services
def recreate_services
  puts 'Creating new services'
  5.times do
    Service.create!(number_of_removalists: rand(1..2), packagin: [true, false].sample)
    puts 'Service created'
  end
  puts 'All services created'
end

#Method to destroy and create new users
def recreate_users
  puts 'Creating new users'
  5.times do
    User.create!(email: Faker::Internet.email, password: 'password')
    puts 'User created'
  end
  puts 'All users created'
end

def create_date_time(from_day, to_day)
  Time.zone = "Australia/Melbourne"
  start_hour = 6
  end_hour = 17
  start_time = Faker::Time.between_dates(from: Date.tomorrow + from_day, to: Date.tomorrow + to_day)
  random_start_hour = start_time.change(hour: rand(start_hour..end_hour), min: rand(0..59))
end

def create_specific_start_time(start_time_in_minutes, day)
  Time.zone = "Australia/Melbourne"
  date = Date.tomorrow.to_time + day.day
  date.change(hour: start_time_in_minutes)
end
#Creating a specific booking for tomorrow at 10 am
def recreate_bookings
  puts 'Creating 2 new bookings for tomorrow'
  Time.zone = "Australia/Melbourne"
  start_time_10_am = create_specific_start_time(10, 0)
  Booking.create!(
    price: 180,
    duration_in_minutes: 120,
    start_date_time: start_time_10_am,
    end_date_time: start_time_10_am + 120.minutes,
    status: ['pending', 'confirmed', 'cancelled'].sample,
    location: Location.all[0],
    service: Service.all.sample,
    kart: Kart.all.sample,
    user: User.all.sample,
  )
  #Creating a specific booking for tomorrow at 5 pm
  start_time_5_pm = create_specific_start_time(17, 0)
  Booking.create!(
    price: 120,
    duration_in_minutes: 90,
    start_date_time: start_time_5_pm,
    end_date_time: start_time_5_pm + 90.minutes,
    status: ['pending', 'confirmed', 'cancelled'].sample,
    location: Location.all[1],
    service: Service.all.sample,
    kart: Kart.all.sample,
    user: User.all.sample,
  )

  #Creating a specific booking for the second day in the morning
  puts 'Creating 1 new booking in the morning on the second day'
  start_time_5_pm = create_specific_start_time(7, 1)
  Booking.create!(
    price: 300,
    duration_in_minutes: 120,
    start_date_time: start_time_5_pm,
    end_date_time: start_time_5_pm + 90.minutes,
    status: ['pending', 'confirmed', 'cancelled'].sample,
    location: Location.all[2],
    service: Service.all.sample,
    kart: Kart.all.sample,
    user: User.all.sample,
  )

  #Creating 3 bookings on the third day
  puts 'Creating 3 new bookings for third day'
  start_time_5_pm = create_specific_start_time(8, 2)
  Booking.create!(
    price: 100,
    duration_in_minutes: 60,
    start_date_time: start_time_5_pm,
    end_date_time: start_time_5_pm + 90.minutes,
    status: ['pending', 'confirmed', 'cancelled'].sample,
    location: Location.all[3],
    service: Service.all.sample,
    kart: Kart.all.sample,
    user: User.all.sample,
  )
  start_time_5_pm = create_specific_start_time(13, 2)
  Booking.create!(
    price: 250,
    duration_in_minutes: 140,
    start_date_time: start_time_5_pm,
    end_date_time: start_time_5_pm + 90.minutes,
    status: ['pending', 'confirmed', 'cancelled'].sample,
    location: Location.all[4],
    service: Service.all.sample,
    kart: Kart.all.sample,
    user: User.all.sample,
  )
  start_time_5_pm = create_specific_start_time(16, 2)
  Booking.create!(
    price: 300,
    duration_in_minutes: 120,
    start_date_time: start_time_5_pm,
    end_date_time: start_time_5_pm + 90.minutes,
    status: ['pending', 'confirmed', 'cancelled'].sample,
    location: Location.all[5],
    service: Service.all.sample,
    kart: Kart.all.sample,
    user: User.all.sample,
  )

  #Creating 1 booking in the afternoon on the fourth day
  puts 'Creating 1 new booking in the afternoon on the 4rd day'
  start_time_5_pm = create_specific_start_time(16, 3)
  Booking.create!(
    price: 300,
    duration_in_minutes: 120,
    start_date_time: start_time_5_pm,
    end_date_time: start_time_5_pm + 90.minutes,
    status: ['pending', 'confirmed', 'cancelled'].sample,
    location: Location.all[6],
    service: Service.all.sample,
    kart: Kart.all.sample,
    user: User.all.sample,
  )

  #Creating 4 bookins on the 5th day.
  puts 'Creating new 4 bookings on day 5th'
  start_time_5_pm = create_specific_start_time(6, 4)
  Booking.create!(
    price: 300,
    duration_in_minutes: 120,
    start_date_time: start_time_5_pm,
    end_date_time: start_time_5_pm + 120.minutes,
    status: ['pending', 'confirmed', 'cancelled'].sample,
    location: Location.all[7],
    service: Service.all.sample,
    kart: Kart.all.sample,
    user: User.all.sample,
  )
  start_time_5_pm = create_specific_start_time(9, 4)
  Booking.create!(
    price: 300,
    duration_in_minutes: 150,
    start_date_time: start_time_5_pm,
    end_date_time: start_time_5_pm + 150.minutes,
    status: ['pending', 'confirmed', 'cancelled'].sample,
    location: Location.all[8],
    service: Service.all.sample,
    kart: Kart.all.sample,
    user: User.all.sample,
  )
  start_time_5_pm = create_specific_start_time(12, 4)
  Booking.create!(
    price: 300,
    duration_in_minutes: 90,
    start_date_time: start_time_5_pm,
    end_date_time: start_time_5_pm + 90.minutes,
    status: ['pending', 'confirmed', 'cancelled'].sample,
    location: Location.all[9],
    service: Service.all.sample,
    kart: Kart.all.sample,
    user: User.all.sample,
  )
  start_time_5_pm = create_specific_start_time(14, 4)
  Booking.create!(
    price: 300,
    duration_in_minutes: 90,
    start_date_time: start_time_5_pm,
    end_date_time: start_time_5_pm + 90.minutes,
    status: ['pending', 'confirmed', 'cancelled'].sample,
    location: Location.all[10],
    service: Service.all.sample,
    kart: Kart.all.sample,
    user: User.all.sample,
  )

  #Creating 3 bookins on the 6th day. Morning and afternoon.
  puts 'Creating new 2 bookings on day 6th. Morning and afternoon'
  start_time_5_pm = create_specific_start_time(7, 5)
  Booking.create!(
    price: 300,
    duration_in_minutes: 90,
    start_date_time: start_time_5_pm,
    end_date_time: start_time_5_pm + 90.minutes,
    status: ['pending', 'confirmed', 'cancelled'].sample,
    location: Location.all[11],
    service: Service.all.sample,
    kart: Kart.all.sample,
    user: User.all.sample,
  )
  start_time_5_pm = create_specific_start_time(15, 5)
  Booking.create!(
    price: 300,
    duration_in_minutes: 180,
    start_date_time: start_time_5_pm,
    end_date_time: start_time_5_pm + 180.minutes,
    status: ['pending', 'confirmed', 'cancelled'].sample,
    location: Location.all[12],
    service: Service.all.sample,
    kart: Kart.all.sample,
    user: User.all.sample,
  )



  puts 'All bookings created'
end

puts 'Destroying all models'
puts '---------------------'
Booking.destroy_all
User.destroy_all
ListOfItem.destroy_all
Location.destroy_all
Item.destroy_all
Kart.destroy_all
Service.destroy_all

puts 'Creating new models'
puts '---------------------'
recreate_list_of_items
recreate_locations
recreate_items
recreate_services
recreate_users
recreate_bookings
