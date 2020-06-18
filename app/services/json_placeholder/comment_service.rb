# frozen_string_literal: true

module JsonPlaceholder
  class CommentService
    class << self
      include Dry::Monads[:result]

      def populate(comment_data)
        mapped_comment_model = map_comment_data(comment_data)
        comment = find_comment(mapped_comment_model.id)

        if comment
          comment.update!(build_attributes_for_update(mapped_comment_model))
        else
          mapped_comment_model.save!
        end

        Success(:ok)
      end

      private

      def build_attributes_for_update(mapped_comment_model)
        mapped_comment_model.attributes.compact!
      end

      def map_comment_data(data)
        JsonPlaceholder::CommentDataMapper.new.call(data)
      end

      def find_comment(id)
        Comment.find_by(id: id)
      end
    end
  end
end
