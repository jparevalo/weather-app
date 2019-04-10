class City < ApplicationRecord
  validates :location_key, uniqueness: true

  def to_s
    name + ", " + country
  end
end
