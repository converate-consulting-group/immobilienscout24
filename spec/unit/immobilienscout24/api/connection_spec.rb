require 'spec_helper'

describe Immobilienscout24::Api::Connection do
  subject { Class.new.send(:include, described_class).new }


  describe "#connection" do
    let(:configuration) { double(:configuration) }
    let(:faraday_connection) { double(:faraday_connection) }
    let(:faraday_config) { Hash.new }

    it "should return a faraday connection" do
      expect(subject).to receive(:configuration).and_return(configuration)
      expect(configuration).to receive(:faraday_connection).and_return(faraday_config)
      expect(Faraday::Connection).to receive(:new).with(faraday_config).and_return(faraday_connection)

      expect(subject.connection).to eq faraday_connection
    end
  end

end
