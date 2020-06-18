# frozen_string_literal: true

class AddOrigUserIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :orig_user_id, :integer
  end
end
