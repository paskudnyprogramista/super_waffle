# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe JsonPlaceholder::CommentDataMapper, type: :data_mapper do
  # rubocop:enable Metrics/BlockLength
  
  subject { described_class.new.call(data) }

  let(:data) do
    {
      "id": '1',
      "name": 'id labore ex et quam laborum',
      "email": 'Eliseo@gardner.biz',
      "body": 'laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora'
    }
  end

  describe '.call' do
    context 'with invalid data resource' do
      let(:data) do
        {
          "id": '1',
          "name": 'id labore ex et quam laborum',
          "email": 'Eliseo@gardner.biz',
          "body": 'laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora',
          "unknown_key": 'unknown_key'
        }
      end

      include_examples 'should raise unknown attribute error'
    end

    it 'returns Comment model' do
      expect(subject).to be_a(Comment)
    end
  end
end
