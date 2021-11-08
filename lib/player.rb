class Player 

  attr_accessor :name, :symbol

  def initialize (name = 'test_player', symbol = ' x')
    @name = name
    @symbol = symbol
  end
end