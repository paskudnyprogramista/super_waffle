# frozen_string_literal: true

class AddGeoToAddress < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :geo, index: true, foreign_key: true
  end
end
