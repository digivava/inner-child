require 'test_helper'
# make sure test_helper has VCR

class CandyTest < ActiveSupport::TestCase
  # once I get internet access I need to set this up so it actually connects with VCR

  describe "API" do
    before do
      # find a candy through Walmart API
    end

    it "should return JSON", :vcr do
      # ____.is_a? JSON
    end

  end
end
