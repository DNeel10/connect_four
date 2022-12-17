# frozen_string_literal: true

require './lib/player'
require './lib/board'

describe Player do
  subject(:player_drop) { Player.new('Black') }
  let(:board) { instance_double(Board) }

  describe '#player_turn' do
    context 'player selects an open column' do
      before do
        column = '4'
        user_input = 3
        allow(player_drop).to receive(:gets).and_return(column)
        allow(board).to receive(:open_space?).with(user_input).and_return(true)
      end

      it 'selects a column to drop their marker' do
        user_input = 3
        color = player_drop.instance_variable_get(:@color)
        expect(board).to receive(:drop_marker).with(user_input, color)
        player_drop.player_turn(board)
      end
    end

    context ' player selects a full column then an open column' do
      before do
        column = '4'
        user_input = 3
        color = 'Black'
        allow(player_drop).to receive(:gets).and_return(column)
        allow(board).to receive(:open_space?).with(user_input).and_return(false, true)
        allow(board).to receive(:drop_marker).with(user_input, color)
      end

      it 'completes the loop and displays the error message once' do
        error_message = "This column is full. Please select another column\n"
        expect(player_drop).to receive(:puts).with(error_message).once
        player_drop.player_turn(board)
      end
    end
  end
end
