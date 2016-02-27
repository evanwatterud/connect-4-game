require_relative "game"

running = true
game = Game.new

game.set_names

puts "This is the game board:"
puts game.print_board
while true
  while true

    if game.check_board_full?
      puts "It's a tie!"
      break if game.play_again?
      running = false
      break
    end

    game.player_1_turn
    if game.check_winner_player_1
      puts "#{game.player_1.name} is the winner!"
      break if game.play_again?
      running = false
      break
    end

    game.player_2_turn
    if game.check_winner_player_2
      puts "#{game.player_2.name} is the winner!"
      break if game.play_again?
      running = false
      break
    end
  end
  break unless running

  # Restart game with same players
  player_1 = game.player_2
  player_2 = game.player_1
  game = Game.new(player_1, player_2)
  puts "Game board cleared: "
  puts game.print_board
end
