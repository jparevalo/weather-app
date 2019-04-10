class City < ApplicationRecord
  validates :location_key, uniqueness: true
end
