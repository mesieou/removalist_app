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
#Method to destroy and create items in the list_of_items table
def recreate_list_of_items
  puts 'Destroying old items'
  ListOfItem.destroy_all
  puts 'Creating new items'
  ITEMS.each do |item|
    ListOfItem.create!(name: item[0], estimated_total_loading_time: item[1].to_i)
    puts "Created #{item[0]}"
  end
  puts 'All iteams created'

end

#Method to destroy and create new locations
def recreate_locations
  puts 'Destroying old locations'
  Location.destroy_all
  puts 'Creating new locations'

   # Creating house to house location, single story
  Location.create!(
    pick_up: Faker::Address.street_address,
    drop_off: Faker::Address.street_address,
    pick_up_type_of_place: 'house',
    drop_off_type_of_place: 'house',
    pick_up_number_of_stories: '1',
    drop_off_number_of_stories: '1',
    pick_up_stairs_or_lift: 'stairs',
    drop_off_stairs_or_lift: 'stairs'
    )
   #creating house to apartment location
  Location.create!(
    pick_up: Faker::Address.street_address,
    drop_off: Faker::Address.street_address,
    pick_up_type_of_place: 'house',
    drop_off_type_of_place: 'apartment',
    pick_up_number_of_stories: '1',
    drop_off_number_of_stories: '2',
    pick_up_stairs_or_lift: 'lift',
    drop_off_stairs_or_lift: 'lift'
  )
   #creating apartment to apartment location and stairs
  Location.create!(
    pick_up: Faker::Address.street_address,
    drop_off: Faker::Address.street_address,
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

  puts 'Destroyin old items and carts'
  Item.destroy_all
  Kart.destroy_all
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
  puts 'Destroying old services'
  Service.destroy_all
  puts 'Creating new services'
  5.times do
    Service.create!(number_of_removalists: rand(1..2), packagin: [true, false].sample)
    puts 'Service created'
  end
  puts 'All services created'
end

#Method to destroy and create new users
def recreate_users
  puts 'Destroying old users'
  User.destroy_all
  puts 'Creating new users'
  5.times do
    User.create!(email: Faker::Internet.email, password: 'password')
    puts 'User created'
  end
  puts 'All users created'
end

#Method to destroy and create new bookings
def recreate_bookings
  puts 'Destroying old bookings'
  Booking.destroy_all
  puts 'Creating new bookings'
  5.times do
    start_time = Faker::Time.forward(days: 23, period: :morning)
    duration_in_minutes = rand(60..300)
    Booking.create!(
      price: rand(100..500),
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

recreate_list_of_items
recreate_locations
recreate_items
recreate_services
recreate_users
recreate_bookings
