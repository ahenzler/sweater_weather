require 'rails_helper'

RSpec.describe 'Coordinates Facade' do
  it 'can return boise location', :vcr do
    location = CoordinatesFacade.find_coordinates('Boise,ID')

    expect(location).to be_a(Location)
    expect(location.lat).to eq(43.615791)
    expect(location.long).to eq(-116.201579)
  end

  it 'can return auckland location' , :vcr do
    location = CoordinatesFacade.find_coordinates('Auckland,NZ')

    expect(location).to be_a(Location)
    expect(location.lat).to eq( -36.853467)
    expect(location.long).to eq(174.765551)
  end
end