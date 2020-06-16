# frozen_string_literal: true

class ChangeColumnLngToDecimal < ActiveRecord::Migration[6.0]
  def change
    change_column :geos, :lng, :decimal, precision: 15, scale: 10
  end
end
