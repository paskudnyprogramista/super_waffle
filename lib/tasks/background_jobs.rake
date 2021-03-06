# frozen_string_literal: true

require 'json_placeholder/api_client'

# rubocop:disable Metrics/BlockLength
namespace :background_jobs do
  desc 'Schedule JSONPlaceholder data synchronization for Users'
  task schedule_jsonplaceholder_users_sync: :environment do
    Rails.logger.info 'Schedule Sync User, Company and Address Jobs...'

    # TODO: Impl module responsible for handling big sized array
    users_data = JsonPlaceholder::ApiClient.new.users
    users_data.each do |user_data|
      address_data = user_data.extract!(:address).fetch(:address, {})
      address_data.merge!(orig_user_id: user_data.fetch(:id))

      JsonPlaceholder::SyncUserJob.perform_later(user_data)
      JsonPlaceholder::SyncAddressJob.perform_later(address_data)
    end

    Rails.logger.info "Scheduled #{users_data.count} jobs."
    Rails.logger.info 'Done.'
  end

  desc 'Schedule JSONPlaceholder data synchronization for Posts'
  task schedule_jsonplaceholder_posts_sync: :environment do
    Rails.logger.info 'Schedule Sync Posts Jobs...'

    # TODO: Impl module responsible for handling big sized array
    posts_data = JsonPlaceholder::ApiClient.new.posts
    posts_data.each do |post_data|
      JsonPlaceholder::SyncPostJob.perform_later(post_data)
    end

    Rails.logger.info "Scheduled #{posts_data.count} jobs."
    Rails.logger.info 'Done.'
  end

  desc 'Schedule JSONPlaceholder data synchronization for Comments'
  task schedule_jsonplaceholder_comments_sync: :environment do
    Rails.logger.info 'Schedule Sync Comment Jobs...'

    # TODO: Impl module responsible for handling big sized array
    comments_data = JsonPlaceholder::ApiClient.new.comments
    comments_data.each do |comment_data|
      JsonPlaceholder::SyncCommentJob.perform_later(comment_data)
    end

    Rails.logger.info "Scheduled #{comments_data.count} jobs."
    Rails.logger.info 'Done.'
  end
end
# rubocop:enable Metrics/BlockLength
