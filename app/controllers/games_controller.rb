class GamesController < ApplicationController
  def new
    @grid = []
    until @grid.length == 9
      @grid << ("A".."Z").to_a.sample(1)
    end
    @grid = @grid.flatten
  end

  def score
    raise
    url = "https://wagon-dictionary.herokuapp.com/#{params[:answer]}"
  end
end
