class Service < ApplicationRecord
  has_many :bookings

  validates :number_of_removalists, presence: true
  validates :packaging, presence: true
end
