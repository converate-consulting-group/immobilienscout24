require 'spec_helper'

describe Immobilienscout24::Api::User, vcr: true do
  default_config
  default_client

  describe "current user" do
    it "should return the current user" do
      expect(client.current_user).to include "offeruser.offerUser"
    end
  end

end
