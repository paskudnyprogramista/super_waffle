# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should validate_presence_of(:street) }
  it { should validate_presence_of(:suite) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:zip) }

  it { should belong_to(:user) }
  it { should have_db_index(:user_id) }
end
