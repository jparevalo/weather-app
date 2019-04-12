class CityForecastFactory
  def initialize
  end

  def create_from_json(city, forecast_payload)
    begin
      forecasts = create_forecasts(forecast_payload)
      city_forecast = create_city_forecast(city, forecasts)
    rescue NoMethodError
      raise(RuntimeError)
    end

    city_forecast
  end

  def create_forecasts(forecast_payload)
    forecasts = []

    forecast_payload.each do |forecast|
      forecast_params = {}
      forecast_params[:date] = forecast["Date"]
      forecast_params[:max_temperature] = forecast["Temperature"]["Maximum"]["Value"]
      forecast_params[:min_temperature] = forecast["Temperature"]["Minimum"]["Value"]
      forecast_params[:wind_direction] = forecast["Day"]["Wind"]["Direction"]["English"]
      forecast_params[:wind_speed] = forecast["Day"]["Wind"]["Speed"]["Value"]
      forecast_params[:cloud_cover] = forecast["Day"]["CloudCover"]

      forecast = Forecast.new(forecast_params)
      forecast.save()
      forecasts.append(forecast)
    end

    forecasts
  end

  def create_city_forecast(city, forecasts)
    day_1, day_2, day_3, day_4, day_5 = forecasts
    city_forecast_params = {}
    city_forecast_params[:city] = city
    city_forecast_params[:day_1] = day_1
    city_forecast_params[:day_2] = day_2
    city_forecast_params[:day_3] = day_3
    city_forecast_params[:day_4] = day_4
    city_forecast_params[:day_5] = day_5

    city_forecast = CityForecast.new(city_forecast_params)
    city_forecast.save()

    city_forecast
  end

end