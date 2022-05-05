require_relative 'Player'
require_relative 'Gameplay'

class Game
  include Gameplay

  attr_accessor :no_of_games, :player, :secret_word
  @@no_of_games = 0

  def initialize(player, secret_word)
    @player = player
    @secret_word = secret_word
    @game_number = @@no_of_games
    @@no_of_games += 1
  end

  def game_loop
    #secret_word = get_word(load_dictionary()) #we have the secret word from our initialisation
    secret_word_arr = secret_word.split("")
    player_guess = Array.new(secret_word.length, '_')
    remaining_incorrect_guesses = 6
    incorrect_letters_guessed = []

    while player_guess != secret_word_arr && remaining_incorrect_guesses >= 0
      puts "_________________________________________"
      #puts "The secret word is: #{secret_word}"
      puts "Your current guess is: #{player_guess}" ; puts "\n"
      # get the letter
      player_letter = player_guess() #From the Gameplay module
      while incorrect_letters_guessed.include?(player_letter)
        puts "You've already chosen this incorrect letter, try again"
        player_letter = player_guess()
      end
      # check if the letter is in the word
      if secret_word.include? player_letter # letter is in the word
        puts "You guessed #{player_letter}, that is in the word!" ; puts "\n"
        # find the indexes
        letter_indexes = get_letter_index(player_letter, secret_word)
        # put the letters in their correct places
        while letter_indexes.length > 0
          player_guess[letter_indexes[-1]] = player_letter
          letter_indexes.pop()
        end
      else # letter isn't in the word
        puts "You guessed #{player_letter}, that isn't in the word!" ; puts "\n"
        incorrect_letters_guessed.push(player_letter)
        print "These are the incorrect letter's you've chosen so far #{incorrect_letters_guessed}" ; puts "\n"
        remaining_incorrect_guesses -= 1
        puts "You have #{remaining_incorrect_guesses + 1} incorrect guesses left" ; puts "\n"
      end
    end

    puts "Your final answer was: #{player_guess}"
    puts "The correct answer was: #{secret_word}"
    if player_guess == secret_word_arr
      puts "You guessed the word! You win!"
    else
      puts "You ran out of guesses! You Lose!"
    end
  end
end
