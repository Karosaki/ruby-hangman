class Player
  attr_accessor :name, :player_number, :no_of_players
  @@no_of_players = 0

  def initialize(name)
    @name = name
    @player_number = @@no_of_players
    @@no_of_players += 1
  end

  def to_s
    "#{name} is player #{player_number}"
  end
end