class Game

  BASE_URL = "http://www.giantbomb.com/api/"
  attr_reader :id, :name, :rating, :image


  def initialize(data)
    @name = data["name"]
    @image = data["image"]["medium_url"]
  end

  def self.search(query)
    data = HTTParty.get(BASE_URL + "search/?api_key=#{ENV['GIANTBOMB_KEY']}&format=json&query=#{query}&resources=game").parsed_response

    if data["number_of_total_results"] == 0
      # to return SOMETHING nostalgic in case their query didn't match anything
      data["name"] = "Pokemon Crystal Version"
      data["image"] = "http://static.giantbomb.com/uploads/scale_medium/8/87790/2171280-box_pkmncv.png"
      self.new(data)
    else
      # a way to sort by original_game_rating until I can figure out how to make the
      # URL do sort or filter properly...
      data["results"].each do |game|
        # games without ratings aren't considered kid-friendly.
        # iterates until a rated-E game is found
        # captures only ESRB ratings, not those from other countries, cuz I don't know how those work
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
        # to return SOMETHING nostalgic in case an E-rated game wasn't found
        data["name"] = "Pokemon Crystal Version"
        data["image"] = "http://static.giantbomb.com/uploads/scale_medium/8/87790/2171280-box_pkmncv.png"
        data["original_game_rating"][0]["name"]
        self.new(data)
      end
    end

  end


end
