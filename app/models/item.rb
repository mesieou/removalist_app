class Item < ApplicationRecord
  belongs_to :kart
  validates :name, presence: true
  validates :estimated_total_loading_time, presence: true, numericality: { only_integer: true }

end
