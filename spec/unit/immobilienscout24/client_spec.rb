require 'spec_helper'

describe Immobilienscout24::Client do

  describe "#consumer" do

    context "with defaults" do
      let(:configuration) { double(:configuration) }
      let(:consumer_key) { double(:consumer_key) }
      let(:consumer_secret) { double(:consumer_secret) }

      it "should return the default consumer key/secret hash" do
        expect(subject).to receive(:configuration).twice.and_return(configuration)
        expect(configuration).to receive(:consumer_key).and_return(consumer_key)
        expect(configuration).to receive(:consumer_secret).and_return(consumer_secret)

        expect(subject.consumer).to eq Hash[consumer_key: consumer_key, consumer_secret: consumer_secret]
      end
    end

    context "with costomized consumer" do
      let(:consumer) { double(:consumer) }
      subject { described_class.new(consumer: consumer) }

      it "should return the specified consumer" do
        expect(subject.consumer).to eq consumer
      end
    end

  end

  describe "#oauth_credentials" do
    let(:token) { double(:token) }
    let(:token_secret) { double(:token_secret) }
    let(:consumer) { Hash[consumer_key: nil, consumer_secret: nil] }
    subject { described_class.new(token: token, token_secret: token_secret) }

    it "should return the oauth_credentials" do
      expect(subject).to receive(:consumer).and_return(consumer)
      expect(subject.oauth_credentials).to eq Hash[token: token, token_secret: token_secret].merge(consumer)
    end
  end

  describe "#configuration" do
    let(:configuration) { double(:configuration) }

    it "should return the immobilienscout24 configuration" do
      expect(Immobilienscout24).to receive(:configuration).and_return(configuration)
      expect(subject.configuration).to eq configuration
    end
  end

end
