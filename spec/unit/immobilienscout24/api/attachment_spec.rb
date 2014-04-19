require 'spec_helper'

describe Immobilienscout24::Api::Attachment do
  subject { Class.new.send(:include, described_class).new }
  let(:endpoint) { double(:endpoint) }
  let(:response) { double(:response) }

  describe "#attachments" do
    it "should return a response" do
      expect(subject).to receive(:attachment_endpoint).with("/attachment", {}).and_return(endpoint)
      expect(subject).to receive(:get).with(endpoint).and_return(response)

      expect(subject.attachments).to eq response
    end
  end

  describe "#attachment" do
    let(:attachment_id) { 1 }
    it "should return a response" do
      expect(subject).to receive(:attachment_endpoint).with("/attachment/#{attachment_id}", {}).and_return(endpoint)
      expect(subject).to receive(:get).with(endpoint).and_return(response)

      expect(subject.attachment(attachment_id)).to eq response
    end
  end

  describe "#create_attachment" do
    let(:metadata) { double(:metadata) }
    let(:attachment) { double(:attachment) }
    let(:helper) { double(:helper) }
    let(:fileio) { double(:fileio) }

    it "should return a response" do
      expect(Immobilienscout24::Helper::Attachment).to receive(:new).
        with(attachment).and_return(helper)
      expect(helper).to receive(:build).and_return(fileio)
      expect(subject).to receive(:with_request_options).with(multipart: true).
        and_return(response)

      multipart = {metadata: metadata, attachment: attachment}
      expect(subject.create_attachment(metadata, attachment)).to eq response
    end
  end

  describe "#update_attachment" do
    let(:attachment_id) { 1 }
    let(:attachment) { double(:attachment) }

    it "should return a response" do
      expect(subject).to receive(:attachment_endpoint).with("/attachment/#{attachment_id}", {}).and_return(endpoint)
      expect(subject).to receive(:put).with(endpoint, attachment).and_return(response)
      expect(subject.update_attachment(attachment_id, attachment)).to eq response
    end
  end

  describe "#delete_attachment" do
    let(:attachment_id) { 1 }

    it "should return a response" do
      expect(subject).to receive(:attachment_endpoint).with("/attachment/#{attachment_id}", {}).and_return(endpoint)
      expect(subject).to receive(:delete).with(endpoint).and_return(response)
      expect(subject.delete_attachment(attachment_id)).to eq response
    end
  end

  describe "#attachment_endpoint" do
    let(:options) { double(:options) }
    let(:estate) { double(:estate) }
    let(:resource) { double(:resource) }

    it "should return the endpoint" do
      expect(options).to receive(:fetch).with(:estate).and_return(estate)
      expect(subject).to receive(:estate_attachment_endpoint).with(estate, resource, options).and_return(endpoint)
      expect(subject.attachment_endpoint(resource, options)).to eq endpoint
    end
  end

  describe "#estate_attachment_endpoint" do
    let(:estate_endpoint) { "estate_endpoint" }
    let(:resource) { "/resource" }
    let(:endpoint) { [estate_endpoint, resource].join }
    let(:estate) { double(:estate) }

    it "should return the endpoint" do
      expect(subject).to receive(:real_estate_endpoint).
        with("/realestate/#{estate}", {}).and_return(estate_endpoint)

      expect(subject.estate_attachment_endpoint(estate, resource)).to eq endpoint
    end

  end

end
