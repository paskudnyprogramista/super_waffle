# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength:
RSpec.describe JsonPlaceholder::UserService, type: :service do
  subject(:service) { described_class.populate(user_data) }

  let(:valid_user_data) do
    {
      "id": 1,
      "name": 'Leanne Graham',
      "username": 'Bret',
      "email": 'Sincere@april.biz',
      "phone": '1-770-736-8031 x56442',
      "website": 'hildegard.org',
      "company": {
        "name": 'Romaguera-Crona',
        "catchPhrase": 'Multi-layered client-server neural-net',
        "bs": 'harness real-time e-markets'
      }
    }
  end

  let(:invalid_user_data) do
    {
      "id": 1,
      "name": 'Leanne Graham',
      "username": nil,
      "email": 'Sincere@april.biz',
      "phone": '1-770-736-8031 x56442',
      "website": 'hildegard.org',
      "company": {
        "name": 'Romaguera-Crona',
        "catchPhrase": 'Multi-layered client-server neural-net',
        "bs": 'harness real-time e-markets'
      }
    }
  end

  describe '.populate with valid data' do
    let(:user_data) { valid_user_data }

    context 'when user does not exists' do
      it 'returns Success(:ok) ' do
        expect(service).to be_a(Dry::Monads::Success)
      end
    end

    context 'when user exists' do
      let!(:user) { create(:user, name: 'name_before_change', email: user_data[:email]) }

      it 'returns Success(:ok)' do
        expect(service).to be_a(Dry::Monads::Success)
      end

      it 'updates user' do
        service

        expect(user.reload.name).to eq(user_data[:name])
      end
    end
  end

  describe '.populate with invalid data' do
    let(:user_data) { invalid_user_data }

    context 'when user does not exists' do
      it 'raise RecordNotSaved error' do
        expect { service }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength:
