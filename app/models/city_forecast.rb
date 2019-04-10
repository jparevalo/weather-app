class CityForecast < ApplicationRecord
  belongs_to :city
  belongs_to :day_1, :class_name => "Forecast"
  belongs_to :day_2, :class_name => "Forecast"
  belongs_to :day_3, :class_name => "Forecast"
  belongs_to :day_4, :class_name => "Forecast"
  belongs_to :day_5, :class_name => "Forecast"

  def forecasts
    return [day_1, day_2, day_3, day_4, day_5]
  end
end
