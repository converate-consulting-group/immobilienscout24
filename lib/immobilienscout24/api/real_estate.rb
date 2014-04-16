module Immobilienscout24
  module Api

    # Methods for the RealEstate API
    #
    # Per default the client will use the current user (`me`).
    # If you want to use an other user then you have to provide
    # the id in the options hash.
    #
    # @example
    #   client.real_estate(663515214, user: immoscout_user_id)
    #
    # @see http://developerwiki.immobilienscout24.de/wiki/User/Realestate
    module RealEstate

      # Get a list of all real estates
      #
      # @param options [Hash] Additional options
      # @return [Hashie::Mash] Immobilienscout24 response
      # @see http://developerwiki.immobilienscout24.de/wiki/User/Realestate/GETALL
      # @example
      #   client.real_estates
      def real_estates(options = {})
        get real_estate_endpoint("/realestate", options)
      end

      # Get a single real estate
      #
      # @param id [String, Integer] Real estate id
      # @param options [Hash] Additional options
      # @return [Hashie::Mash] Immobilienscout24 response
      # @see http://developerwiki.immobilienscout24.de/wiki/User/Realestate/GETbyID
      # @example
      #   client.real_estate(real_estate_id)
      def real_estate(id, options = {})
        get real_estate_endpoint("/realestate/#{id}", options)
      end

      # Create a real estate
      #
      # @param estate [Hash] Estate data
      # @param options [Hash] Additional options
      # @return [Hashie::Mash] Immobilienscout24 response
      # @see http://developerwiki.immobilienscout24.de/wiki/User/Realestate/POST
      # @example
      #   client.create_real_estate(estate)
      def create_real_estate(estate, options = {})
        post real_estate_endpoint("/realestate", options), estate
      end

      # Update a real estate
      #
      # @param id [String, Integer] Real estate id
      # @param estate [Hash] Estate data
      # @param options [Hash] Additional options
      # @return [Hashie::Mash] Immobilienscout24 response
      # @see http://developerwiki.immobilienscout24.de/wiki/User/Realestate/PUTbyID
      # @example
      #   client.update_real_estate(estate_id, data)
      def update_real_estate(id, estate, options = {})
        put real_estate_endpoint("/realestate/#{id}", options), estate
      end

      # Delete a real estate
      #
      # @param id [String, Integer] Real estate id
      # @param options [Hash] Additional options
      # @return [Hashie::Mash] Immobilienscout24 response
      # @see http://developerwiki.immobilienscout24.de/wiki/User/Realestate/DELETEbyID
      # @example
      #   client.delete_real_estate(estate_id, data)
      def delete_real_estate(id, options = {})
        delete real_estate_endpoint("/realestate/#{id}", options)
      end

      # -- endpoint

      # Generates the real estate endpoint
      #
      # @param resource [String, Integer] In most cases the id of the real estate
      # @param options [Hash] Additional options
      # @return [String] The url to the real estate resource
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
