require 'rails_helper'

RSpec.describe 'Location' do
  it 'can return lat and long' do
    location = {"lat": 44.0266, "lng": 116.9629}
    ontario = Location.new(location)

    expect(ontario.lat).to eq(44.0266)
    expect(ontario.long).to eq(116.9629)
  end
end