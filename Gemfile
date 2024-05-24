# frozen_string_literal: true

source "https://rubygems.org"
ruby "3.2.3"

gem "active_model_serializers"
gem "bootsnap", require: false
gem "config"
gem "figaro"
gem "importmap-rails"
gem "jbuilder"
gem "pagy"
gem "pg", "~> 1.1"
gem "puma"
gem "rails", "~> 7.1.3", ">= 7.1.3.2"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i(windows jruby)

group :development, :test do
  gem "debug", platforms: %i(mri windows)
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "pry"
  gem "rspec-rails", "~> 6.1.1"
  gem "rswag"
  gem "rswag-api"
  gem "rswag-ui"
  gem "rubocop", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
