# frozen_string_literal: true

require 'json_placeholder/api_client'

module JsonPlaceholder
  class SyncUserJob < ApplicationJob
    queue_as :default

    def perform(*_args); end
  end
end
