# frozen_string_literal: true

class Comment < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :body
    validates :email
  end

  belongs_to :post, optional: true

  accepts_nested_attributes_for :post
end
