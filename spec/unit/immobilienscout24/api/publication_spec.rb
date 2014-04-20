require 'spec_helper'

describe Immobilienscout24::Api::Publish do
  subject { Class.new.send(:include, described_class).new }
  let(:endpoint) { double(:endpoint) }
  let(:response) { double(:response) }

  describe "#publications" do
    let(:estate) { double(:estate) }
    it "should return a response" do
      expect(subject).to receive(:publish_endpoint).with("/publish").and_return(endpoint)
      expect(subject).to receive(:get).with(endpoint, {realestate: estate}).and_return(response)
      expect(subject.publications(estate)).to eq response
    end
  end

  describe "#publication" do
    let(:publication) { 1 }
    it "should return a response" do
      expect(subject).to receive(:publish_endpoint).with("/publish/#{publication}").and_return(endpoint)
      expect(subject).to receive(:get).with(endpoint).and_return(response)

      expect(subject.publication(publication)).to eq response
    end
  end

  describe "#create_publications" do
    let(:publications) { double(:publications) }

    it "should return a publications response" do
      expect(subject).to receive(:publish_endpoint).with("/publish/list").and_return(endpoint)
      expect(subject).to receive(:post).with(endpoint, publications).and_return(response)

      expect(subject.create_publications(publications)).to eq response
    end
  end

  describe "#create_publication" do
    let(:publication) { double(:publication) }

    it "should return a publication response" do
      expect(subject).to receive(:publish_endpoint).with("/publish").and_return(endpoint)
      expect(subject).to receive(:post).with(endpoint, publication).and_return(response)

      expect(subject.create_publication(publication)).to eq response
    end
  end

  describe "#delete_publication" do
    let(:publication_id) { 1 }

    it "should return a publication response" do
      expect(subject).to receive(:publish_endpoint).with("/publish/#{publication_id}").and_return(endpoint)
      expect(subject).to receive(:delete).with(endpoint).and_return(response)

      expect(subject.delete_publication(publication_id)).to eq response
    end
  end

  describe "#publish_endpoint" do
    let(:api_version) { "v1.0" }
    let(:resource) { "/publication" }

    it "should return the publication endpoint" do
      expect(subject).to receive(:api_version).and_return(api_version)
      expect(subject.publish_endpoint(resource)).to eq ["api/offer/#{api_version}", resource].join
    end
  end

end
