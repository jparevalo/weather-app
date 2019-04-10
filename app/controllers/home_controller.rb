class HomeController < ApplicationController
  def index
    @forecast = []
  end

  def set_params
    params.require(:city).permit(:city_id)
  end

  def update
    city = City.find(set_params[:city_id])
    previous_forecast = CityForecast.where(city: city.id)
    if previous_forecast.empty? or previous_forecast.updated_at < 1.day.ago
      @forecast = GetForecast.new().get_5_day_forecast(city.location_key)["DailyForecasts"]
      # TODO: Create forecast and cityforecast objects
    else
      @forecast = previous_forecast
    end

    render :index
  end
end
