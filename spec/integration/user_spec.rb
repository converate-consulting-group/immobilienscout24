require 'spec_helper'

describe "User requests", vcr: true do
  default_config
  default_client

  describe "current user" do
    it "should return the current user" do
      expect(client.current_user).to respond_to :offerUser
    end
  end

end
