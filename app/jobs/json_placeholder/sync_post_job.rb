# frozen_string_literal: true

module JsonPlaceholder
  class SyncPostJob < ApplicationJob
    queue_as :default

    def perform(post_data)
      JsonPlaceholder::PostService.populate(post_data)
    end
  end
end
