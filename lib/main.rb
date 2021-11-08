require_relative 'board'
require_relative 'player'
require_relative 'game'

loop do
  puts "Would you like to play a round of connect four? Enter yes if you would."
  player_input = gets.chomp.downcase
  break unless player_input == "yes"
  new_game = Game.new
  new_board = Board.new 
  new_board.cells = new_game.gameboard
  new_game.create_players
  loop do
    new_board.show
  
    puts "#{new_game.player_one.name} please select a cell between 0 and 41 to drop x."
    player_selection = new_game.verify_input
    new_game.selection(player_selection, new_game.player_one.symbol)
    new_board.show
    if new_game.count_all_connected_cells(' x', player_selection)
        puts "The game is over, #{new_game.player_one.name} has won!"
        break
    end
    
    puts "#{new_game.player_two.name} please select a cell between 0 and 41 to drop o."
    player_selection = new_game.verify_input
    new_game.selection(player_selection, new_game.player_two.symbol)
    new_board.show
  
    if new_game.count_all_connected_cells(' x', player_selection)
        puts "The game is over, #{new_game.player_two.name} has won!"
        break
    end
  end
  
end
