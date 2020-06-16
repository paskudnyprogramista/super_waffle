# frozen_string_literal: true

class ChangeColumnLatToDecimal < ActiveRecord::Migration[6.0]
  def change
    change_column :geos, :lat, :decimal, precision: 15, scale: 10
  end
end
