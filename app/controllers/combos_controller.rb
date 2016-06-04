class CombosController < ApplicationController

  def index
    if params[:query]
      # zip these together in combo_wrapper later
      @candy = Candy.search(params[:query])
      @game = Game.search(params[:query])
      ## Finding a good API for the cartoon is hard... will work more on that after practicing with Bootstrap and testing
      # @cartoon = Cartoon.search(params[:query])
    end

    render :index
  end

end
