# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :suite
      t.string :city
      t.string :zip
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
