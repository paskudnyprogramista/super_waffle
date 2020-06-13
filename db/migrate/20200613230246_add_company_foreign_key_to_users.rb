# frozen_string_literal: true

class AddCompanyForeignKeyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :users, :companies
  end
end
