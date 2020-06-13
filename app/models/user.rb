# frozen_string_literal: true

class User < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :username
    validates :website
    validates :phone
  end

  validates :email, presence: true, uniqueness: true

  belongs_to :company, class_name: 'Company'
end