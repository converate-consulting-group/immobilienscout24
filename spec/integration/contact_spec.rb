require 'spec_helper'

describe Immobilienscout24::Api::Contact, vcr: true do
  default_config
  default_client

  describe "contacts" do
    it "should retrieve all contacts" do
      result = client.contacts(estate: 62412598)
      expect(result).to include "common.realtorContactDetailsList"
    end
  end

  describe "create contact" do
    let(:contact) { mashify_fixture('raw_contact.json') }

    it "should create the contact" do
      result = client.create_contact(contact, estate: 62412598)
      expect(result.inspect).to include "MESSAGE_RESOURCE_CREATED"
    end
  end

  describe "update contact" do
    let(:contact) { mashify_fixture('raw_contact.json') }

    it "should update the contact" do
      result = client.update_contact(59391826, contact, estate: 62412598)
      expect(result.inspect).to include "MESSAGE_RESOURCE_UPDATED"
    end
  end

end

