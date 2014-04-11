module Immobilienscout24
  module Api

    # Methods for the Publish API
    #
    # @see http://developerwiki.immobilienscout24.de/wiki/Publish
    # @see http://developerwiki.immobilienscout24.de/wiki/PublishChannel/GET
    module Publish

      def create_publications(publications)
        post publish_endpoint("/publish/list"), publications
      end

      def create_publication(publication)
        post publish_endpoint("/publish"), publication
      end

      def delete_publication(id)
        delete publish_endpoint("/publish/#{id}")
      end

      # -- endpoint

      def publish_endpoint(resource)
        ["api/offer/#{api_version}", resource].join
      end

    end
  end
end
