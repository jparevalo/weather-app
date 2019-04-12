Rails.application.routes.draw do
  resources :cities

  post 'cities/find_city_by_query' => 'cities#find_city_by_query', as: :find_city_query_api
  post 'cities/find_city_by_geolocation' => 'cities#find_city_by_geolocation', as: :find_city_geo_api
  post 'cities/find_city_by_zip_code' => 'cities#find_city_by_zip_code', as: :find_city_zip_api

  get 'home/update', to: 'home#update'
  get 'home/fetch_wind_conditions', to: 'home#fetch_wind_conditions'

  root 'home#index'
end
