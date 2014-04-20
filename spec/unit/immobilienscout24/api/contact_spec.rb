require 'spec_helper'

describe Immobilienscout24::Api::Contact do
  subject { Class.new.send(:include, described_class).new }
  let(:endpoint) { double(:endpoint) }
  let(:response) { double(:response) }

  describe "#contacts" do
    it "should return a response" do
      expect(subject).to receive(:contact_endpoint).with("/contact", {}).and_return(endpoint)
      expect(subject).to receive(:get).with(endpoint).and_return(response)

      expect(subject.contacts).to eq response
    end
  end

  describe "#contact" do
    let(:contact_id) { 1 }
    it "should return a response" do
      expect(subject).to receive(:contact_endpoint).with("/contact/#{contact_id}", {}).and_return(endpoint)
      expect(subject).to receive(:get).with(endpoint).and_return(response)

      expect(subject.contact(contact_id)).to eq response
    end
  end

  describe "#create_contact" do
    let(:contact) { double(:contact) }

    it "should return a response" do
      expect(subject).to receive(:contact_endpoint).with("/contact", {}).and_return(endpoint)
      expect(subject).to receive(:post).with(endpoint, contact).and_return(response)

      expect(subject.create_contact(contact)).to eq response
    end
  end

  describe "#update_contact" do
    let(:contact_id) { 1 }
    let(:contact) { double(:contact) }

    it "should return a response" do
      expect(subject).to receive(:contact_endpoint).with("/contact/#{contact_id}", {}).and_return(endpoint)
      expect(subject).to receive(:put).with(endpoint, contact).and_return(response)

      expect(subject.update_contact(contact_id, contact)).to eq response
    end
  end

  describe "#contact_endpoint" do
    let(:options) { {} }
    let(:resource) { double(:resource) }

    it "should return the endpoint" do
      expect(subject).to receive(:user_contact_endpoint).with("me", resource, {user: "me"}).and_return(endpoint)
      expect(subject.contact_endpoint(resource, options)).to eq endpoint
    end
  end

  describe "#user_contact_endpoint" do
    let(:user) { "me" }
    let(:resource) { "resource" }
    let(:user_endpoint) { "/user" }
    let(:endpoint) { [user_endpoint, resource].join }

    it "should return the endpoint" do
      expect(subject).to receive(:user_endpoint).with("/user/#{user}").and_return(user_endpoint)


      expect(subject.user_contact_endpoint(user, resource)).to eq endpoint
    end

  end

end
