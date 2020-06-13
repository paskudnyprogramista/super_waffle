# frozen_string_literal: true

class Address < ApplicationRecord
  with_options presence: true do
    validates :street
    validates :suite
    validates :city
    validates :zip
  end

  belongs_to :user
end
