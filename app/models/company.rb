# frozen_string_literal: true

class Company < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :catchphrase
    validates :bs
  end

  has_many :users, dependent: :nullify
end
