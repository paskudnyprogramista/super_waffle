# frozen_string_literal: true

module JsonPlaceholder
  class SyncUserJob < ApplicationJob
    queue_as :default

    def perform(user_data)
      Rails.logger.debug user_data
    end
  end
end
