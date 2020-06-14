# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :body
      t.string :email
      t.references :post, index: true, foreign_key: true

      t.timestamps
    end
  end
end
