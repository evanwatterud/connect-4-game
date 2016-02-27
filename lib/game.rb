require_relative "board"
require_relative "player"

class Game
  def initialize
    @player_1 = Player.new("X")
    @player_2 = Player.new("O")
    @board = Board.new
  end

  def set_names
    print "Please input the name of player 1: "
    @player_1.name = gets.chomp
    puts "Your pieces will be represented by #{@player_1.pieces}'s, #{@player_1.name}.\n \n"
    print "Please input the name of player 2: "
    @player_2.name = gets.chomp
    puts "Your pieces will be represented by #{@player_2.pieces}'s, #{@player_2.name}.\n \n"
  end

  def update_board
    @board.update_board
  end
end
