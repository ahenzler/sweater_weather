Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecast_weather, only: [:index]
      resources :breweries, only: [:index]
    end
  end
end
