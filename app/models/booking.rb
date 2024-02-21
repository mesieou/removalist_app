class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :location
  belongs_to :service
  belongs_to :kart

  validates :date_time, presence: true
  validates :duration_in_minutes, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :status, presence: true
end
