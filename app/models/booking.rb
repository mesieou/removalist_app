class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :location
  belongs_to :service
  belongs_to :kart

  validates :start_date_time, presence: true
  validates :end_date_time, presence: true
  validates :duration_in_minutes, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :status, presence: true

  before_validation :set_time_zone

  private

  def set_time_zone
    self.start_date_time = start_date_time.in_time_zone('Melbourne') if start_date_time.present?
    self.end_date_time = end_date_time.in_time_zone('Melbourne') if end_date_time.present?
  end
end
