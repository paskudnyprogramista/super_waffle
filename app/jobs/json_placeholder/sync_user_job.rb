# frozen_string_literal: true

module JsonPlaceholder
  class SyncUserJob < ApplicationJob
    queue_as :default

    def perform(*args)
      # Do something later
    end
  end
end
