class MapquestService
  class << self

    def get_address_location(location)
      response = conn.get("/geocoding/v1/address?key=#{ENV['MAPQUEST_API']}&location=#{location}")
      parse_json(response)
    end

    def get_route(starting_location, ending_location)
      response = conn.get("/directions/v2/route?key=#{ENV['MAPQUEST_API']}&from=#{starting_location}&to=#{ending_location}")
      parse_json(response)
    end

    private

    def conn
      Faraday.new('http://www.mapquestapi.com')
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end