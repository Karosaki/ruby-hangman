module Gameplay

  def load_dictionary #Load the 'google.txt' file into an array
    dict_array = []
    dict_file =  File.open("google_english.txt", 'r')
  
    while !dict_file.eof? # Create an array of every word in the text file
      dict_array.push(dict_file.readline.strip)
    end

    filtered_array = dict_array.select{|x| x.length > 9 && x.length < 13} # get words that are 5 - 12 characters
    filtered_array # Return this filtered_array, we'll use this for the game
  end

  def get_word(dictionary) # Select a random word from the dictionary
    game_word = dictionary[rand(dictionary.length + 1)]
    game_word
  end

  def player_guess # get the player guess and check it is acceptable
    puts "Please enter your guess (a letter)"
    player_guess = gets.chomp # get the guess as input from the user

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
end