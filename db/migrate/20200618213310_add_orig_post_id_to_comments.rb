# frozen_string_literal: true

class AddOrigPostIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :orig_post_id, :integer
  end
end
