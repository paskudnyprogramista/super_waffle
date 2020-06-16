# frozen_string_literal: true

RSpec.shared_examples 'should raise unknown attribute error' do
  it 'raises UnknownAttributeError' do
    expect { subject }.to raise_error(ActiveModel::UnknownAttributeError)
  end
end
