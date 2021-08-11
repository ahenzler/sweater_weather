class BackgroundFacade
  class << self
    def get_image_url(city_state_names)
      json = BackgroundService.get_background(city_state_names)
      Background.new(city_state_names, json)
    end
  end
end