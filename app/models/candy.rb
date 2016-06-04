require 'httparty'

class Candy

  BASE_URL = "http://api.walmartlabs.com/v1/"
  attr_reader :id, :name


  def initialize(data)
    @name = data["name"]
  end

  def self.search(query)
    data = HTTParty.get(BASE_URL + "search?apiKey=#{ENV['WALMART_KEY']}&query=#{query}").parsed_response
    self.new(data["items"][0])
  end

end
