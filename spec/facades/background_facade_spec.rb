require 'rails_helper'

RSpec.describe 'Background Facade' do
  it 'can return a photos object', :vcr do
    response = BackgroundFacade.get_image_url("boise,id")

    expect(response).to be_a(Background)
    expect(response.id).to be_nil
    expect(response.background_image).to be_a(Hash)
    expect(response.background_image).to have_key(:location)
    expect(response.background_image[:location]).to be_a(String)
    expect(response.background_image).to have_key(:background_image_url)
    expect(response.background_image[:background_image_url]).to be_a(String)
    expect(response.background_image).to have_key(:credit)
    expect(response.background_image[:credit]).to be_a(Hash)
    expect(response.background_image[:credit]).to have_key(:source)
    expect(response.background_image[:credit][:source]).to be_a(String)
    expect(response.background_image[:credit]).to have_key(:author)
    expect(response.background_image[:credit][:author]).to be_a(String)
    expect(response.background_image[:credit]).to have_key(:logo)
    expect(response.background_image[:credit][:logo]).to be_a(String)
  end
end