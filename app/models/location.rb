class Location < ApplicationRecord
  serialize :addresses, Hash

  # Address attributes
  attribute :pick_up, :string
  attribute :drop_off, :string

  def addresses=(value)
    super(value.is_a?(Hash) ? value : JSON.parse(value))
  end

  # Validation if needed
end
