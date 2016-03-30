module Immobilienscout24
  module Api
    module Gis

      def continents(params = {})
        get continent_endpoint('/continent'), params
      end

      def continent(id, params = {})
        get continent_endpoint("/continent/#{id}/country"), params
      end

      def countries(continent_id, params = {})
        get continent_endpoint("/continent/#{continent_id}/country"), params
      end

      def country(continent_id, id, params = {})
        get continent_endpoint("/continent/#{continent_id}/country/#{id}"), params
      end

      def regions(continent_id, country_id, params = {})
        get continent_endpoint("/continent/#{continent_id}/country/#{country_id}/region"), params
      end

      def region(continent_id, country_id, id, params = {})
        get continent_endpoint("/continent/#{continent_id}/country/#{country_id}/region/#{id}"), params
      end

      def cities(continent_id, country_id, region_id, params = {})
        get continent_endpoint("/continent/#{continent_id}/country/#{country_id}/region/#{region_id}/city"), params
      end

      def city(continent_id, country_id, region_id, id, params = {})
        get continent_endpoint("/continent/#{continent_id}/country/#{country_id}/region/#{region_id}/city/#{id}"), params
      end

      def quarters(continent_id, country_id, region_id, city_id, params = {})
        get continent_endpoint("/continent/#{continent_id}/country/#{country_id}/region/#{region_id}/city/#{city_id}/quarter"), params
      end

      def quarter(continent_id, country_id, region_id, city_id, id, params = {})
        get continent_endpoint("/continent/#{continent_id}/country/#{country_id}/region/#{region_id}/city/#{city_id}/quarter/#{id}"), params
      end

      # -- endpoint

      def continent_endpoint(resource)
        ["api/gis/#{api_version}", resource].join
      end

    end
  end
end
