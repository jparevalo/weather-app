class Forecast < ApplicationRecord

  def get_cloud_cover_color
    color = ""
    case cloud_cover
      when 0..20
        color, legend = "#61C6D6", "0% - 20%"
      when 21..40
        color, legend = "#5BA7B3", "21% - 40%"
      when 41..60
        color, legend = "#558890", "41% - 60%"
      when 61..80
        color, legend = "#4F696D", "61% - 80%"
      when 81.100
        color, legend = "#4A4A4A", "81% - 100%"
    end
    {:color => color, :legend => legend}
  end

  def get_wind_image_path
    path = ""
    case wind_direction
      when "N"
        path = "wind-n.png"
      when "NNE"
        path = "wind-nne.png"
      when "NE"
        path = "wind-ne.png"
      when "ENE"
        path = "wind-ene.png"
      when "E"
        path = "wind-e.png"
      when "ESE"
        path = "wind-ese.png"
      when "SE"
        path = "wind-se.png"
      when "SSE"
        path = "wind-sse.png"
      when "S"
        path = "wind-s.png"
      when "SSO"
        path = "wind-sso.png"
      when "SO"
        path = "wind-so.png"
      when "OSO"
        path = "wind-oso.png"
      when "O"
        path = "wind-o.png"
      when "ONO"
        path = "wind-ono.png"
      when "NO"
        path = "wind-no.png"
      when "NNO"
        path = "wind-nno.png"
    end
    path
  end
end
