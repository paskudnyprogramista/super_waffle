# frozen_string_literal: true

module JsonPlaceholder
  class PostService
    class << self
      include Dry::Monads[:result]

      def populate(post_data)
        mapped_post_model = map_post_data(post_data)
        post = find_post(mapped_post_model.id)
        user = find_user(mapped_post_model.orig_user_id)

        mapped_post_model.user = user

        if post
          post.update!(build_attributes_for_update(mapped_post_model))
        else
          mapped_post_model.save!
        end

        Success(:ok)
      end

      private

      def build_attributes_for_update(mapped_post_model)
        mapped_post_model.attributes.compact!
      end

      def map_post_data(data)
        JsonPlaceholder::PostDataMapper.new.call(data)
      end

      def find_post(id)
        Post.find_by(id: id)
      end

      def find_user(id)
        User.find_by(orig_user_id: id)
      end
    end
  end
end
