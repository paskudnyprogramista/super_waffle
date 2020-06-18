# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength:
RSpec.describe JsonPlaceholder::CommentService, type: :service do
  subject(:service) { described_class.populate(comment_data) }

  let(:valid_comment_data) do
    {
      "id": 1,
      "name": 'id labore ex et quam laborum',
      "email": 'Eliseo@gardner.biz',
      "body": 'laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora',
      "post_id": post.id
    }
  end

  let(:invalid_comment_data) do
    {
      "id": 1,
      "name": 'id labore ex et quam laborum',
      "email": nil,
      "body": 'laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora'
    }
  end

  describe '.populate with valid data' do
    let(:comment_data) { valid_comment_data }
    let(:post) { create(:post) }

    context 'when comment does not exists' do
      it 'returns Success' do
        expect(service).to be_a(Dry::Monads::Success)
      end
    end

    context 'when comment exists' do
      let!(:comment) { create(:comment, body: 'Some Body') }

      it 'returns Success' do
        expect(service).to be_a(Dry::Monads::Success)
      end

      it 'updates comment' do
        service

        expect(comment.reload.body).to eq(comment_data[:body])
      end
    end
  end

  describe '.populate with invalid data' do
    let(:comment_data) { invalid_comment_data }

    context 'when comment does not exists' do
      it 'raise RecordNotSaved error' do
        expect { service }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength:
