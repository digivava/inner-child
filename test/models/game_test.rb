require 'test_helper'

class GameTest < ActiveSupport::TestCase
  describe "game" do

    it "should be a game" do
      game = Game.search('patch')
      assert_instance_of Game, game
    end

    

  end
end
