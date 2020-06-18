# frozen_string_literal: true

class AddOrigUserIdToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :orig_user_id, :integer
  end
end
