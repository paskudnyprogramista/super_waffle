# frozen_string_literal: true

module JsonPlaceholder
  class AddressService
    include Dry::Monads

    class << self
      def create_or_update
        Dry::Monads::Success(:ok)
      end
    end
  end
end
