# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe JsonPlaceholder::AddressDataMapper, type: :data_mapper do
  subject(:address_model) { described_class.new.call(data) }

  let(:data) do
    {
      "street": 'Kulas Light',
      "suite": 'Apt. 556',
      "city": 'Gwenborough',
      "zipcode": '92998-3874',
      "geo": {
        "lat": '-37.3159',
        "lng": '81.1496'
      }
    }
  end

  describe '.call' do
    let(:valid_address_data_part) do
      {
        "street": 'Kulas Light',
        "suite": 'Apt. 556',
        "city": 'Gwenborough',
        "zip": '92998-3874'
      }
    end

    let(:valid_geo_data_part) do
      {
        "lat": '-37.3159',
        "lng": '81.1496'
      }
    end

    context 'with invalid key in data resource' do
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

    it 'maintains data integrity in Post model' do
      expect(address_model).to have_attributes(valid_address_data_part)
    end

    it 'returns Address model' do
      expect(address_model).to be_a(Address)
    end

    it 'build Geo model' do
      expect(address_model.geo).to be_a(Geo)
    end
  end
end
# rubocop:enable Metrics/BlockLength
