# frozen_string_literal: true

namespace :background_jobs do
  desc 'Schedule synchronization JSONPlaceholder data job '
  task schedule_sync_jsonplaceholder_data: :environment do
    puts 'Schedule Job...'

    # Do something later

    puts 'Done.'
  end
end
