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

    render :index
  end
end
