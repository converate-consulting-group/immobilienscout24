require 'spec_helper'

describe Immobilienscout24::Api::Publish, vcr: true do
  default_config
  default_client

  describe "create publications" do
    let(:publications) { mashify_fixture('raw_publications.json') }

    it "should create the publications" do
      result = client.create_publications(publications)
      expect(result.inspect).to include "MESSAGE_OPERATION_SUCCESSFUL"
    end
  end

  describe "create publication" do
    let(:publication) { mashify_fixture('raw_publication.json') }

    it "should create the publication" do
      result = client.create_publication(publication)
      expect(result.inspect).to include "MESSAGE_RESOURCE_CREATED"
    end
  end

  describe "delete publication" do
    it "should delete the selected publication" do
      result = client.delete_publication("62412598_10000")
      expect(result.inspect).to include "MESSAGE_RESOURCE_DELETED"
    end
  end

end
