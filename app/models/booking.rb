class Booking < ApplicationRecord
  belongs_to :users
  belongs_to :locations
  belongs_to :services
  belongs_to :items

  validates :date_time, presence: true
  validates :duration_in_minutes, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :status, presence: true
end