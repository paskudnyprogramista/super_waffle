# frozen_string_literal: true

class Address < ApplicationRecord
  with_options presence: true do
    validates :street
    validates :suite
    validates :city
    validates :zip
  end

  belongs_to :user
  belongs_to :geo

  accepts_nested_attributes_for :user, :geo
end
