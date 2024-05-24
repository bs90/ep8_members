# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name_roma { Faker::Name.name }
    name_kata { Faker::Name.name }
    email { Faker::Internet.email }
    date_of_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
    address { Faker::Address.full_address }
    original_role { Faker::Number.between(from: 1, to: 10) }
    training_role { Faker::Number.between(from: 1, to: 10) }
    role { Faker::Number.between(from: 1, to: 10) }
  end
end
