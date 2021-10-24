#spec/game_spec.rb
require 'game'

describe Game do
  describe '#selection' do
    context "when a player selects a cell" do
      subject(:game) {Game.new}

      it "returns the player's symbol in that cell's index of the gameboard" do

        
        #This method will pass if new_game.selection(cell, player) returns the player symbol in that cell

      end
    end
  end
end