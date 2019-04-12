class City < ApplicationRecord
  validates :location_key, uniqueness: true
  has_many :city_forecasts, :dependent => :destroy

  def to_s
    name + ", " + country
  end
end
