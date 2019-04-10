require 'net/http'
require 'json'
require 'date'

class GetForecast
  def initialize
    api_key = Figaro.env.ACCUWEATHER_API_KEY
    query_url = Figaro.env.ACCUWEATHER_FORECAST_URL
    @api_url = "#{query_url}%{location_key}?details=true&metric=true&apikey=#{api_key}"
  end

  def get_5_day_forecast(location_key)
    url = URI.parse(URI.escape((@api_url % {location_key: location_key})))
    ApiRequest.new().request(url)
  end

end