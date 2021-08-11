class Background
  attr_reader :id,
              :background_image

  def initialize(city_state_names, data)
    @id = nil
    @background_image = data[:results]
    @city_state_names = city_state_names.strip.downcase
  end

  def background_image
    { location: @city_state_names,
      background_image_urls: @background_image[:urls],
      credit: { source: "unsplash.com",
                author: @background_image[:user][:name],
                logo: "https://unsplash.com/photos/QdqK4doOzcQ" }
    }
  end
end