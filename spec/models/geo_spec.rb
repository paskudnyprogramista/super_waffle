# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Geo, type: :model do
  it { should validate_presence_of(:lat) }
  it { should validate_presence_of(:lng) }

  it { should belong_to(:address) }
  it { should have_db_index(:address_id) }
end
