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
        board.grid[3] = ['black', 'black', 'black', 'black', nil, nil]
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

  describe '#check_horizontal_wins' do
    context 'player has 4 markers in a horizontal alignment along the bottom' do
      let(:board) { instance_double(Board, :grid => Array.new(7) { Array.new(6, nil) }) }
      subject(:win_horizontal) { described_class.new }

      before do
        board.grid[0] = ['black', nil, nil, nil, nil, nil, nil]
        board.grid[1] = ['black', nil, nil, nil, nil, nil, nil]
        board.grid[2] = ['black', nil, nil, nil, nil, nil, nil]
        board.grid[3] = ['black', nil, nil, nil, nil, nil, nil]
        board.grid[4] = [nil, nil, nil, nil, nil, nil]
        board.grid[5] = [nil, nil, nil, nil, nil, nil]
        board.grid[6] = [nil, nil, nil, nil, nil, nil]
      end

      it 'returns true' do
        expect(win_horizontal.check_horizontal_wins(board)).to eq true
      end
    end

    context 'player has 4 markers in a horizontal alignment along the top' do
      let(:board) { instance_double(Board, :grid => Array.new(7) { Array.new(6, nil) }) }
      subject(:win_horizontal) { described_class.new }

      before do
        board.grid[0] = [nil, nil, nil, nil, nil, nil, 'black']
        board.grid[1] = [nil, nil, nil, nil, nil, nil, 'black']
        board.grid[2] = [nil, nil, nil, nil, nil, nil, 'black']
        board.grid[3] = [nil, nil, nil, nil, nil, nil, 'black']
        board.grid[4] = [nil, nil, nil, nil, nil, nil]
        board.grid[5] = [nil, nil, nil, nil, nil, nil]
        board.grid[6] = [nil, nil, nil, nil, nil, nil]
      end

      it 'returns true' do
        expect(win_horizontal.check_horizontal_wins(board)).to eq true
      end
    end

    context 'player has 4 markers in a horizontal alignment in the middle of the board' do
      let(:board) { instance_double(Board, :grid => Array.new(7) { Array.new(6, nil) }) }
      subject(:win_horizontal) { described_class.new }

      before do
        board.grid[0] = [nil, nil, nil, nil, nil, nil, nil]
        board.grid[1] = [nil, nil, nil, nil, nil, nil, nil]
        board.grid[2] = [nil, nil, nil, 'black', nil, nil, nil]
        board.grid[3] = [nil, nil, nil, 'black', nil, nil, nil]
        board.grid[4] = [nil, nil, nil, 'black', nil, nil, nil]
        board.grid[5] = [nil, nil, nil, 'black', nil, nil, nil]
        board.grid[6] = [nil, nil, nil, nil, nil, nil, nil]
      end

      it 'returns true' do
        expect(win_horizontal.check_horizontal_wins(board)).to eq true
      end
    end

    context 'player does not have 4 markers in a horizontal alignment' do
      let(:board) { instance_double(Board, :grid => Array.new(7) { Array.new(6, nil) }) }
      subject(:win_horizontal) { described_class.new }

      before do
        board.grid[0] = ['red', nil, nil, nil, nil, nil, nil]
        board.grid[1] = ['red', nil, nil, nil, nil, nil, nil]
        board.grid[2] = ['black', nil, nil, nil, nil, nil, nil]
        board.grid[3] = ['black', nil, nil, nil, nil, nil, nil]
        board.grid[4] = [nil, nil, nil, nil, nil, nil]
        board.grid[5] = [nil, nil, nil, nil, nil, nil]
        board.grid[6] = [nil, nil, nil, nil, nil, nil]
      end

      it 'returns false' do
        expect(win_horizontal.check_horizontal_wins(board)).to eq false
      end
    end
  end

  describe '#check_diagonal_wins' do
    subject(:win_diagonal) { described_class.new }
    let(:board) { instance_double(Board, :grid => Array.new(7) { Array.new(6, nil) }) }

    context 'player has 4 markers in a row from bottom left, moving up and right' do
      before do
        board.grid[0] = ['red', nil, nil, nil, nil, nil]
        board.grid[1] = ['black', 'red', nil, nil, nil, nil]
        board.grid[2] = [nil, 'black', 'red', nil, nil, nil]
        board.grid[3] = [nil, nil, 'black', nil, nil, nil]
        board.grid[4] = [nil, nil, nil, 'black', nil, nil]
        board.grid[5] = [nil, nil, nil, nil, nil, nil]
        board.grid[6] = [nil, nil, nil, nil, nil, nil]
      end

      it 'returns true' do
        expect(win_diagonal.check_diagonal_wins(board)).to eq true
      end
    end

    context 'player has 3 markers in a row from column 5, moving up and right' do
      before do
        board.grid[0] = [nil, nil, nil, nil, nil, nil]
        board.grid[1] = [nil, nil, nil, nil, nil, nil]
        board.grid[2] = [nil, nil, nil, nil, nil, nil]
        board.grid[3] = [nil, nil, nil, nil, nil, nil]
        board.grid[4] = [nil, nil, nil, 'black', nil, nil]
        board.grid[5] = [nil, nil, nil, nil, 'black', nil]
        board.grid[6] = [nil, nil, nil, nil, nil, 'black']
      end

      it 'returns false' do
        expect(win_diagonal.check_diagonal_wins(board)).to eq false
      end
    end
  end
end
