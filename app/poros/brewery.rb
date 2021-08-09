class Brewery
  attr_reader :id, :destination, :breweries, :forecast

  def initialize(city_state_names, forecast, breweries)
    @id = nil
    @destination = city_state_names.strip.downcase
    @breweries = breweries
    @forecast = forecast
  end

  def breweries_info
    @breweries.map do |brewery|
      {id: brewery[:id], name: brewery[:name], brewery_type: brewery[:brewery_type]}
    end
  end

  def forecast_info
    @forecast.map do |forecast|
      {summary: @forecast.conditions, temperture: "#{@forecast.temp}°F"}
    end
  end
end