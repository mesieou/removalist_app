#Method to destroy and create items in the list_of_items table
def recreate_list_of_items
  items = {
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
  puts 'Destroying old items'
  ListOfItem.destroy_all
  puts 'Creating new items'
  items.each do |item|
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
  locations.create!(
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
  locations.create!(
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
  locations.create!(
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
  puts 'Destroyin old items and carts'
  Item.destroy_all
  Kart.destroy_all
  puts 'Creating  2 karts with items'
  2.times {
    kart = Kart.create!
    random_num = rand(1..5)
    random_num.times do
      Item.create!(name: item[0], estimated_total_loading_time: item[1].to_i, kart: kart)
      puts "Created #{item[0]}"
    end
    puts 'Kart created with items'
  }
  puts 'All karts with items created'
end
