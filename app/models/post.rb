# frozen_string_literal: true

class Post < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :body
  end

  belongs_to :user
end
