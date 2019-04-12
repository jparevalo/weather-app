class HomeController < ApplicationController
  def index
    @forecast = nil
  end

  def set_params
    params.require(:city).permit(:city_id)
  end

  def update
    city = City.find(set_params[:city_id])
    previous_forecast = CityForecast.where(city: city.id).last
    if previous_forecast.nil? or previous_forecast.updated_at.to_date < Date.today()
      forecast_json = GetForecast.new().get_5_day_forecast(city.location_key)
      if forecast_json.is_a?(Hash) and forecast_json.key?("Message")
        flash[:danger] = 'Error de API: "' + forecast_json["Message"] + '"'
      else
        @forecast = CityForecastFactory.new().create_from_json(city, forecast_json["DailyForecasts"])
      end
    else
      @forecast = previous_forecast
    end
    @wind_direction = @forecast.forecasts[0].wind_direction
    @wind_speed = @forecast.forecasts[0].wind_speed
    @city_id = city.id
    respond_to do |format|
      format.js { render 'home/update_city.js.erb', locals: {forecast: @forecast, wind_direction: @wind_direction, wind_speed: @wind_speed, city_id: @city_id} }
    end
  end

  def fetch_wind_conditions
    city = City.find(set_params[:city_id])
    forecast_json = GetCurrentConditions.new().get_current_conditions(city.location_key)
    if forecast_json.is_a?(Hash) and forecast_json.key?("Message")
      flash[:danger] = 'Error de API: "' + forecast_json["Message"] + '"'
    else
      @wind_direction = forecast_json[0]["Wind"]["Direction"]["Localized"]
      @wind_speed = forecast_json[0]["Wind"]["Speed"]["Metric"]["Value"]
      @city_id = city.id
    end
    respond_to do |format|
      format.js { render 'home/update_wind.js.erb', locals: {wind_direction: @wind_direction, wind_speed: @wind_speed, city_id: @city_id } }
    end
  end
end
