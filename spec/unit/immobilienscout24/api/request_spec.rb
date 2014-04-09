require 'spec_helper'

describe Immobilienscout24::Api::Request do
  subject { Class.new.send(:include, described_class).new }
  let(:response) { double(:response) }
  let(:path) { double(:path) }
  let(:request_data) { double(:request_data) }

  describe "#get" do
    it "should return a response" do
      expect(subject).to receive(:request).with(:get, path, request_data).and_return(response)
      expect(subject.get(path, request_data)).to eq response
    end
  end

  describe "#post" do
    it "should return a response" do
      expect(subject).to receive(:request).with(:post, path, request_data).and_return(response)
      expect(subject.post(path, request_data)).to eq response
    end
  end

  describe "#put" do
    it "should return a response" do
      expect(subject).to receive(:request).with(:put, path, request_data).and_return(response)
      expect(subject.put(path, request_data)).to eq response
    end
  end

  describe "#delete" do
    it "should return a response" do
      expect(subject).to receive(:request).with(:delete, path, request_data).and_return(response)
      expect(subject.delete(path, request_data)).to eq response
    end
  end

  describe "#request" do
    let(:connection) { double(:connection) }
    let(:response_body) { double(:response_body) }
    let(:method) { :get }

    it "should return the response body" do
      expect(subject).to receive(:connection).and_return(connection)
      expect(connection).to receive(:send).with(method).and_return(response)
      expect(response).to receive(:body).and_return(response_body)

      expect(subject.request(method, path, request_data)).to eq response_body
    end
  end

  describe "#with_request_options" do
    let(:request_option_defaults) { double(:request_option_defaults) }
    let(:options) { double(:options) }

    it "should yield the client" do
      expect(subject).to receive(:request_option_defaults).and_return(request_option_defaults)
      expect(request_option_defaults).to receive(:merge).with(options)

      expect { |b| subject.with_request_options(options, &b) }.to yield_with_args(subject)
    end
  end

  describe "#request_options" do
    it "should return an empty hash" do
      expect(subject.request_options).to eq Hash.new
    end
  end

  describe "#request_option_defaults" do
    it "should return the default hash" do
      expect(subject.request_option_defaults).to eq Hash[raw_response: false, raw_request: false]
    end
  end

end
