# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:website) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:email) }

  it { should validate_uniqueness_of(:email) }

  it { should belong_to(:company) }
  it { should have_db_index(:company_id) }
end