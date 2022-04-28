def load_dictionary
  # Load in the text file
  dict_array = []
  dict_file =  File.open("google_english.txt", 'r')

  # Create an array of every word in the text file
  while !dict_file.eof?
    dict_array.push(dict_file.readline.strip)
  end
  # Filter out all of the words that aren't between 5 and 12 characters
  filtered_array = dict_array.select{|x| x.length > 4 && x.length < 13}
  # Return this filtered_array, we'll use this for the game
  filtered_array
end

def get_word(dictionary)
  # Select a random word from our dictionary
  game_word = dictionary[rand(dictionary.length + 1)]
  game_word
end

# get the player guess and check it is acceptable
def player_guess
  # get the guess as input from the user
  puts "Please enter your guess (a letter)"
  player_guess = gets.chomp
  if player_guess.length > 1
    puts "You can only guess one letter at a time"
    player_guess = player_guess()
  elsif !player_guess.match(/[a-zA-Z]/)
    puts "Your guess was not a letter from the English alphabet"
    player_guess = player_guess()
  end
  player_guess.downcase!
  player_guess
end

def get_letter_index(letter, word) # get all the indexes of the letter
  number_of_occurences = word.count(letter)
  index_array = []
  temp_word = String.new(word)
  while number_of_occurences > 0 # whilst there are still indexes to be found
    index_array.push(temp_word.index(letter))
    temp_word.sub!(letter, '0')
    number_of_occurences -= 1
  end
  index_array
end

def game_loop
  secret_word = get_word(load_dictionary())
  secret_word_arr = secret_word.split("")
  player_guess = Array.new(secret_word.length, '_')
  remaining_incorrect_guesses = 6
  incorrect_letters_guessed = []

  while player_guess != secret_word_arr && remaining_incorrect_guesses >= 0
    puts "_________________________________________"
    puts "The secret word is: #{secret_word}"
    puts "Your current guess is: #{player_guess}" ; puts "\n"
    # get the letter
    player_letter = player_guess()
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
  if player_guess == secret_word_arr
    puts "You guessed the word! You win!"
  else
    puts "You ran out of guesses! You Lose!"
  end
end

game_loop()