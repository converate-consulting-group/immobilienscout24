module Immobilienscout24
  module Api
    module Search

      def region_search(params = {})
        get search_endpoint('/region'), params
      end

      # -- endpoint

      def search_endpoint(resource)
        ["api/search/#{api_version}/search", resource].join
      end

    end
  end
end
