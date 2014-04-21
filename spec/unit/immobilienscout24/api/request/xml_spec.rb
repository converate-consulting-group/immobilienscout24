require 'spec_helper'

describe Immobilienscout24::Api::Request::Xml do
  include_examples :requests

  its(:content_type) { should eq "application/xml" }
  its(:extension) { should eq :xml }

  describe "#serialized_data" do
    let(:data) { double(:data) }
    let(:xml) { double(:xml) }
    it "should call to_json" do
      expect(data).to receive(:to_xml).and_return(xml)
      expect(subject.serialized_data(data)).to eq xml
    end
  end
end
