class Player 

  attr_accessor :name, :symbol, :choice

  def initialize (name = 'test_player', symbol = ' x')
    @name = name
    @symbol = symbol
    @choice = 0
  end
end