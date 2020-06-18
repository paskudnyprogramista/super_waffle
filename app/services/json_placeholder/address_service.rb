# frozen_string_literal: true

require 'dry/monads/result'

module JsonPlaceholder
  class AddressService
    class << self
      include Dry::Monads[:result]

      # TODO: Refactor:
      # - We need to bind address by orig_address_id which is taken from external data
      # - Move to base class
      def populate(address_data)
        mapped_address_model = map_address_data(address_data)
        address = find_address(mapped_address_model.id)

        if address
          address.update!(build_attributes_for_update(mapped_address_model))
        else
          mapped_address_model.save!
        end

        Success(:ok)
      end

      private

      def build_attributes_for_update(mapped_address_model)
        address_attributes = mapped_address_model.attributes
        geo_attributes = mapped_address_model.geo.attributes

        address_attributes.merge(geo_attributes: geo_attributes).compact!
      end

      def map_address_data(data)
        JsonPlaceholder::AddressDataMapper.new.call(data)
      end

      def find_address(id)
        Address.find_by(id: id)
      end
    end
  end
end
