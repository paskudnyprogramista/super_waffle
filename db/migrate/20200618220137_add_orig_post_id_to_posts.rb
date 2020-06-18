# frozen_string_literal: true

class AddOrigPostIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :orig_post_id, :integer
  end
end
