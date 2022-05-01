require_relative 'Player'

class Game
  attr_accessor :no_of_games, :name, :secret_word
  @@no_of_games = 0

  def initialize(player, secret_word)
    @player = player
    @secret_word = secret_word
    @game_number = @@no_of_games
    @@no_of_games += 1
  end