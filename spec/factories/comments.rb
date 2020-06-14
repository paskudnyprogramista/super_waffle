# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    name { Faker::TvShows::Simpsons.episode_title }
    body { Faker::TvShows::Simpsons.quote }
    email { Faker::Internet.unique.email }
  end
end
