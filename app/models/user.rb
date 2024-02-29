class User < ApplicationRecord
  has_many :bookings
  has_many :services, through: :bookings
  has_many :locations, through: :bookings
  has_many :services, through: :bookings
  has_many :karts, through: :bookings
  has_many :items, through: :karts


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
