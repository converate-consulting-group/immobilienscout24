require 'spec_helper'

describe Immobilienscout24::Api::RealEstate do
  subject { Class.new.send(:include, described_class).new }
  let(:endpoint) { double(:endpoint) }
  let(:response) { double(:response) }

  describe "#real_estates" do
    it "should return a response" do
      expect(subject).to receive(:real_estate_endpoint).with("/realestate", {}).and_return(endpoint)
      expect(subject).to receive(:get).with(endpoint).and_return(response)

      expect(subject.real_estates).to eq response
    end
  end

  describe "#real_estate" do
    let(:estate) { 1 }
    it "should return a response" do
      expect(subject).to receive(:real_estate_endpoint).with("/realestate/#{estate}", {}).and_return(endpoint)
      expect(subject).to receive(:get).with(endpoint).and_return(response)

      expect(subject.real_estate(estate)).to eq response
    end
  end

  describe "#create_real_estate" do
    let(:estate) { double(:estate) }

    it "should return a real estate response" do
      expect(subject).to receive(:real_estate_endpoint).with("/realestate", {}).and_return(endpoint)
      expect(subject).to receive(:post).with(endpoint, estate).and_return(response)

      expect(subject.create_real_estate(estate)).to eq response
    end
  end

  describe "#update_real_estate" do
    let(:estate) { double(:estate) }
    let(:estate_id) { 1 }

    it "should return a real estate response" do
      expect(subject).to receive(:real_estate_endpoint).
        with("/realestate/#{estate_id}", {}).and_return(endpoint)

      expect(subject).to receive(:put).with(endpoint, estate).and_return(response)

      expect(subject.update_real_estate(estate_id, estate)).to eq response
    end
  end

  describe "#delete_real_estate" do
    let(:estate_id) { 1 }

    it "should return a real estate response" do
      expect(subject).to receive(:real_estate_endpoint).with("/realestate/#{estate_id}", {}).and_return(endpoint)
      expect(subject).to receive(:delete).with(endpoint).and_return(response)

      expect(subject.delete_real_estate(estate_id)).to eq response
    end
  end

  describe "#real_estate_endpoint" do
    let(:user_endpoint) { "user_endpoint" }
    let(:user_resource) { "/user/me" }
    let(:resource) { "/realestate" }

    it "should return the real estate endpoint" do
      expect(subject).to receive(:user_endpoint).with(user_resource).and_return(user_endpoint)
      expect(subject.real_estate_endpoint(resource)).to eq "#{user_endpoint}#{resource}"
    end
  end

  describe "#user_real_estate_endpoint" do
    let(:user) { "me" }
    let(:resource) { "resource" }
    let(:user_endpoint) { "/user" }
    let(:endpoint) { [user_endpoint, resource].join }

    it "should return the endpoint" do
      expect(subject).to receive(:user_endpoint).with("/user/#{user}").and_return(user_endpoint)


      expect(subject.user_real_estate_endpoint(user, resource)).to eq endpoint
    end

  end
end
