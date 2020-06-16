# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:email) }

  it { is_expected.to belong_to(:post) }
  it { is_expected.to have_db_index(:post_id) }
end
