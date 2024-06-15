# frozen_string_literal: true

FactoryBot.define do
  factory :token do
    access_token {Faker::Internet.uuid}
    access_token_expires_at {Faker::Time.forward(days: Settings.token.access_token_expires_at, period: :day)}
    association :user
  end
end
