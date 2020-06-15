# frozen_string_literal: true

class RemoveAddressFromGeo < ActiveRecord::Migration[6.0]
  def change
    remove_reference :geos, :address, index: true, foreign_key: true
  end
end
