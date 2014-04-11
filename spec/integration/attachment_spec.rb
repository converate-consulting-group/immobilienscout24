require 'spec_helper'

describe Immobilienscout24::Api::Attachment, vcr: true do
  default_config
  default_client

  describe "create attachment" do
    let!(:attachment) { File.join(fixture_path, 'estate.jpg') }
    let!(:meta) { mashify_fixture('raw_picture.json') }

    it "should create the attachment" do
      result = client.create_attachment(meta, attachment, estate: 62412598)
      expect(result.inspect).to include "MESSAGE_RESOURCE_CREATED"
    end
  end

end
