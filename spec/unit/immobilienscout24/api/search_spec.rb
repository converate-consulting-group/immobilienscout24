require 'spec_helper'

describe Immobilienscout24::Api::Search do
  subject { Class.new.send(:include, described_class).new }
  let(:endpoint) { double(:endpoint) }
  let(:response) { double(:response) }

  describe "#region_search" do
    let(:params) { double(:params) }

    it "should return a region search response" do
      expect(subject).to receive(:search_endpoint).with("/region").and_return(endpoint)
      expect(subject).to receive(:get).with(endpoint, params).and_return(response)

      expect(subject.region_search(params)).to eq response
    end
  end

  describe "#search_endpoint" do
    let(:configuration) { double(:configuration) }
    let(:api_version) { "v1.0" }
    let(:resource) { "/region" }

    it "should return the search endpoint" do
      expect(subject).to receive(:configuration).and_return(configuration)
      expect(configuration).to receive(:api_version).and_return(api_version)

      expect(subject.search_endpoint(resource)).to eq "api/search/#{api_version}/search#{resource}"
    end
  end

end
