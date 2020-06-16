# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe JsonPlaceholder::AddressDataMapper, type: :data_mapper do
  # rubocop:enable Metrics/BlockLength
  
  subject { described_class.new.call(data) }

  let(:data) do
    {
      street: 'Kulas Light',
      suite: 'Apt. 556',
      city: 'Gwenborough',
      zipcode: '92998-3874',
      geo: {
        lat: '-37.3159',
        lng: '81.1496'
      }
    }
  end

  describe '.call' do
    context 'with invalid data resource' do
      let(:data) do
        {
          "street": 'Kulas Light',
          "suite": 'Apt. 556',
          "city": 'Gwenborough',
          "zipcode": '92998-3874',
          "geo": {
            "lat": '-37.3159',
            "lng": '81.1496'
          },
          "unknown_key": 'unknown_key'
        }
      end

      include_examples 'should raise unknown attribute error'
    end

    it 'returns Address model' do
      expect(subject).to be_a(Address)
    end

    it 'build Geo model' do
      expect(subject.geo).to be_a(Geo)
    end
  end
end
