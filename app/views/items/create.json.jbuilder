if @item.persisted?
  json.inserted_item render(partial: 'car_navbar', formats: :html)
  json.inserted_item render(partial: 'available', formats: :html)
else
  json.errors @item.errors.full_messages
end
