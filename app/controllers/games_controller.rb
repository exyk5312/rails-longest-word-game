require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @grid = []
    until @grid.length == 9
      @grid << ("A".."Z").to_a.sample(1)
    end
    @grid = @grid.flatten
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:answer]}"
    word = open(url).read
    word_json = JSON.parse(word)
    @score = 0
    if word_json['found'] == true
      if params[:answer].chars.all? { |letter| params[:grid].count(letter) <= params[:answer].count(letter) } 
        @score += 1
      end
    else
      @invalid = "Sorry #{params[:answer]} is not a valid english word"
    end
  end

end
