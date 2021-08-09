class DailyWeather
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
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
    @sunrise = Time.at(data[:sunrise]).to_s
    @sunset = Time.at(data[:sunset]).to_s
    @max_temp = data[:temp][:max]
    @min_temp = data[:temp][:min]
    @pressure = data[:pressure]
    @humidity = data[:humidity]
    @dewpoint = data[:dew_point]
    @uvi = data[:uvi]
    @clouds = data[:clouds]
    @wind_speed = data[:wind_speed]
    @wind_deg = data[:wind_deg]
    @wind_gust = data[:wind_gust]
    @conditions = data[:weather].first[:main]
    @description = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end
end