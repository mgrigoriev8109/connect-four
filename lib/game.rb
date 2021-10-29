require_relative 'board'
class Game 
  attr_accessor :gameboard, :border_left, :border_right
 
  def initialize
    @gameboard = ['00', '01', '02', '03', '04', '05', '06', '07', '08'].concat(('09'..'41').to_a)
    @border_left = ['00', '07', '14', '21', '28', '35']
    @border_right = ['06', '13', '20', '27', '34', '41']
    @border_top = ['00', '01', '02', '03', '04', '05', '06']
    @border_bottom = ('35'..'41').to_a
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
    left_right_border = @border_left.concat(@border_right)
    if @gameboard[current_cell] != ' x'
      neighbors
    elsif current_cell == starting_cell
      neighbors.push(@gameboard[current_cell])
      check_winner(starting_cell, current_cell + 1, neighbors)
      check_winner(starting_cell, current_cell - 1, neighbors)
    elsif @gameboard[current_cell] == ' x' && left_right_border.any?(current_cell.to_s)
      neighbors.push(@gameboard[current_cell])
      neighbors
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
new_game.selection(6, ' x')
new_game.selection(6, ' x')
new_game.selection(1, ' x')
new_game.selection(2, ' x')
p new_game.check_winner(37)
new_board.show