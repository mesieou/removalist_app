class Location < ApplicationRecord
  has_many :bookings

  validates :address_pick_up_1, presence: true
  validates :address_drop_off, presence: true
  validates :type, presence: true
  validates :stairs_or_lift, presence: true
  validates :story_number, presence: true, numericality: { only_integer: true }

end
