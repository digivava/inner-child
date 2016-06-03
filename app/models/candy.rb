require 'httparty'

class Candy < ActiveRecord::Base

  BASE_URL = "http://api.walmartlabs.com/v1/"

  def self.search(query)
    candy = HTTParty.get(BASE_URL + "search?apiKey=#{ENV['WALMART_KEY']}&query=#{query}")
    binding.pry
  end

end
