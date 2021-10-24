class Game 
  attr_accessor :gameboard

  def initialize
    @gameboard = (1..42).to_a
  end

  def selection
  
  end
end

pseudocode for the game class:

this class will be the meat and potatoes of the functionality, and each method should be tested before being written

it will interact with the Board class to display whatever changes are made in the board

and it will interact with the Player class to create two new players and alternate between their turns

So first let's start off with having only a single player, performing the simplest task that player can do

We're going to write a test for the method that will allow a player to select where to place selection

This method will pass if new_game.selection(cell, player) returns the player symbol in that cell