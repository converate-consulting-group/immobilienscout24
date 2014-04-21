require 'spec_helper'

describe Immobilienscout24::Api::Request::Json do
  include_examples :requests

  its(:content_type) { should eq "application/json" }
  its(:extension) { should eq :json }

  describe "#serialized_data" do
    let(:data) { double(:data) }
    let(:json) { double(:json) }
    it "should call to_json" do
      expect(data).to receive(:to_json).and_return(json)
      expect(subject.serialized_data(data)).to eq json
    end
  end
end
