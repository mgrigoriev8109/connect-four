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

  def check_winner_horizontally(cell, neighbors = [])
    if @gameboard[cell] != ' x'
      neighbors
    else
      neighbors.push(@gameboard[cell])
      cell += 1
      check_winner_horizontally(cell, neighbors)
    end
    neighbors
    return true if neighbors.length >= 4
  end
end

new_game = Game.new
new_game.gameboard
new_game.selection(6, ' x')

new_game.selection(6, ' x')
new_game.selection(6, ' x')
new_board = Board.new 
new_board.cells = new_game.gameboard
new_board.show