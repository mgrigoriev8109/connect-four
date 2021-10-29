require_relative 'board'
class Game 
  attr_accessor :gameboard

  def initialize
    @gameboard = ['00', '01', '02', '03', '04', '05', '06', '07', '08'].concat(('09'..'41').to_a)
  end

  def selection(cell_index, symbol)
    if cell_index > 41 || @gameboard[cell_index] == ' x' || @gameboard[cell_index] == ' o'
      @gameboard[cell_index - 7] = symbol
    else
      cell_index += 7
      selection(cell_index, symbol)
    end
  end

  def check_winner(starting_cell, current_cell = starting_cell, neighbors = [])
    if @gameboard[current_cell] != ' x'
      neighbors
    elsif current_cell == starting_cell
      neighbors.push(@gameboard[current_cell])
      check_winner(starting_cell, current_cell + 1, neighbors)
      check_winner(starting_cell, current_cell - 1, neighbors)
    elsif current_cell > starting_cell
      neighbors.push(@gameboard[current_cell])
      check_winner(starting_cell, current_cell + 1, neighbors)
    elsif current_cell < starting_cell
      neighbors.push(@gameboard[current_cell])
      check_winner(starting_cell, current_cell - 1, neighbors)
    end
    neighbors
    return true if neighbors.length >= 4
  end
end

new_game = Game.new
new_game.gameboard

new_board = Board.new 
new_board.cells = new_game.gameboard

new_game.selection(0, ' x')
new_game.selection(1, ' x')
new_game.selection(2, ' x')
new_game.selection(3, ' x')
p new_game.check_winner(39)
new_board.show