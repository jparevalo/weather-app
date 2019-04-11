require 'test_helper'

class ForecastTest < ActiveSupport::TestCase
  test "lower_boundary is inside set for cloud cover color" do
    # Arrange
    cloud_cover = 0
    forecast = Forecast.new({cloud_cover: cloud_cover})
    expected_response = {:color => "#61C6D6", :legend => "0% - 20%"}

    # Act
    color_response = forecast.get_cloud_cover_color

    # Assert
    assert_equal(expected_response, color_response)
  end

  test "upper_boundary is inside set for cloud cover color" do
    # Arrange
    cloud_cover = 20
    forecast = Forecast.new({cloud_cover: cloud_cover})
    expected_response = {:color => "#61C6D6", :legend => "0% - 20%"}

    # Act
    color_response = forecast.get_cloud_cover_color

    # Assert
    assert_equal(expected_response, color_response)
  end

  test "values outside of range should return empty cloud cover color" do
    # Arrange
    cloud_cover = 1000
    forecast = Forecast.new({cloud_cover: cloud_cover})
    expected_response = {:color => "", :legend => ""}

    # Act
    color_response = forecast.get_cloud_cover_color

    # Assert
    assert_equal(expected_response, color_response)
  end
end
