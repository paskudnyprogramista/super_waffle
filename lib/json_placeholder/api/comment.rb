# frozen_string_literal: true

module JsonPlaceholder
  module Api
    class Comment
      def initialize(client)
        @client = client
      end

      class << self
        def all(_client)
          []
        end
      end
    end
  end
end
