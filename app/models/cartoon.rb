class Cartoon

  BASE_URL = "http://cartoonnetwork-go-api-dev.56m.dmtio.net/"
  attr_reader :id, :name, :image

  def initialize(data)
    @name = data["title"]
    @image = data["showLogoPNG"]
  end


  def self.search(query)
   list_of_shows = HTTParty.get(BASE_URL + "shows/").parsed_response

   # create a new show from each
   list_of_shows.each do |toon|
     if toon["title"] == query
      #  self.new(toon)
       break toon
     end
   end

   self.new(toon)
  end
end
