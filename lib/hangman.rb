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

# dictionary array
dictionary = load_dictionary()
game_word = get_word(dictionary)
puts game_word