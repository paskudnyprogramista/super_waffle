# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    street { Faker::Address.street_name }
    suite { Faker::Address.building_number }
    city { Faker::Address.city }
    zip { Faker::Address.zip }
    user
    geo
  end
end
