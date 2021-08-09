class Brewery
  attr_reader :id, :destination, :breweries, :forecast

  def initialize(city_state_names, forecast_info, breweries_info)
    @id = nil
    @destination = city_state_names.strip.downcase
    @breweries_info = breweries_info
    @forecast_info = forecast_info
  end

  def breweries
    @breweries_info.map do |brewery|
      {id: brewery[:id], name: brewery[:name], brewery_type: brewery[:brewery_type]}
    end
  end

  def forecast
    {summary: @forecast_info.conditions, temperture: "#{@forecast_info.temp}°F"}
  end
end