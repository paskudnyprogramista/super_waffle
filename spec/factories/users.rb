# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    username { Faker::Superhero.descriptor.downcase }
    email { Faker::Internet.unique.email }
    website { Faker::Internet.domain_name }
    phone { Faker::PhoneNumber.phone_number }
    company
  end
end
