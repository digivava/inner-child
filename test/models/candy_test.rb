require 'test_helper'

class CandyTest < ActiveSupport::TestCase

  describe "API" do
    before do
      # find a candy through Walmart API
      @data = HTTParty.get("http://api.walmartlabs.com/v1/search?apiKey=#{ENV['WALMART_KEY']}&query='patch'&categoryId=976759_1096070").parsed_response
    end

    it "should return a Hash", :vcr do
      assert @data.is_a? Hash
    end

    it "should return the id of the candy & gum category", :vcr do
      assert Candy.find_category("Candy & Gum") == "976759_1096070"
    end
  end

  describe "candy" do

    it "should be a candy", :vcr do
      candy = Candy.search('patch')
      assert_instance_of Candy, candy
    end

    it "should have a name", :vcr do
      candy = Candy.search('patch')
      assert candy.name
    end

    it "should have an image", :vcr do
      candy = Candy.search('patch')
      assert candy.image
    end

    it "should have the name 'No relevant candy found' if bad query is given", :vcr do
      candy = Candy.search('supercalifragilisticexpialodocious')
      assert_equal candy.name, "No relevant candy found"
    end

  end

  # describe "candy on bad query" do
  #
  # end


end
