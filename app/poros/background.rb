class Background
  attr_reader :id

  def initialize(city_state_names, data)
    @id = nil
    @url = data[:results][0][:urls][:raw]
    @username = data[:results][0][:user][:username]
    @city_state_names = city_state_names.strip.downcase
  end

  def background_image
    {location: @city_state_names,
      background_image_url: @url,
      credit: { source: "unsplash.com",
                author: @username,
                logo: "https://unsplash.com/photos/QdqK4doOzcQ"},
    }
  end
end