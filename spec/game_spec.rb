#spec/game_spec.rb
require 'game'

describe Game do
  describe '#selection' do
    context "when a player selects a cell" do
      subject(:game) {Game.new}

      it "returns the player's symbol in that cell's index of the gameboard" do
        expect(game.selection(41, ' x')).to eq(' x')
      end

      it "drops a cell to the bottom of the board if nothing in the way" do
        game.selection(6, ' x')
        expect(game.gameboard[41]).to eq(' x')
      end

      it "drops above the first taken cell if there is a cell in the way" do
        game.selection(6, ' x')
        game.selection(6, ' x')
        expect(game.gameboard[34]).to eq(' x')
      end

      it "drops properly regardless of 'x' or 'o' being selection" do
        game.selection(6, ' x')
        game.selection(6, ' o')
        game.selection(6, ' x')
        expect(game.gameboard[27]).to eq(' x')
      end

    end
  end
end