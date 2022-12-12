require './lib/win_checker'
require './lib/board'

describe WinChecker do
  describe '#check_wins' do
    # Public Script Method -> No test necessary, but all methods inside should
    # be tested.
  end

  describe '#check_vertical_wins' do
    context 'black player has 4 markers in a vertical alignment' do
      let(:board) { instance_double(Board, :grid => Array.new(7) { Array.new(6, nil) }) }
      subject(:win_vertical) { described_class.new }

      before do 
        board.grid[0] = ['black', 'black', 'black', 'black', nil, nil]
      end

      it 'returns true' do
        expect(win_vertical.check_vertical_wins(board)).to eq true
      end
    end

    context 'black player has 2 markers in a vertical alignment' do
      let(:board) { instance_double(Board, :grid => Array.new(7) { Array.new(6, nil) }) }
      subject(:game_vertical) { described_class.new }

      before do 
        board.grid[0] = ['black', 'black', nil, nil, nil, nil]
      end

      it 'returns false' do
        expect(game_vertical.check_vertical_wins(board)).to eq false
      end
    end
  end
end
