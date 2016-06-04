require 'httparty'

class Candy < ActiveRecord::Base

  BASE_URL = "http://api.walmartlabs.com/v1/"

  def initialize(data)
    @name = data["name"]
  end

  def self.search(query)
    data = HTTParty.get(BASE_URL + "search?apiKey=#{ENV['WALMART_KEY']}&query=#{query}").parsed_response
    binding.pry
    self.new(data)
  end

end
