# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { Faker::TvShows::Simpsons.location }
    body { Faker::TvShows::Simpsons.quote }
    user
  end
end
