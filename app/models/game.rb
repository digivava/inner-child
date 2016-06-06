class Game

  BASE_URL = "http://www.giantbomb.com/api/"
  attr_reader :id, :name, :rating, :image


  def initialize(data)
    @name = data["name"]
    # captures only ESRB ratings
    @rating = data["original_game_rating"][0]["name"]
    @image = data["image"]["medium_url"]
  end

  def self.search(query)
    data = HTTParty.get(BASE_URL + "search/?api_key=#{ENV['GIANTBOMB_KEY']}&format=json&query=#{query}&resources=game").parsed_response


    # a way to sort by original_game_rating until I can figure out how to make the
    # URL do sort or filter properly...
    data["results"].each do |game|
      # games without ratings aren't considered kid-friendly.
      # iterates until a rated-E game is found
      if game["original_game_rating"] == nil || game["original_game_rating"][0]["name"] != "ESRB: E"
        next
      else
        data = game
        break data
      end
    end

    if data["original_game_rating"][0]["name"] == "ESRB: E"
      self.new(data)
    else
      raise "No child-friendly game found"
    end

  end


end
