#spec/game_spec.rb
require 'game'
require 'player'

describe Game do
  describe '#selection' do
    context 'when a player selects a cell' do
      subject(:game) {described_class.new}

      it "returns the player's symbol in that cell's index of the gameboard" do
        expect(game.selection(41, ' x')).to eq(' x')
      end

      it 'drops a cell to the bottom of the board if nothing in the way' do
        game.selection(6, ' x')
        expect(game.gameboard[41]).to eq(' x')
      end

      it 'drops above the first taken cell if there is a cell in the way' do
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

  describe '#count_connected_cells' do
    context 'When a player has four adjescent horizontal choices' do
      subject(:game) {described_class.new}  

      it 'returns true when four connected to the right of starting cell' do
        game.selection(0, ' x')
        game.selection(1, ' x')
        game.selection(2, ' x')
        game.selection(3, ' x')
        expect(game.count_connected_cells(35, method(:to_the_right), game.border_right)).to eq(3)
      end

      it 'returns true when four connected to the left of starting cell' do
        game.selection(0, ' x')
        game.selection(1, ' x')
        game.selection(2, ' x')
        game.selection(3, ' x')
        expect(game.count_connected_cells(38, method(:to_the_left), game.border_right)).to eq(3)
      end

    end
  end

end