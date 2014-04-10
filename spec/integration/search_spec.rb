require 'spec_helper'

describe Immobilienscout24::Api::Search, vcr: true do
  default_config
  default_client

  describe "region search" do
    let(:search_data) { Hash[realestatetype: 'apartmentrent', geocodes: '1276'] }

    it "should return a result list" do
      expect(client.region_search(search_data)).to include "resultlist.resultlist"
    end
  end
end
