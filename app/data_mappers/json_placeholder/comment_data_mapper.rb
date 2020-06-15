# frozen_string_literal: true

require 'dry/transformer/class'

module JsonPlaceholder
  class CommentDataMapper < Dry::Transformer::Pipe
    import Dry::Transformer::HashTransformations
    import Dry::Transformer::ClassTransformations

    define! do
      deep_symbolize_keys

      constructor_inject Comment
    end
  end
end
