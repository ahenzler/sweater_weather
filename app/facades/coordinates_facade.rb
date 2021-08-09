class CoordinatesFacade
  class << self
    def find_coordinates(location)
      json = MapquestService.get_address_location(location)
      data = json[:results].first[:locations].first[:latLng]
      Location.new(data)
    end
  end
end