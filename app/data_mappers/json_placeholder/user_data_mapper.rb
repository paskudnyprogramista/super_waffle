# frozen_string_literal: true

require 'dry/transformer/class'

module JsonPlaceholder
  class UserDataMapper < Dry::Transformer::Pipe
    import Dry::Transformer::HashTransformations
    import Dry::Transformer::ClassTransformations

    define! do
      deep_symbolize_keys

      map_value :company do
        rename_keys catchPhrase: :catchphrase
        constructor_inject Company
      end

      constructor_inject User
    end
  end
end
