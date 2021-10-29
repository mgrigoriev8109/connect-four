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

  def count_connected_cells(starting_cell, move_cell_method, border, current_cell = starting_cell, neighbors = [])
    if @gameboard[current_cell] != ' x'
      neighbors
    elsif @gameboard[current_cell] == ' x' && border.any?(current_cell.to_s)
      neighbors.push(@gameboard[current_cell])
      neighbors
    else
      neighbors.push(@gameboard[current_cell])
      count_connected_cells(starting_cell, move_cell_method, border, move_cell_method.call(current_cell), neighbors)
    end
    neighbors.length - 1
  end
end

def to_the_right(current_cell)
  current_cell += 1
end

def to_the_left(current_cell)
  current_cell -= 1
end

def to_the_top(current_cell)
  current_cell -= 7
end

def to_the_bottom(current_cell)
  current_cell += 7
end

new_game = Game.new
new_game.gameboard

new_board = Board.new 
new_board.cells = new_game.gameboard

new_game.selection(0, ' x')
new_game.selection(1, ' x')
new_game.selection(2, ' x')
new_game.selection(3, ' x')
p new_game.count_connected_cells(35, method(:to_the_right), new_game.border_right)
new_board.show