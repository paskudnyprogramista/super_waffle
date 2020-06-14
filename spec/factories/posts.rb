# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { Faker::TvShows::Simpsons.episode_title }
    body { Faker::TvShows::Simpsons.quote }
  end
end
