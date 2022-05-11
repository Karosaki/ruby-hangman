require_relative 'Player'
require_relative 'Game'
require_relative 'Gameplay'

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

# Serialization to-do
# - create a way for player to save progress during a turn
# - so this needs to happen during the game_loop method
# - output that save to file stored inside a saves folder (thinking individual save files for each game instance)
# - will do it with yaml initially
# - at the start, a player should be able to retrieve their save and play on from there