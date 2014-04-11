require 'spec_helper'

describe Immobilienscout24::Api::User do
  subject { Class.new.send(:include, described_class).new }
  let(:endpoint) { double(:endpoint) }
  let(:response) { double(:response) }

  describe "#user" do
    let(:user_id) { 1 }

    it "should return a user response" do
      expect(subject).to receive(:user_endpoint).with("/user/#{user_id}").and_return(endpoint)
      expect(subject).to receive(:get).with(endpoint).and_return(response)

      expect(subject.user(user_id)).to eq response
    end
  end

  describe "#current_user" do

    it "should call the current user endpoint" do
      expect(subject).to receive(:user).with("me").and_return(response)
      expect(subject.current_user).to eq response
    end

  end

  describe "#user_endpoint" do
    let(:api_version) { "v1.0" }
    let(:resource) { "/user" }

    it "should return the user endpoint" do
      expect(subject).to receive(:api_version).and_return(api_version)
      expect(subject.user_endpoint(resource)).to eq "api/offer/#{api_version}#{resource}"
    end
  end

end
