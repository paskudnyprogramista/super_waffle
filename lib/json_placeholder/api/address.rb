# frozen_string_literal: true

module JsonPlaceholder
  module Api
    class Address
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
