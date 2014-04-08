require 'spec_helper'

describe Immobilienscout24 do

  describe ".configure" do
    let(:configuration) { double(:configuration) }

    it "should yield the configuration" do
      expect(described_class).to receive(:configuration).and_return(configuration)
      expect { |block| described_class.configure(&block) }.to yield_with_args(configuration)
    end
  end

end
