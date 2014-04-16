require 'spec_helper'

describe Immobilienscout24::Api::Attachment, vcr: true do
  default_config
  default_client

  describe "attachments" do
    it "should retrieve all attachments" do
      result = client.attachments(estate: 62412598)
      expect(result).to include "common.attachments"
    end
  end

  describe "attachment" do
    it "should retrieve a single attachment" do
      result = client.attachment(663515214, estate: 62412598)
      expect(result).to include "common.attachment"
    end
  end

  describe "create attachment" do
    let(:attachment) { File.join(fixture_path, 'estate.jpg') }
    let(:meta) { mashify_fixture('raw_picture.json') }

    it "should create the attachment" do
      result = client.create_attachment(meta, attachment, estate: 62412598)
      expect(result.inspect).to include "MESSAGE_RESOURCE_CREATED"
    end
  end

  describe "update attachment" do
    let(:attachment) { mashify_fixture('raw_picture.json') }

    it "should create the attachment" do
      result = client.update_attachment(663515214, attachment, estate: 62412598)
      expect(result.inspect).to include "MESSAGE_RESOURCE_UPDATED"
    end
  end

  describe "delete attachment" do
    it "should delete an attachment" do
      result = client.delete_attachment(663517286, estate: 62412598)
      expect(result.inspect).to include "MESSAGE_RESOURCE_DELETED"
    end
  end

end
