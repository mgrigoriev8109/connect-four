class Game 
  attr_accessor :gameboard

  def initialize
    @gameboard = (1..42).to_a
  end

  def selection(cell_index, symbol)
    @gameboard[cell_index] = symbol
  end
end