class Game

  BASE_URL = "http://www.giantbomb.com/api/"
  attr_reader :id, :name, :rating, :image


  def initialize(data)
    @name = data["name"]
    @rating = data["original_game_rating"]
    @image = data["image"]["medium_url"]
  end

  def self.search(query)
    data = HTTParty.get(BASE_URL + "search/?api_key=#{ENV['GIANTBOMB_KEY']}&format=json&query=#{query}&resources=game").parsed_response
    self.new(data["results"].sample)
  end


end
