# frozen_string_literal: true

require 'dry/monads/all'

module JsonPlaceholder
  class UserService
    class << self
      include Dry::Monads[:result]

      def populate(user_data)
        mapped_user_model = JsonPlaceholder::UserDataMapper.new.call(user_data)
        user = find_user(mapped_user_model.email)

        if user
          user.update!(build_attributes_for_update(mapped_user_model))
        else
          mapped_user_model.save!
        end

        Success(:ok)
      end

      private

      def build_attributes_for_update(mapped_user_model)
        user_attributes = mapped_user_model.attributes
        company_attributes = mapped_user_model.company.attributes

        user_attributes.merge(company_attributes: company_attributes).compact!
      end

      def find_user(email)
        User.find_by(email: email)
      end
    end
  end
end
