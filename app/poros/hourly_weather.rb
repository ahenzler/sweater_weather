
class HourlyWeather
  attr_reader :datetime,
                :temp,
                :feels_like,
                :pressure,
                :humidity,
                :dewpoint,
                :uvi,
                :clouds,
                :visibility,
                :wind_speed,
                :wind_deg,
                :wind_gust,
                :conditions,
                :description,
                :icon

  def initialize(data)
    @datetime = Time.at(data[:dt]).to_s
    @temp = data[:temp]
    @feels_like = data[:feels_like]
    @pressure = data[:pressure]
    @humidity = data[:humidity]
    @dewpoint = data[:dew_point]
    @uvi = data[:uvi]
    @clouds = data[:clouds]
    @visibility = data[:visibility]
    @wind_speed = data[:wind_speed]
    @wind_deg = data[:wind_deg]
    @wind_gust = data[:wind_gust]
    @conditions = data[:weather].first[:main]
    @description = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end
end