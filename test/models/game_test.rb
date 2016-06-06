require 'test_helper'

class GameTest < ActiveSupport::TestCase
  describe "game" do

    it "should be a game", :vcr do
      game = Game.search('patch')
      assert_instance_of Game, game
    end

    it "should have a name", :vcr do
      game = Game.search('patch')
      assert game.name
    end

    it "should have an image", :vcr do
      game = Game.search('patch')
      assert game.image
    end

    it "should return Pokemon Crystal Version if bad query is given", :vcr do
      game = Game.search('supercalifragilisticexpialodocious')
      assert_equal game.name, "Pokemon Crystal Version"
    end

  end
end
