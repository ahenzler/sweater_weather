# Sweater Weather
## About 
Project Description
You are a back-end developer working on a team that is building an application to plan road trips. This app will allow users to see the current weather as well as the forecasted weather at the destination.

Your team is working in a service-oriented architecture. The front-end will communicate with your back-end through an API. Your job is to expose that API that satisfies the front-end team’s requirements

## Versions

- Ruby 2.7.2

- Rails 5.2.6

## Initial Setup
1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`
4. Run migrations: ` rails db:migrate`
5. Install the Figaro gem: `bundle exec figaro install`
6. Create an account with [Open Weather Map](https://home.openweathermap.org/users/sign_up) and request an API key
7. Create an account with [Map Quest API](https://developer.mapquest.com/plan_purchase/steps/business_edition/business_edition_free/register)
8. Create an account with [Unsplash API](https://unsplash.com/join)
9. Add your API key to the `application.yml` created by Figaro:
  ```rb
  OPENWEATHER: your_api_key
  MAPQUEST: your_api_key
  BACKGROUND: your_api_key
  ```

## Gems Used
Testing
* [rspec-rails](https://github.com/rspec/rspec-rails)
* [capybara](https://github.com/teamcapybara/capybara)
* [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
* [simplecov](https://github.com/simplecov-ruby/simplecov)
* [webmock](https://github.com/bblimke/webmock)
* [vcr](https://github.com/vcr/vcr)

API Consumption
* [faraday](https://github.com/lostisland/faraday)
* [figaro](https://github.com/laserlemon/figaro)

## How To Run Rspec Tests
Run `bundle exec rspec` to run the test suite


## Author

- Alicia Henzler - [ahenzler](https://github.com/ahenzler)
