# frozen_string_literal: true

class AddCompanyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :company, index: true
  end
end
