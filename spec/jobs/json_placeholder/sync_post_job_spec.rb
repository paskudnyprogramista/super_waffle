# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JsonPlaceholder::SyncPostJob, type: :job do
  include ActiveJob::TestHelper

  describe '.perform_later' do
    it 'enqueue job' do
      assert_enqueued_jobs 1 do
        described_class.perform_later
      end
    end
  end
end
