# frozen_string_literal: true

class Geo < ApplicationRecord
  with_options presence: true do
    validates :lat
    validates :lng
  end
end
