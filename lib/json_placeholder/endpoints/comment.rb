# frozen_string_literal: true

module JsonPlaceholder
  module Endpoints
    class Comment
      class << self
        def all
          JsonPlaceholder::Request.new.get('comments')
        end
      end
    end
  end
end
