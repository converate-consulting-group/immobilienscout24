module Immobilienscout24
  module Api
    module Expose

      # Get a single real estate
      #
      # @param id [String, Integer] expose id
      # @param options [Hash] Additional options
      # @return [Hashie::Mash] Immobilienscout24 response
      # @see http://api.immobilienscout24.de/our-apis/expose.html
      # @example
      #   client.get(real_estate_id)
      def expose(id, options = {})
        get expose_endpoint("/#{id}")
      end


      # -- endpoint
      def expose_endpoint(resource)
        ["api/search/#{api_version}/expose", resource].join
      end

    end
  end
end
