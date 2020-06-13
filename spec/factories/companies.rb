# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    catchphrase { Faker::Company.catch_phrase }
    bs { Faker::Company.bs }
  end
end
