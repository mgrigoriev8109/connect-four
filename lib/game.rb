require_relative 'board'
require_relative 'player'
class Game 
  attr_accessor :gameboard, :player_one, :player_two
  attr_reader :border_top, :border_right, :border_left, :border_bottom
 
  def initialize
    @gameboard = ['00', '01', '02', '03', '04', '05', '06', '07', '08'].concat(('09'..'41').to_a)
    @border_left = ['00', '07', '14', '21', '28', '35']
    @border_right = ['06', '13', '20', '27', '34', '41']
    @border_top = ['00', '01', '02', '03', '04', '05', '06']
    @border_bottom = ('35'..'41').to_a
    @border_top_left = @border_top + @border_left
    @border_top_right = @border_top + @border_right
    @border_bottom_left = @border_bottom + @border_left
    @border_bottom_right = @border_bottom + @border_right
  end

  def create_players
    puts "Please One, please enter your name."
    @player_one = Player.new(gets.chomp, ' x')
    puts "Thank you #{player_one.name}, your symbol will be X"
    puts "Please Two, please enter your name."
    @player_two = Player.new(gets.chomp, ' o')
    puts "Thank you #{player_two.name}, your symbol will be O"
  end

  def play_turn(player)
    loop do
      puts "#{player.name}, please select the cell to drop your symbol #{player.symbol}."
      player.choice = gets.chomp
      break if ('0'..'41').any?(player.choice)
      puts "It appears you did not enter a number between 0 and 41, try again!"
    end
    selection(player.choice, player.symbol)
  end

  def selection(cell_index, symbol)
    if cell_index > 41 || @gameboard[cell_index] == ' o' || @gameboard[cell_index] == ' x'
      @gameboard[cell_index - 7] = symbol
    else
      cell_index += 7
      selection(cell_index, symbol)
    end
  end

  def count_connected_cells(symbol, starting_cell, move_cell_method, border, current_cell = starting_cell, neighbors = [])
    if @gameboard[current_cell] != symbol
      neighbors
    elsif @gameboard[current_cell] == symbol && border.any?(current_cell.to_s)
      neighbors.push(@gameboard[current_cell])
      neighbors
    else
      neighbors.push(@gameboard[current_cell])
      count_connected_cells(symbol, starting_cell, move_cell_method, border, move_cell_method.call(current_cell), neighbors)
    end
    neighbors.length - 1
  end

  def count_all_connected_cells(symbol, current_cell)
    if (count_connected_cells(symbol, current_cell, method(:to_the_top), @border_top) + count_connected_cells(symbol, current_cell, method(:to_the_bottom), @border_bottom)) >= 3
      true
    elsif (count_connected_cells(symbol, current_cell, method(:to_the_left), @border_left) + count_connected_cells(symbol, current_cell, method(:to_the_right), @border_right)) >= 3
      true
    elsif (count_connected_cells(symbol, current_cell, method(:to_the_top_left), @border_top_left) + count_connected_cells(symbol, current_cell, method(:to_the_bottom_right), @border_bottom_right)) >= 3
      true
    elsif (count_connected_cells(symbol, current_cell, method(:to_the_top_right), @border_top_right) + count_connected_cells(symbol, current_cell, method(:to_the_bottom_left), @border_bottom_left)) >= 3
      true
    else
      false
    end
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

def to_the_top_left(current_cell)
  current_cell -= 8
end

def to_the_top_right(current_cell)
  current_cell -= 6
end

def to_the_bottom_left(current_cell)
  current_cell += 6
end

def to_the_bottom_right(current_cell)
  current_cell += 8
end

#new_game = Game.new
#new_game.create_players
#new_board = Board.new 
#new_board.cells = new_game.gameboard
#new_game.play_turn
#new_board.show