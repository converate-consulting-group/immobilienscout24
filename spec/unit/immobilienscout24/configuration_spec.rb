require 'spec_helper'

describe Immobilienscout24::Configuration do
  subject { described_class.new }

  it { should respond_to(:consumer_key) }
  it { should respond_to(:consumer_secret) }
  it { should respond_to(:content_type) }
  it { should respond_to(:faraday_connection) }
  it { should respond_to(:faraday_adapter) }
  it { should respond_to(:faraday_logger) }
  it { should respond_to(:sandbox) }
  it { should respond_to(:live_url) }
  it { should respond_to(:sandbox_url) }
  it { should respond_to(:api_version) }

  context "default for" do
    let(:live_url) { 'https://rest.immobilienscout24.de/restapi' }
    let(:sandbox_url) { 'http://rest.sandbox-immobilienscout24.de/restapi' }

    its(:faraday_connection) { should eq Hash[url: live_url] }
    its(:faraday_adapter) { should eq :net_http }
    its(:faraday_logger) { should eq [:logger] }
    its(:request_strategy) { should eq Immobilienscout24::Api::Request::Json }
    its(:live_url) { should eq live_url }
    its(:sandbox_url) { should eq sandbox_url }
    its(:api_version) { should eq "v1.0" }
    its(:api_url) { should eq live_url }

    context "sandbox mode" do
      it "should return the sandbox url for the faraday_connection" do
        expect(subject).to receive(:api_url).and_return(sandbox_url)
        expect(subject.faraday_connection).to eq Hash[url: sandbox_url]
      end

      it "should return the sandbox url for the api_url" do
        expect(subject).to receive(:sandbox).and_return(true)
        expect(subject.api_url).to eq sandbox_url
      end
    end
  end

end
