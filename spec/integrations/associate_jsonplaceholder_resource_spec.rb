# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable RSpec/DescribeClass
# rubocop:disable Metrics/BlockLength
RSpec.describe 'Associate JSONPlaceholder resources', type: :integration do
  # rubocop:enable RSpec/DescribeClass

  describe 'Data synchronization for Users' do
    subject(:address_service) { JsonPlaceholder::AddressService.populate(address_data) }

    let(:address_data) do
      {
        "id": 1,
        "street": 'Kulas Light',
        "suite": 'Apt. 556',
        "city": 'Gwenborough',
        "zipcode": '92998-3874',
        "geo": {
          "lat": '-37.3159',
          "lng": '81.1496'
        },
        "orig_user_id": user_id
      }
    end

    context 'when user does not exists' do
      let(:user_id) { nil }

      it 'creates address without user association' do
        expect { address_service }.to change(Address, :count).by(1)
      end

      it 'sets nil in user_id association' do
        address_service

        expect(Address.last.user).to be_nil
      end
    end

    context 'when user exists' do
      let(:user_id) { 9 }
      let(:orig_user_id) { user_id }
      let!(:user) { create(:user, id: user_id, orig_user_id: user_id) }

      it 'creates address with user association' do
        expect { address_service }.to change(Address, :count).by(1)
      end

      it 'sets user in user_id association' do
        address_service

        expect(Address.last.user).to eq(user)
      end
    end
  end

  describe 'Data synchronization for Posts' do
    subject(:post_service) { JsonPlaceholder::PostService.populate(post_data) }

    let(:post_data) do
      {
        "id": 1,
        "title": 'Title',
        "body": 'Body',
        "userId": user_id
      }
    end

    context 'when user does not exists' do
      let(:user_id) { nil }

      it 'creates post without user association' do
        expect { post_service }.to change(Post, :count).by(1)
      end

      it 'sets nil in user association' do
        post_service

        expect(Post.last.user).to be_nil
      end
    end

    context 'when user exists' do
      let(:user_id) { 9 }
      let(:orig_user_id) { user_id }
      let!(:user) { create(:user, id: user_id, orig_user_id: user_id) }

      it 'creates post with user association' do
        expect { post_service }.to change(Post, :count).by(1)
      end

      it 'sets user in user association' do
        post_service

        expect(Post.last.user).to eq(user)
      end
    end
  end

  describe 'Data synchronization for Comments' do
    subject(:comment_service) { JsonPlaceholder::CommentService.populate(comment_data) }

    let(:comment_data) do
      {
        "id": 1,
        "name": 'name',
        "email": 'email@example.co',
        "body": 'body',
        "orig_post_id": post_id
      }
    end

    context 'when post does not exists' do
      let(:post_id) { nil }

      it 'creates comment without post association' do
        expect { comment_service }.to change(Comment, :count).by(1)
      end

      it 'sets nil in post association' do
        comment_service

        expect(Comment.last.post).to be_nil
      end
    end

    context 'when post exists' do
      let(:post_id) { 7 }
      let(:orig_post_id) { post_id }
      let!(:post) { create(:post, id: post_id, orig_post_id: post_id) }

      it 'creates comment with post association' do
        expect { comment_service }.to change(Comment, :count).by(1)
      end

      it 'sets post in post association' do
        comment_service

        expect(Comment.last.post).to eq(post)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
