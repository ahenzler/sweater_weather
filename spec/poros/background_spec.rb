require 'rails_helper'

RSpec.describe 'Background' do
  it 'can return backgorund image info', :vcr do
    city_state_names = 'boise,id'
    data = BackgroundService.get_background(city_state_names)

    city_image = Background.new(city_state_names, data)

    expect(city_image).to be_a(Background)
    expect(city_image.id).to be_nil
    expect(city_image.background_image).to be_a(Hash)
    expect(city_image.background_image).to have_key(:location)
    expect(city_image.background_image[:location]).to be_a(String)
    expect(city_image.background_image).to have_key(:background_image_url)
    expect(city_image.background_image[:background_image_url]).to be_a(String)
    expect(city_image.background_image).to have_key(:credit)
    expect(city_image.background_image[:credit]).to be_a(Hash)
    expect(city_image.background_image[:credit]).to have_key(:source)
    expect(city_image.background_image[:credit][:source]).to be_a(String)
    expect(city_image.background_image[:credit]).to have_key(:author)
    expect(city_image.background_image[:credit][:author]).to be_a(String)
    expect(city_image.background_image[:credit]).to have_key(:logo)
    expect(city_image.background_image[:credit][:logo]).to be_a(String)
  end
end