require 'rails_helper'

RSpec.describe ' background' do
  describe 'happy path' do
    it 'can get a city\'s background', :vcr do
      get '/api/v1/backgrounds', params: {location: "boise,id,"}
      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
    end
  end
end