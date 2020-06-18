# frozen_string_literal: true

module JsonPlaceholder
  class SyncAddressJob < ApplicationJob
    queue_as :default

    def perform(address_data)
      JsonPlaceholder::AddressDataMapper.new.call(address_data)
    end
  end
end
