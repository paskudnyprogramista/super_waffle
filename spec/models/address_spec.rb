# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  it { is_expected.to validate_presence_of(:street) }
  it { is_expected.to validate_presence_of(:suite) }
  it { is_expected.to validate_presence_of(:city) }
  it { is_expected.to validate_presence_of(:zip) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_db_index(:user_id) }
  it { is_expected.to belong_to(:geo) }
  it { is_expected.to have_db_index(:geo_id) }
end
