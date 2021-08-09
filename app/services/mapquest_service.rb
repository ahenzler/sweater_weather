class MapQuestService

  def self.get_coordinates(city, state)
    new.request_api("/geocoding/v1/address?location=#{city},#{state}")
  end

  def request_api(path)
    response = conn("http://www.mapquestapi.com").get(path) do |faraday|
      faraday.params['key'] = ENV['mapquest_key']
    end

    parse_json(response)
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn(url)
    Faraday.new(url)
  end
end