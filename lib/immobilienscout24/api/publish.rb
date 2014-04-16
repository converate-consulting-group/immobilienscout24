module Immobilienscout24
  module Api

    # Methods for the Publish API
    #
    # @see http://developerwiki.immobilienscout24.de/wiki/Publish
    # @see http://developerwiki.immobilienscout24.de/wiki/PublishChannel/GET
    module Publish

      # Get a list of all publications
      #
      # @param estate [Hash] Estate id
      # @param params [Hash] Additional request parameters
      # @return [Hashie::Mash] Immobilienscout24 response
      # @see http://developerwiki.immobilienscout24.de/wiki/Publish/GET
      # @example
      #   client.publications(estate_id)
      def publications(estate, params = {})
        params = {realestate: estate}.merge(params)
        get publish_endpoint("/publish"), params
      end

      # Get a single publication
      #
      # @param id [String] Publication id
      # @return [Hashie::Mash] Immobilienscout24 response
      # @see http://developerwiki.immobilienscout24.de/wiki/Publish/GETbyID
      # @example
      #   client.publication(publication_id)
      def publication(id)
        get publish_endpoint("/publish/#{id}")
      end

      # Create multiple publications
      #
      # @param publications [Hash] Publication data
      # @return [Hashie::Mash] Immobilienscout24 response
      # @see http://developerwiki.immobilienscout24.de/wiki/Publish/POST
      # @example
      #   client.create_publications(publications)
      def create_publications(publications)
        post publish_endpoint("/publish/list"), publications
      end

      # Create a single publication
      #
      # @param publication [Hash] Publication data
      # @return [Hashie::Mash] Immobilienscout24 response
      # @see http://developerwiki.immobilienscout24.de/wiki/Publish/POSTbyID
      # @example
      #   client.create_publication(publication)
      def create_publication(publication)
        post publish_endpoint("/publish"), publication
      end

      # Delete a publication
      #
      # @param id [String] Publication id
      # @return [Hashie::Mash] Immobilienscout24 response
      # @see http://developerwiki.immobilienscout24.de/wiki/Publish/DELETEbyID
      # @example
      #   client.delete_publication(publication_id)
      def delete_publication(id)
        delete publish_endpoint("/publish/#{id}")
      end

      # -- endpoint

      # Generates the publish endpoint
      #
      # @param resource [String, Integer] In most cases the id of the publication
      # @return [String] The url to the publish resource
      def publish_endpoint(resource)
        ["api/offer/#{api_version}", resource].join
      end

    end
  end
end
