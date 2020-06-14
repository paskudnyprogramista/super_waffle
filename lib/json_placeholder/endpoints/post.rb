# frozen_string_literal: true

module JsonPlaceholder
  module Endpoints
    class Post
      class << self
        def all
          JsonPlaceholder::Request.new.get('posts')
        end
      end
    end
  end
end
