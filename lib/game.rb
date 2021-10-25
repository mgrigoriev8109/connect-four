require_relative 'board'
class Game 
  attr_accessor :gameboard

  def initialize
    @gameboard = ['00', '01', '02', '03', '04', '05', '06', '07', '08'].concat(('09'..'41').to_a)
  end

  def selection(cell_index, symbol)
    if cell_index + 7 > 41 || @gameboard[cell_index + 7] == ' x' || @gameboard[cell_index + 7] == ' o'
      @gameboard[cell_index] = symbol
      @gameboard[cell_index]
    else
      selection(cell_index + 7, symbol)
    end
  end
end

new_game = Game.new
new_game.gameboard
new_game.selection(6, ' x')
new_board = Board.new 
new_board.cells = new_game.gameboard
new_board.show