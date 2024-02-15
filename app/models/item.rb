class Item < ApplicationRecord
  has_many :bookings
  validates :name, presence: true
  validates :estimated_total_loading_time, presence: true, numericality: { only_integer: true }
end
