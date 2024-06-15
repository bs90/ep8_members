# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name_roma {Faker::Name.name}
    name_kata {Faker::Name.name}
    email {"mai.trong.dung@sun-asterisk.com"}
    date_of_birth {Faker::Date.birthday(min_age: 18, max_age: 65)}
    address {Faker::Address.full_address}
    original_role {Faker::Number.between(from: 0, to: 1)}
    training_role {Faker::Number.between(from: 0, to: 2)}
    role {Faker::Number.between(from: 0, to: 1)}
    provider {"google_oauth2"}
  end
end
