module Immobilienscout24
  module Api

    # Methods for the RealEstate API
    #
    # @see http://developerwiki.immobilienscout24.de/wiki/User/Realestate
    module RealEstate

      def real_estates(options = {})
        get real_estate_endpoint("/realestate", options)
      end

      def real_estate(id, options = {})
        get real_estate_endpoint("/realestate/#{id}", options)
      end

      def create_real_estate(estate, options = {})
        post real_estate_endpoint("/realestate", options), estate
      end

      def update_real_estate(id, estate, options = {})
        put real_estate_endpoint("/realestate/#{id}", options), estate
      end

      def delete_real_estate(id, options = {})
        delete real_estate_endpoint("/realestate/#{id}", options)
      end

      # -- endpoint

      def real_estate_endpoint(resource, options = {})
        options = {user: "me"}.merge(options)
        user_real_estate_endpoint(options.fetch(:user), resource, options)
      end

      def user_real_estate_endpoint(user, resource, options = {})
        [user_endpoint("/user/#{user}"), resource].join
      end

    end

  end
end
