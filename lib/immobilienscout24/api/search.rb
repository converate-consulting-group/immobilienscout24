module Immobilienscout24
  module Api
    module Search

      def region_search(params = {})
        get search_endpoint('/region'), params
      end

      def search_endpoint(resource)
        "api/search/#{configuration.api_version}/search#{resource}"
      end

    end
  end
end
