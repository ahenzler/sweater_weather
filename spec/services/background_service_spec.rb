require 'rails_helper'

RSpec.describe 'Background Service' do
  it 'can return photo of searched location', :vcr do
    response = BackgroundService.get_background("denver,co")

    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
    expect(response[:results]).to be_a(Array)
  end
end