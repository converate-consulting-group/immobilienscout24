require 'spec_helper'

describe Immobilienscout24::Api::Contact, vcr: true do
  default_config
  default_client

  describe "contacts" do
    it "should retrieve all contacts" do
      result = client.contacts
      expect(result).to include "common.realtorContactDetailsList"
    end
  end

  describe "contact" do
    it "should retrieve a signle contact" do
      result = client.contact(59391826)
      expect(result).to include "common.realtorContactDetail"
    end
  end

  describe "create contact" do
    let(:contact) { mashify_fixture('raw_contact.json') }

    it "should create the contact" do
      result = client.create_contact(contact)
      expect(result.inspect).to include "MESSAGE_RESOURCE_CREATED"
    end
  end

  describe "update contact" do
    let(:contact) { mashify_fixture('raw_contact.json') }

    it "should update the contact" do
      result = client.update_contact(59391826, contact)
      expect(result.inspect).to include "MESSAGE_RESOURCE_UPDATED"
    end
  end

end

