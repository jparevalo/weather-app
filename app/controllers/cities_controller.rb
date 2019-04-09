class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]

  # GET /cities
  # GET /cities.json
  def index
    @cities = City.all
  end

  # GET /cities/1
  # GET /cities/1.json
  def show
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities/find_city_api
  def find_city_by_query
    cities = GetCities.new().get_cities_by_query(params[:city_query])[:cities]
    if cities.key?("Message")
      flash[:danger] = 'Error de API: "' + cities["Message"] + '"'
      redirect_to new_city_path
    else
      respond_to do |format|
        format.js { render :partial => 'cities/render_city_list_modal.js.erb', locals: {cities: cities.first(20)} }
      end
    end
  end

  # POST /cities/find_city_api
  def find_city_by_geolocation
    geolocation = params[:latitude] + "," + params[:longitude]
    cities = GetCities.new().get_cities_by_geolocation(geolocation)[:cities]
    if cities.key?("Message")
      flash[:danger] = 'Error de API: "' + cities["Message"] + '"'
      redirect_to new_city_path
    else
      respond_to do |format|
        format.js { render :partial => 'cities/render_city_list_modal.js.erb', locals: {cities: cities.first(20)} }
      end
    end
  end

  # POST /cities/find_city_api
  def find_city_by_zip_code
    cities = GetCities.new().get_cities_by_zip_code(params[:zip_code])[:cities]
    if cities.key?("Message")
      flash[:danger] = 'Error de API: "' + cities["Message"] + '"'
      redirect_to new_city_path
    else
      respond_to do |format|
        format.js { render :partial => 'cities/render_city_list_modal.js.erb', locals: {cities: cities.first(20)} }
      end
    end
  end

  # POST /cities
  # POST /cities.json
  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cities/1
  # PATCH/PUT /cities/1.json
  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city, notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.json
  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.fetch(:city, {}).permit(:name, :country, :location_key)
    end
end
