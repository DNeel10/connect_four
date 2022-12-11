# frozen_string_literal: true

require './lib/player'
require './lib/board'

describe Player do
  subject(:player_drop) { Player.new('Black') }
  let(:board) { instance_double(Board) }

  describe '#player_turn' do
    before do
      allow(board).to receive(:drop_marker)
    end

    it 'selects a column to drop their marker' do
      column = '4'
      expect(player_drop).to receive(:gets).and_return(column)
      player_drop.player_turn(board)
    end
  end
end
