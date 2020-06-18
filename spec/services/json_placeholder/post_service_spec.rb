# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength:
RSpec.describe JsonPlaceholder::PostService, type: :service do
  subject(:service) { described_class.populate(post_data) }

  let(:valid_post_data) do
    {
      "id": 1,
      "title": 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
      "body": 'quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae',
      "user_id": user.id
    }
  end

  let(:invalid_post_data) do
    {
      "id": 1,
      "title": 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
      "body": nil
    }
  end

  describe '.populate with valid data' do
    let(:post_data) { valid_post_data }
    let(:user) { create(:user) }

    context 'when post does not exists' do
      it 'returns Success' do
        expect(service).to be_a(Dry::Monads::Success)
      end
    end

    context 'when post exists' do
      let!(:post) { create(:post, id: post_data[:id], title: 'Some Title') }

      it 'returns Success' do
        expect(service).to be_a(Dry::Monads::Success)
      end

      it 'updates post' do
        service

        expect(post.reload.title).to eq(post_data[:title])
      end
    end
  end

  describe '.populate with invalid data' do
    let(:post_data) { invalid_post_data }

    context 'when post does not exists' do
      it 'raise RecordNotSaved error' do
        expect { service }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength:
