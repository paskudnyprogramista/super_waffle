# frozen_string_literal: true

class CreateGeos < ActiveRecord::Migration[6.0]
  def change
    create_table :geos do |t|
      t.integer :lat
      t.integer :lng
      t.references :address, index: true, foreign_key: true

      t.timestamps
    end
  end
end
