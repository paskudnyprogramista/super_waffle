# frozen_string_literal: true

module JsonPlaceholder
  class SyncPostJob < ApplicationJob
    queue_as :default

    def perform(post_data)
      JsonPlaceholder::PostDataMapper.new.call(post_data)
    end
  end
end
