require 'spec_helper'

describe Immobilienscout24::Api::RealEstate, vcr: true do
  default_config
  default_client

  describe "create real estate" do
    let(:estate) { mashify_fixture('raw_estate1.json') }

    before do
      estate["realestates.apartmentBuy"].externalId = generate_estate_id
    end

    context "when using an object that responds to to_json" do
      it "should create the estate" do
        result = client.create_real_estate(estate)
        expect(result.inspect).to include "MESSAGE_RESOURCE_CREATED"
      end
    end

    context "when using raw json" do
      let(:estate_json) { estate.to_json }

      it "should create the estate" do
        result = client.with_request_options(raw_request: true) do |c|
          c.create_real_estate(estate_json)
        end

        expect(result.inspect).to include "MESSAGE_RESOURCE_CREATED"
      end
    end
  end

  describe "update real estate" do
    let(:estate) { mashify_fixture('raw_estate1.json') }

    it "should update the real estate" do
      estate["realestates.apartmentBuy"].externalId = "1397131710/238397"
      estate["realestates.apartmentBuy"].title = "RSPEC REST-API UPDATE!"

      client.update_real_estate(62412598, estate)
    end
  end

  describe "delete real estate" do
    it "should delete the real estate" do
      result = client.delete_real_estate(62411272)
      expect(result.inspect).to include "MESSAGE_RESOURCE_DELETED"
    end
  end

end
