class Kart < ApplicationRecord
  belongs_to :booking
  belongs_to :user, through: :bookings
  has_many :items
end
