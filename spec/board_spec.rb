# frozen_string_literal: true

require './lib/board'

describe Board do
  describe '#drop_marker' do
    subject(:board_drop) { described_class.new }

    context 'when a player selects to drop their marker in a column with open spaces' do
      before do
        selected_column = 4
        board_drop.grid[selected_column] = ['black', 'red', 'black', 'red', 'black', nil, nil]
      end

      it 'calls make_valid_move' do
        column = 4
        color = 'red'
        expect(board_drop).to receive(:make_valid_move)
        board_drop.drop_marker(column, color)
      end

      it 'returns the grid' do
        grid = board_drop.grid
        expect(board_drop.drop_marker(4, 'Black')).to eq(grid)
      end
    end
  end

  describe '#make_valid_move' do
    subject(:board_drop) { described_class.new}

    context 'when a player selects to drop their marker in an empty column' do
      it 'drops the marker to the first available cell' do
        expect{ board_drop.make_valid_move(4, 'Black') }.to change { board_drop.grid[4].first }.to eq('Black')
      end
    end
  end

  describe '#open_space?' do
    subject(:column_full) { described_class.new }

    context 'when a column is full of markers' do
      before do
        selected_column = 4
        column_full.grid[selected_column] = %w[black red black red black red black]
      end

      it 'returns false' do
        selected_column = 4
        expect(column_full).not_to be_open_space(selected_column)
      end
    end
  end
end
