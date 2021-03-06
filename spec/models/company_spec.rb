# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:catchphrase) }
  it { is_expected.to validate_presence_of(:bs) }

  it { is_expected.to have_many(:users) }
end
