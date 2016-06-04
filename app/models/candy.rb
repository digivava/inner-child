require 'httparty'

class Candy

  BASE_URL = "http://api.walmartlabs.com/v1/"
  attr_reader :id, :name


  def initialize(data)
    @name = data["name"]
  end

  # returns the ID of the category with a name matching the query
  # this method is not working perfectly... time to move on for a bit though. MVP!!
  def self.find_category(category_name)
    data = HTTParty.get(BASE_URL + "taxonomy?apiKey=#{ENV['WALMART_KEY']}").parsed_response

    # iterate through the array of categories until the name matches
    data["categories"].each do |category|
      if category["name"] == category_name
        return category["id"]
      elsif category.keys.include? "children"
        # in case the category_name actually matches a category WITHIN that category
        # On^2 OH NO but it works I think
        category["children"].each do |subcategory|
          return subcategory["id"] if subcategory["name"] == category_name
        end
      end
    end

    return nil #if there is no such category at all
  end

  def self.search(query)
    category_id = self.find_category("Candy & Gum")
    data = HTTParty.get(BASE_URL + "search?apiKey=#{ENV['WALMART_KEY']}&query=#{query}&categoryId=#{category_id}").parsed_response

    # if there are indeed items for that category
    if data["items"]
      self.new(data["items"][0])
    else
      raise "NOPE, no relevant candy found"
    end
  end

end
