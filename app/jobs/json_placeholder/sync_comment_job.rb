# frozen_string_literal: true

require 'json_placeholder/api_client'

module JsonPlaceholder
  class SyncCommentJob < ApplicationJob
    queue_as :default

    def perform(*_args); end
  end
end
