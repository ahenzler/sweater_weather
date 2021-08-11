class BackgroundService
  class << self
    def get_background(city_state_names)
      response = conn.get("/search/photos?client_id=#{ENV['BACKGROUND_API']}&per_page=1&query=#{'city_state_names'}")
      parse_json(response)
    end

    private

    def conn
      Faraday.new('https://api.unsplash.com')
    end

    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end