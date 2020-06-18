# frozen_string_literal: true

class AddOrigUserIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :orig_user_id, :integer
  end
end
