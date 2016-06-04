class Cartoon

  BASE_URL = "http://api.walmartlabs.com/v1/"
  attr_reader :id, :name, :image
  
  def initialize(data)
    @name = data["name"]
    @image = data["thumbnailImage"]
  end

  def self.find_category(category_name)
    data = HTTParty.get(BASE_URL + "taxonomy?apiKey=#{ENV['WALMART_KEY']}").parsed_response

    # iterate through the array of categories until the name matches
    data["categories"].each do |category|
      if category["name"] == category_name
        return category["id"]
      # children in this case refers to subcategories, not to human children
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
    # this is identical to much of the self.search query in candy, maybe should refactor somehow? I still want the distinct classes though..
    category_id = self.find_category("Cartoons")
    data = HTTParty.get(BASE_URL + "search?apiKey=#{ENV['WALMART_KEY']}&query=#{query}&categoryId=#{category_id}").parsed_response

    # if there are indeed items for that category
    if data["items"]
      self.new(data["items"][0])
    else
      # should instead use default values to instantiate a dummy no-candy-found candy
      raise "NOPE, no relevant cartoon found"
    end
  end



  ## THIS API IS STUPID
  # BASE_URL = "http://cartoonnetwork-go-api-dev.56m.dmtio.net/"
  # attr_reader :id, :name, :image
  #
  # def initialize(data)
  #   @name = data["title"]
  #   @image = data["showLogoPNG"]
  # end
  #
  #
  # def self.search(query)
  #  list_of_shows = HTTParty.get(BASE_URL + "shows/").parsed_response
  #
  #  # create a new show from each
  #  list_of_shows.each do |toon|
  #    if toon["title"] == query
  #     #  self.new(toon)
  #      break toon
  #    end
  #  end
  #
  #  self.new(toon)
  # end
end
