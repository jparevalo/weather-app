require 'test_helper'

class CityTest < ActiveSupport::TestCase
  test "should not create a city with duplicated location_key" do
    # Arrange
    duplicated_location_key = 1

    # Act
    city = City.new({location_key: duplicated_location_key})
    city.save
    duplicated = City.new({location_key: duplicated_location_key})

    # Assert
    assert_not duplicated.save
  end

  test "string representation should contain city and country names" do
    # Arrange
    city_name = "Santiago"
    country = "Chile"
    location_key = 1
    city = City.new({name: city_name, country: country, location_key: location_key})

    # Act
    string_representation = city.to_s

    # Assert
    assert string_representation.include?(city_name) and string_representation.include?(country)
  end

  test "should create city with same name" do
    # Arrange
    city_name = "Santiago"
    location_key_1 = 1
    country_1 = "Chile"
    location_key_2 = 2
    country_2 = "Mexico"
    city_1 = City.new({name: city_name, country: country_1, location_key: location_key_1})
    city_2 = City.new({name: city_name, country: country_2, location_key: location_key_2})

    # Act
    city_1.save

    # Assert
    assert city_2.save
  end

  test "should create city with same country" do
    # Arrange
    country = "Chile"
    location_key_1 = 1
    city_1 = "Santiago"
    location_key_2 = 2
    city_2 = "Temuco"
    city_1 = City.new({name: city_1, country: country, location_key: location_key_1})
    city_2 = City.new({name: city_2, country: country, location_key: location_key_2})

    # Act
    city_1.save

    # Assert
    assert city_2.save
  end
end
