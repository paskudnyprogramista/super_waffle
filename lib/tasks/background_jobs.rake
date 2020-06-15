# frozen_string_literal: true

require 'json_placeholder/api_client'

namespace :background_jobs do
  desc 'Schedule JSONPlaceholder data synchronization for Users'
  task schedule_jsonplaceholder_users_sync: :environment do
    puts 'Schedule Jobs...'

    JsonPlaceholder::SyncUserJob.perform_later

    puts 'Done.'
  end

  desc 'Schedule JSONPlaceholder data synchronization for Posts'
  task schedule_jsonplaceholder_posts_sync: :environment do
    puts 'Schedule Jobs...'

    JsonPlaceholder::SyncPostJob.perform_later

    puts 'Done.'
  end

  desc 'Schedule JSONPlaceholder data synchronization for Comments'
  task schedule_jsonplaceholder_comments_sync: :environment do
    puts 'Schedule Jobs...'

    JsonPlaceholder::SyncCommentJob.perform_later

    puts 'Done.'
  end
end
