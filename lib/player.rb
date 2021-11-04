class Player 

  attr_accessor :name, :symbol, :selection

  def initialize (name = 'test_player', symbol = ' x')
    @name = name
    @symbol = symbol
    @selection = 0
  end
end