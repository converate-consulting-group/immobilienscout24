module Immobilienscout24
  module Api
    module Search

      def region_search(params = {})
        get search_api('/region'), params
      end

      def search_api(resource)
        "api/search/v1.0/search#{resource}"
      end

    end
  end
end
