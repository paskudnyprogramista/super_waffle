# frozen_string_literal: true

class Post < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :body
  end

  belongs_to :user, optional: true

  has_many :comments, dependent: :nullify

  accepts_nested_attributes_for :user
end
