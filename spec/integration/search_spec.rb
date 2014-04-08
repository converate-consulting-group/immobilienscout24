require 'spec_helper'

describe "Search requests", vcr: true do
  default_config
  default_client

  describe "region search" do
    let(:search_data) { Hash[realestatetype: 'apartmentrent', geocodes: '1276'] }

    it "should return a result list" do
      expect(client.region_search(search_data)).to respond_to :resultlist
    end

  end
end
