require 'test_helper'
# make sure test_helper has VCR

class CandyTest < ActiveSupport::TestCase
  # once I get internet access I need to set this up so it actually connects with VCR

  describe "API" do
    before do
      # find a candy through Walmart API
      @candy = HTTParty.get("http://api.walmartlabs.com/v1/search?apiKey=#{ENV['WALMART_KEY']}&query=#{query}&categoryId=976759_1096070").parsed_response
    end

    it "should return JSON", :vcr do
      assert @candy.is_a? JSON
    end

  end
end
