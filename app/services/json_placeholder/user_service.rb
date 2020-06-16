# frozen_string_literal: true

require 'dry/monads/all'

module JsonPlaceholder
  class UserService
    include Dry::Monads

    class << self
      def create_or_update
        Dry::Monads::Success(:ok)
      end
    end
  end
end
