require 'rails_helper'

RSpec.describe 'Background' do
  it 'can return backgorund image info', :vcr do
    data = {results:
            [{ location: 'boise,id',
            background_image_urls:
                                  {raw: "https://images.unsplash.com/photo-1604359027531-d8e4865ad050?ixid=MnwyNTI5Mzl8MHwxfHNlYXJjaHwxfHwlMjdib2lzZSUyQ2lkJTJDY2l0eXNjYXBlJTI3fGVufDB8fHx8MTYyODY4MDgwNw&ixlib=rb-1.2.1",
                                  full: "https://images.unsplash.com/photo-1604359027531-d8e4865ad050?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNTI5Mzl8MHwxfHNlYXJjaHwxfHwlMjdib2lzZSUyQ2lkJTJDY2l0eXNjYXBlJTI3fGVufDB8fHx8MTYyODY4MDgwNw&ixlib=rb-1.2.1&q=85",
                                  regular: "https://images.unsplash.com/photo-1604359027531-d8e4865ad050?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTI5Mzl8MHwxfHNlYXJjaHwxfHwlMjdib2lzZSUyQ2lkJTJDY2l0eXNjYXBlJTI3fGVufDB8fHx8MTYyODY4MDgwNw&ixlib=rb-1.2.1&q=80&w=1080",
                                  small: "https://images.unsplash.com/photo-1604359027531-d8e4865ad050?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTI5Mzl8MHwxfHNlYXJjaHwxfHwlMjdib2lzZSUyQ2lkJTJDY2l0eXNjYXBlJTI3fGVufDB8fHx8MTYyODY4MDgwNw&ixlib=rb-1.2.1&q=80&w=400",
                                  thumb: "https://images.unsplash.com/photo-1604359027531-d8e4865ad050?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTI5Mzl8MHwxfHNlYXJjaHwxfHwlMjdib2lzZSUyQ2lkJTJDY2l0eXNjYXBlJTI3fGVufDB8fHx8MTYyODY4MDgwNw&ixlib=rb-1.2.1&q=80&w=200"
                                  },
            credit:
                    { source: "unsplash.com",
                      author: "courtneysmith",
                      logo: "https://unsplash.com/photos/QdqK4doOzcQ"}
          }]}

    city_image = Background.new('boise,id', data)

    expect(city_image).to be_a(Background)
    expect(city_image.id).to eq(nil)
  end
end