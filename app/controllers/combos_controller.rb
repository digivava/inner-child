class CombosController < ApplicationController

  def index
    if params[:query]
      # zip these together in combo_wrapper later
      @candy = Candy.search(params[:query])
      @game = Game.search(params[:query])
    end

    # what to put in candy spot if there is no params
    render :index
  end

end
