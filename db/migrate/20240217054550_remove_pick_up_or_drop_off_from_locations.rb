class RemovePickUpOrDropOffFromLocations < ActiveRecord::Migration[7.0]
  def change
    remove_column :locations, :pick_up_or_drop_off, :string
    remove_column :locations, :address, :string
    add_column :locations, :addresses, :text
    add_column :locations, :type_of_places, :text
    add_column :locations, :number_of_stories, :text
    add_column :locations, :stairs_or_lift, :text
  end
end
