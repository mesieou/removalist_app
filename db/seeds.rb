
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
Item.destroy_all

puts 'Creating new items'
items.each do |item|
  Item.create!(name: item[0], estimated_total_loading_time: item[1].to_i)
  puts "Created #{item[0]}"
end
puts 'All iteams created'
