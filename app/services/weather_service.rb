class WeatherService
  class << self
    def get_weather(lat, long)
        response = conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{long}&units=imperial&exclude=minutely,alerts&appid=#{ENV['WEATHER_API']}")
        parse_json(response)
    end

    private

    def conn
        Faraday.new('https://api.openweathermap.org')
    end

    def parse_json(response)
        JSON.parse(response.body, symbolize_names: true)
    end
  end
end