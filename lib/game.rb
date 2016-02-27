require_relative "board"
require_relative "player"
require "colorize"

class Game
  def initialize
    @player_1 = Player.new("X".red)
    @player_2 = Player.new("O".green)
    @board = Board.new
  end

  def set_names
    print "Please input the name of player 1: "
    @player_1.name = gets.chomp
    puts "Your pieces will be represented by #{@player_1.pieces}'s, #{@player_1.name}.\n \n"
    while true
      print "Please input the name of player 2: "
      name = gets.chomp
      break unless name == @player_1.name
      puts "Name already taken! Try again."
    end
    @player_2.name = name
    puts "Your pieces will be represented by #{@player_2.pieces}'s, #{@player_2.name}.\n \n"
  end

  def print_board
    @board.print_board
  end

  def check_winner_player_1
    @board.check_winner(@player_1.pieces)
  end

  def check_winner_player_2
    @board.check_winner(@player_2.pieces)
  end

  def player_1_turn
    while true
      prompt_player_1_choice
      break unless @board.column_full?(@player_1.choice)
      puts "That column is full, pick another one."
    end
    @board.update_board(@player_1.choice, @player_1.pieces)
    puts print_board
    abort("#{@player_1.name} is the winner!") if check_winner_player_1
  end

  def player_2_turn
    while true
      prompt_player_2_choice
      break unless @board.column_full?(@player_2.choice)
      puts "That column is full, pick another one."
    end
    @board.update_board(@player_2.choice, @player_2.pieces)
    puts print_board
    abort("#{@player_2.name} is the winner!") if check_winner_player_2
  end

  def check_board_full?
    @board.board_full?
  end

  def prompt_player_1_choice
    while true
      print "\nWhich column do you choose #{@player_1.name}?: "
      choice = gets.chomp.upcase
      break if ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'].include?(choice)
      puts "No such column exists, try again."
    end
    @player_1.choice = choice.downcase
  end

  def prompt_player_2_choice
    while true
      print "\nWhich column do you choose #{@player_2.name}?: "
      choice = gets.chomp.upcase
      break if ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'].include?(choice)
      puts "No such column exists, try again."
    end
    @player_2.choice = choice.downcase
  end
end
