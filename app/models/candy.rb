require 'httparty'

class Candy

  BASE_URL = "http://api.walmartlabs.com/v1/"
  attr_reader :id, :name


  def initialize(data)
    @name = data["name"]
  end

  def self.find_category(category_name)
    # returns the ID of the category with a name matching the query
    data = HTTParty.get(BASE_URL + "taxonomy?apiKey=#{ENV['WALMART_KEY']}").parsed_response
    # iterate through the array of categories until the name matches
    data["categories"].each do |category|
      if category["name"] == category_name
        return category["id"]
      else
        # in case the category_name actually matches a category WITHIN that category
        # THIS WILL POTENTIALLY TAKE FOREVERRRR but it works I think
        category["children"].each do |subcategory|
            return subcategory["id"] if subcategory["name"] == category_name
        end
      end
    end

    return nil #if there is no such category at all
  end

  def self.search(query)
    category_id = self.find_category("candy").to_i
    data = HTTParty.get(BASE_URL + "search?apiKey=#{ENV['WALMART_KEY']}&query=#{query}&categoryId=#{category_id}").parsed_response
    self.new(data["items"][0])
  end

end
