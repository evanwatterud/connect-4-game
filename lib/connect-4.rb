require_relative "game"

game = Game.new

game.set_names

puts "This is the game board:"
puts game.print_board

while true
  abort("It's a tie!") if game.check_board_full?
  game.player_1_turn
  game.player_2_turn
end
