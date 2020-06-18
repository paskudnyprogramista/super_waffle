# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength:
RSpec.describe JsonPlaceholder::AddressService, type: :service do
  subject(:service) { described_class.populate(address_data) }

  let(:valid_address_data) do
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
      "user_id": user.id
    }
  end

  let(:invalid_address_data) do
    {
      "id": 1,
      "street": 'Kulas Light',
      "suite": nil,
      "city": 'Gwenborough',
      "zipcode": '92998-3874',
      "geo": {
        "lat": '-37.3159',
        "lng": '81.1496'
      }
    }
  end

  describe '.populate with valid data' do
    let(:address_data) { valid_address_data }
    let(:user) { create(:user) }

    context 'when address does not exists' do
      it 'returns Success ' do
        expect(service).to be_a(Dry::Monads::Success)
      end
    end

    context 'when address exists' do
      let!(:address) { create(:address, id: address_data[:id], suite: 'Apt. 1') }

      it 'returns Success' do
        expect(service).to be_a(Dry::Monads::Success)
      end

      it 'updates address' do
        service

        expect(address.reload.suite).to eq(address_data[:suite])
      end
    end
  end

  describe '.populate with invalid data' do
    let(:address_data) { invalid_address_data }

    context 'when address does not exists' do
      it 'raise RecordNotSaved error' do
        expect { service }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength:
