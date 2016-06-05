class CombosController < ApplicationController

  def index
    if params[:query]
      # zip these together in combo_wrapper later
      @candy = Candy.search(params[:query])
      @game = Game.search(params[:query])

      # okay, now I'm really confused... why does the Candy search fail if the
      # following line is uncommented... is it because they both call the same
      # API? what's wrong with that?
      @cartoon = Cartoon.search(params[:query])
    end

    render :index
  end

end
