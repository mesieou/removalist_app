class Location < ApplicationRecord
  has_many :bookings

  validates :address, presence: true
  validates :type, presence: true
  validates :stairs_or_lift, presence: true
  validates :story_number, presence: true, numericality: { only_integer: true }

end
