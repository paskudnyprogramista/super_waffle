# frozen_string_literal: true

require 'dry/transformer/class'

module JsonPlaceholder
  class AddressDataMapper < Dry::Transformer::Pipe
    import Dry::Transformer::HashTransformations
    import Dry::Transformer::ClassTransformations

    define! do
      deep_symbolize_keys

      rename_keys zipcode: :zip

      map_value :geo do
        constructor_inject Geo
      end

      constructor_inject Address
    end
  end
end
