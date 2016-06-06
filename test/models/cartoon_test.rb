require 'test_helper'

class CartoonTest < ActiveSupport::TestCase
  describe "API" do
    before do
      # find a cartoon through Walmart API
      @data = HTTParty.get("http://api.walmartlabs.com/v1/search?apiKey=#{ENV['WALMART_KEY']}&query='patch'&categoryId=976759_1096070").parsed_response
    end

    it "should return a Hash", :vcr do
      assert @data.is_a? Hash
    end
  end

  describe "cartoon" do

    it "should be a cartoon", :vcr do
      cartoon = Cartoon.search('patch')
      assert_instance_of Cartoon, cartoon
    end

    it "should have a name", :vcr do
      cartoon = Cartoon.search('patch')
      assert cartoon.name
    end

    it "should have an image", :vcr do
      cartoon = Cartoon.search('patch')
      assert cartoon.image
    end

    it "should have the name 'No relevant cartoon found' if bad query is given", :vcr do
      cartoon = Cartoon.search('supercalifragilisticexpialodocious')
      assert_equal cartoon.name, "No relevant cartoon found"
    end

  end

end
