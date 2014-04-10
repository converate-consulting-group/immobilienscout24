module Immobilienscout24
  module Api
    module RealEstate

      def create_real_estate(estate, options = {})
        post real_estate_endpoint("/realestate", options), estate
      end

      def update_real_estate(id, estate, options = {})
        options = {external: false}.merge(options)
        id = "ext-#{id}" if options[:external]

        put real_estate_endpoint("/realestate/#{id}", options), estate
      end

      def delete_real_estate(id, options = {})
        delete real_estate_endpoint("/realestate/#{id}", options)
      end

      def real_estate_endpoint(resource, options = {})
        options = {user: "/user/me"}.merge(options)
        "#{user_endpoint(options[:user])}#{resource}"
      end

    end
  end
end
