# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Geo, type: :model do
  it { is_expected.to validate_presence_of(:lat) }
  it { is_expected.to validate_presence_of(:lng) }
end
