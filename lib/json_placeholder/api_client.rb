# frozen_string_literal: true

require 'json_placeholder/api'

module JsonPlaceholder
  class ApiClient
    def initialize
      self
    end

    def users
      JsonPlaceholder::Api::User.all(self)
    end

    def companies
      JsonPlaceholder::Api::Company.all(self)
    end

    def addresses
      JsonPlaceholder::Api::Address.all(self)
    end

    def posts
      JsonPlaceholder::Api::Post.all(self)
    end

    def comments
      JsonPlaceholder::Api::Comment.all(self)
    end
  end
end
