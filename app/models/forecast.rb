class Forecast < ApplicationRecord

  def get_cloud_cover_color
    color = ""
    legend = ""
    case cloud_cover
      when 0..20
        color, legend = "#61C6D6", "0% - 20%"
      when 21..40
        color, legend = "#5BA7B3", "21% - 40%"
      when 41..60
        color, legend = "#558890", "41% - 60%"
      when 61..80
        color, legend = "#4F696D", "61% - 80%"
      when 81..100
        color, legend = "#4A4A4A", "81% - 100%"
    end
    {:color => color, :legend => legend}
  end
end
