class BreweryService
  class << self

    def get_breweries(lat_long, quantity)
      response = conn.get("/breweries?by_dist=#{lat_long[0]},#{lat_long[1]}&per_page=#{quantity}")
      parse_json(response)
    end

    private

    def conn
      Faraday.new('https://api.openbrewerydb.org')
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end