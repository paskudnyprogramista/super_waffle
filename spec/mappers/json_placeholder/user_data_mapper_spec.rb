# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe JsonPlaceholder::UserDataMapper, type: :data_mapper do
  # rubocop:enable Metrics/BlockLength

  subject { described_class.new.call(data) }

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
    context 'with invalid data resource' do
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

    it 'returns User model' do
      expect(subject).to be_a(User)
    end

    it 'build Company model' do
      expect(subject.company).to be_a(Company)
    end
  end
end
