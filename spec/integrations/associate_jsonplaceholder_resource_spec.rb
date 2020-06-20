# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable RSpec/DescribeClass
# rubocop:disable Metrics/BlockLength
RSpec.describe 'Associate JSONPlaceholder resources', type: :integration do
  # rubocop:enable RSpec/DescribeClass

  describe 'post synchronization' do
    context 'when user exists' do
      it 'creates post with user association' do
        false
      end
    end

    context 'when user does not exists' do
      it 'creates post without user association' do
        false
      end
    end
  end

  describe 'user synchronization' do
    context 'when address exists' do
      it 'creates user with address association' do
        false
      end
    end

    context 'when address does not exists' do
      it 'creates user without address association' do
        false
      end
    end
  end

  describe 'comment synchronization' do
    context 'when post exists' do
      it 'creates comment with post association' do
        false
      end
    end

    context 'when post does not exists' do
      it 'creates comment without post association' do
        false
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
