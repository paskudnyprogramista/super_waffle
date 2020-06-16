# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe JsonPlaceholder::PostDataMapper, type: :data_mapper do
  # rubocop:enable Metrics/BlockLength
  
  subject { described_class.new.call(data) }

  let(:data) do
    {
      "id": '1',
      "title": 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
      "body": 'quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae'
    }
  end

  describe '.call' do
    context 'with invalid data resource' do
      let(:data) do
        {
          "id": '1',
          "title": 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
          "body": 'quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae',
          "unknown_key": 'unknown_key'
        }
      end

      include_examples 'should raise unknown attribute error'
    end

    it 'returns Post model' do
      expect(subject).to be_a(Post)
    end
  end
end
