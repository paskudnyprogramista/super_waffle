# frozen_string_literal: true

module JsonPlaceholder
  class SyncUserJob < ApplicationJob
    queue_as :default

    def perform(user_data)
      JsonPlaceholder::UserService.populate(user_data)
    end
  end
end
