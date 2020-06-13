# frozen_string_literal: true

class User < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :username
    validates :website
    validates :phone, presence: true
  end

  validates :email, presence: true, uniqueness: true
end
