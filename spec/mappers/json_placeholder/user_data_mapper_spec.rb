# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe JsonPlaceholder::UserDataMapper, type: :data_mapper do
  subject(:user_model) { described_class.new.call(data) }

  let(:data) do
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

  describe '.call' do
    let(:valid_company_data_part) do
      {
        name: 'Romaguera-Crona',
        catchphrase: 'Multi-layered client-server neural-net',
        bs: 'harness real-time e-markets'
      }
    end

    context 'with invalid key in data resource' do
      let(:data) do
        {
          "id": 1,
          "unknown_key": 'unknown_key',
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

      include_examples 'should raise unknown attribute error'
    end

    it 'maintains data integrity in User model' do
      expect(user_model).to have_attributes(data.except!(:company, :id))
    end

    it 'returns User model' do
      expect(user_model).to be_a(User)
    end

    it 'maintains data integrity in Company model' do
      expect(user_model.company).to have_attributes(valid_company_data_part)
    end

    it 'build Company model' do
      expect(user_model.company).to be_a(Company)
    end
  end
end
# rubocop:enable Metrics/BlockLength
