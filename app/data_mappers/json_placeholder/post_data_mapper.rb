# frozen_string_literal: true

require 'dry/transformer/class'

module JsonPlaceholder
  class PostDataMapper < Dry::Transformer::Pipe
    import Dry::Transformer::HashTransformations
    import Dry::Transformer::ClassTransformations

    define! do
      deep_symbolize_keys

      rename_keys userId: :orig_user_id
      copy_keys id: :orig_post_id

      constructor_inject Post
    end
  end
end
