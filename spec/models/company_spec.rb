# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:catchphrase) }
  it { should validate_presence_of(:bs) }
end
