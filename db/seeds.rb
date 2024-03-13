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
  "1 Aberdeen Road, Blackburn South VIC",
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
  "33 harrington avenue balwyn north"
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
    pick_up: ADRESSES.sample,
    drop_off: ADRESSES.sample,
    pick_up_type_of_place: 'house',
    drop_off_type_of_place: 'house',
    pick_up_number_of_stories: '1',
    drop_off_number_of_stories: '1',
    pick_up_stairs_or_lift: 'stairs',
    drop_off_stairs_or_lift: 'stairs'
    )
   #creating house to apartment location
  Location.create!(
    pick_up: ADRESSES.sample,
    drop_off: ADRESSES.sample,
    pick_up_type_of_place: 'house',
    drop_off_type_of_place: 'apartment',
    pick_up_number_of_stories: '1',
    drop_off_number_of_stories: '2',
    pick_up_stairs_or_lift: 'lift',
    drop_off_stairs_or_lift: 'lift'
  )
   #creating apartment to apartment location and stairs
  Location.create!(
    pick_up: ADRESSES.sample,
    drop_off: ADRESSES.sample,
    pick_up_type_of_place: 'apartment',
    drop_off_type_of_place: 'apartment',
    pick_up_number_of_stories: '2',
    drop_off_number_of_stories: '2',
    pick_up_stairs_or_lift: 'stairs',
    drop_off_stairs_or_lift: 'stairs'
  )
  #creating randonm location with each address in the array
  ADRESSES.each do |address|
    Location.create!(
      pick_up: address,
      drop_off: ADRESSES.sample,
      pick_up_type_of_place: 'apartment',
      drop_off_type_of_place: 'apartment',
      pick_up_number_of_stories: '2',
      drop_off_number_of_stories: '2',
      pick_up_stairs_or_lift: 'stairs',
      drop_off_stairs_or_lift: 'stairs'
    )
  end
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

def create_date_time(days)
  Time.zone = 'Melbourne'
  start_hour = 6
  end_hour = 17
  start_time = Faker::Time.between_dates(from: Date.tomorrow + 3, to: Date.tomorrow + days)
  random_start_hour = start_time.change(hour: rand(start_hour..end_hour), min: rand(0..59))
end

def create_specific_start_time(start_time_in_minutes, day)
  Time.zone = 'Melbourne'
  date = Date.tomorrow.to_time + day.day
  date.change(hour: start_time_in_minutes)
end
#Creating a specific booking for tomorrow at 10 am
def recreate_bookings
  puts 'Creating 2 new bookings for tomorrow'
  Time.zone = 'Melbourne'
  start_time_10_am = create_specific_start_time(10, 0)
  Booking.create!(
    price: 180,
    duration_in_minutes: 120,
    start_date_time: start_time_10_am,
    end_date_time: start_time_10_am + 120.minutes,
    status: ['pending', 'confirmed', 'cancelled'].sample,
    location: Location.all.sample,
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
    location: Location.all.sample,
    service: Service.all.sample,
    kart: Kart.all.sample,
    user: User.all.sample,
  )

  #Creating a specific booking for the day after tomorrow. Only one booking for the day
  puts 'Creating 1 new booking for the day after tomorrow'
  start_time_5_pm = create_specific_start_time(7, 1)
  Booking.create!(
    price: 300,
    duration_in_minutes: 120,
    start_date_time: start_time_5_pm,
    end_date_time: start_time_5_pm + 90.minutes,
    status: ['pending', 'confirmed', 'cancelled'].sample,
    location: Location.all.sample,
    service: Service.all.sample,
    kart: Kart.all.sample,
    user: User.all.sample,
  )

  #Creating a specific booking for +2 days after tomorrow. 3 bookings for the day
  puts 'Creating 3 new bookings for +2 days after tomorrow'
  start_time_5_pm = create_specific_start_time(8, 2)
  Booking.create!(
    price: 100,
    duration_in_minutes: 60,
    start_date_time: start_time_5_pm,
    end_date_time: start_time_5_pm + 90.minutes,
    status: ['pending', 'confirmed', 'cancelled'].sample,
    location: Location.all.sample,
    service: Service.all.sample,
    kart: Kart.all.sample,
    user: User.all.sample,
  )
  start_time_5_pm = create_specific_start_time(1, 2)
  Booking.create!(
    price: 250,
    duration_in_minutes: 140,
    start_date_time: start_time_5_pm,
    end_date_time: start_time_5_pm + 90.minutes,
    status: ['pending', 'confirmed', 'cancelled'].sample,
    location: Location.all.sample,
    service: Service.all.sample,
    kart: Kart.all.sample,
    user: User.all.sample,
  )
  start_time_5_pm = create_specific_start_time(4, 2)
  Booking.create!(
    price: 300,
    duration_in_minutes: 120,
    start_date_time: start_time_5_pm,
    end_date_time: start_time_5_pm + 90.minutes,
    status: ['pending', 'confirmed', 'cancelled'].sample,
    location: Location.all.sample,
    service: Service.all.sample,
    kart: Kart.all.sample,
    user: User.all.sample,
  )

  #Creating a specific booking for +3 days after tomorrow. 10 random bookings
  puts 'Creating new 10 random bookings from the day after tomorrow'
  10.times do
    start_time = create_date_time(4)
    duration_in_minutes = rand(60..300)
    Booking.create!(
      price: rand(60..300),
      duration_in_minutes: duration_in_minutes,
      start_date_time: start_time,
      end_date_time: start_time + duration_in_minutes.minutes,
      status: ['pending', 'confirmed', 'cancelled'].sample,
      location: Location.all.sample,
      service: Service.all.sample,
      kart: Kart.all.sample,
      user: User.all.sample,
    )
    puts 'Booking created'
  end

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
