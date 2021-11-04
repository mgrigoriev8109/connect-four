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

      it 'returns three when three connected to the right of starting cell' do
        game.selection(0, ' x')
        game.selection(1, ' x')
        game.selection(2, ' x')
        game.selection(3, ' x')
        expect(game.count_connected_cells(' x', 35, method(:to_the_right), game.border_right)).to eq(3)
      end

      it 'returns three when three connected to the left of starting cell' do
        game.selection(0, ' x')
        game.selection(1, ' x')
        game.selection(2, ' x')
        game.selection(3, ' x')
        expect(game.count_connected_cells(' x', 38, method(:to_the_left), game.border_right)).to eq(3)
      end

      it 'returns zero when zero connected to the left of starting cell' do
        game.selection(0, ' x')
        game.selection(1, ' x')
        game.selection(2, ' x')
        game.selection(3, ' x')
        game.selection(6, ' x')
        game.selection(6, ' x')
        expect(game.count_connected_cells(' x', 35, method(:to_the_left), game.border_left)).to eq(0)
      end
    end
  end

  describe '#count_all_connected_cells' do
    context 'When a player is counting all connected cells' do
      subject(:game) {described_class.new}  

      it 'returns false when only three connected' do
        game.selection(0, ' x')
        game.selection(1, ' x')
        game.selection(2, ' x')
        game.selection(0, ' x')
        game.selection(0, ' x')
        expect(game.count_all_connected_cells(' x', 35)).to be false
      end

      it 'returns true when four are connected horizontally' do
        game.selection(0, ' x')
        game.selection(1, ' x')
        game.selection(2, ' x')
        game.selection(0, ' x')
        game.selection(0, ' x')
        game.selection(0, ' x')
        expect(game.count_all_connected_cells(' x', 35)).to be true
      end

      it 'returns true when four are connected diagonally' do
        game.selection(0, ' x')
        game.selection(1, ' x')
        game.selection(1, ' x')
        game.selection(2, ' x')
        game.selection(2, ' x')
        game.selection(2, ' x')
        game.selection(3, ' o')
        game.selection(3, ' o')
        game.selection(3, ' o')
        game.selection(3, ' x')
        expect(game.count_all_connected_cells(' x', 17)).to be true
      end

      it 'returns false when only three are connected diagonally' do
        game.selection(0, ' x')
        game.selection(1, ' x')
        game.selection(1, ' x')
        game.selection(2, ' x')
        game.selection(2, ' x')
        game.selection(2, ' x')
        game.selection(3, ' o')
        game.selection(3, ' o')
        game.selection(3, ' o')
        game.selection(3, ' x')
        expect(game.count_all_connected_cells(' x', 17)).to be true
      end

      it 'returns false when border might break function but only three connected' do
        game.selection(0, ' x')
        game.selection(1, ' x')
        game.selection(2, ' x')
        game.selection(6, ' x')
        expect(game.count_all_connected_cells(' x', 0)).to be false
      end
    end
  end

  describe '#play_turn' do
    context 'when user inputs incorrect values followed by correct values' do
      
      subject(:game) {described_class.new}
      let(:player) {instance_double(Player, name: 'Bob', symbol: ' x')}

      before do
        invalid_input = '42'
        valid_input = '41'
        allow(game).to receive(:gets).and_return(invalid_input, valid_input)
      end

      it 'selects the valid cell on the gameboard for the correct values' do
        message = "It appears you did not enter a number between 0 and 41, try again!"
        expect(game.play_turn).to receive(:puts).with(message).once
        game.play_turn(player)
      end
    end
  end
end