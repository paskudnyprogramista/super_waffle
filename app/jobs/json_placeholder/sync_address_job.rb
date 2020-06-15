# frozen_string_literal: true

module JsonPlaceholder
  class SyncAddressJob < ApplicationJob
    queue_as :default

    def perform(address_data)
      Rails.logger.debug address_data
    end
  end
end
