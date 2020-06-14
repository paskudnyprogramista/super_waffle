# frozen_string_literal: true

module JsonPlaceholder
  module Endpoints
    class User
      class << self
        def all
          JsonPlaceholder::Request.new.get('users')
        end
      end
    end
  end
end
