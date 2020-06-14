# frozen_string_literal: true

require 'json_placeholder/endpoints'

module JsonPlaceholder
  class ApiClient
    def users
      JsonPlaceholder::Endpoints::User.all
    end

    def posts
      JsonPlaceholder::Endpoints::Post.all
    end

    def comments
      JsonPlaceholder::Endpoints::Comment.all
    end
  end
end
