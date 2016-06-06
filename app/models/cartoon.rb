class Cartoon

  BASE_URL = "http://api.walmartlabs.com/v1/"
  attr_reader :id, :name, :image

  def initialize(data)
    @name = data["name"]
    @image = data["thumbnailImage"]
  end

  ## arghhhh I played around with this forever but I still don't get why my fancy recursion doesn't work
  def self.find_category(category_name)
    # get list of categories
    data = HTTParty.get(BASE_URL + "taxonomy?apiKey=#{ENV['WALMART_KEY']}").parsed_response

    # iterate through categories
    data["categories"].each do |category|
      # recursive method to deal with subcategories
      id = self.search_through_categories(category, category_name)
      if id != nil
        return id
      end
    end

    # temporary; make this more user-friendly later
    raise "The category you requested does not exist"
  end

  def self.search_through_categories(category, category_name)
    # base case
    if category["name"] == category_name
      return category["id"]
    end

    if category.keys.include? "children" # if has subcategories
      category["children"].each do |subcategory|
        self.search_through_categories(subcategory, category_name)
      end
    end

    # this is what happens if no match is found in the category at all, so that self.find_category can move on to the next category
    return nil
  end


  def self.search(query)
    # this is identical to much of the self.search query in candy, maybe should refactor somehow? I still want the distinct classes though..
    # category_id = self.find_category("Anime & Animation")
    # magic number only because I can't figure out why my category-related methods above don't work
    data = HTTParty.get(BASE_URL + "search?apiKey=#{ENV['WALMART_KEY']}&query=#{query}&categoryId=4096_616859_617000").parsed_response

    # if there are indeed items for that category
    if data["items"]
      self.new(data["items"][0])
    else
      data["items"] = [{"name" => "No relevant cartoon found"}]
      self.new(data["items"][0])
    end
  end


end
