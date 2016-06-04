class CombosController < ApplicationController

  def index
    if params[:query]
      @candy = Candy.search(params[:query])
    end

    # what to put in candy spot if there is no params
    render :index
  end

end
