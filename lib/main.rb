require_relative 'Player'
require_relative 'Game'
require_relative 'Gameplay'
require 'json'

include Gameplay

john = Player.new("John")
jane = Player.new("Jane")

puts john
puts jane

dictionary = load_dictionary()

# First instance of the game
my_game = Game.new(john, secret_word = get_word(dictionary))

puts "The player of this game: #{my_game.player.name}"
puts "The secret word of this game: #{my_game.secret_word}"

# Serialisation test

my_game_saved = my_game.to_json

puts my_game_saved

#my_game.game_loop()
