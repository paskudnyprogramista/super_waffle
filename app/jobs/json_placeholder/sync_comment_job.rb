# frozen_string_literal: true

module JsonPlaceholder
  class SyncCommentJob < ApplicationJob
    queue_as :default

    def perform(comment_data)
      JsonPlaceholder::CommentService.populate(comment_data)
    end
  end
end
