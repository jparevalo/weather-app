require 'net/http'
require 'json'
require 'date'

class GetCities
  def initialize
    api_key = Figaro.env.ACCUWEATHER_API_KEY
    @query_url = Figaro.env.ACCUWEATHER_LOCATION_CITY_URL
    @zip_url = Figaro.env.ACCUWEATHER_LOCATION_ZIP_URL
    @geo_url = Figaro.env.ACCUWEATHER_LOCATION_GEO_URL
    @api_url = "%{type}?q=%{query}&apikey=#{api_key}"
  end

  def get_cities_by_query(city_query)
    url = URI.parse(URI.escape((@api_url % {type: @query_url, query: city_query.downcase})))
    puts url

    {'cities': JSON.parse(Net::HTTP.get(url))}
  end

  def get_cities_by_zip_code(zip_code)
    url = URI.parse(URI.escape((@api_url % {type: @zip_url, query: zip_code.downcase})))
    puts url
    {'cities': JSON.parse(Net::HTTP.get(url))}
  end

  def get_cities_by_geolocation(geolocation)
    url = URI.parse(URI.escape((@api_url % {type: @geo_url, query: geolocation.downcase})))
    puts url
    {'cities': JSON.parse(Net::HTTP.get(url))}
  end

end