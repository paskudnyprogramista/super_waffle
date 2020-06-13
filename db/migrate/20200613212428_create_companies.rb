# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :catchphrase
      t.string :bs

      t.timestamps
    end
  end
end
