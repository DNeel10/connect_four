# frozen_string_literal: true

require './lib/game'
require './lib/player'
require './lib/board'

describe Game do
  describe '#initialize' do
    subject(:new_game) { described_class.new }

    it 'creates a player with a red marker' do
      red_player = new_game.instance_variable_get(:@red_player)
      expect(red_player.color).to eq('Red')
    end

    it 'creates a player with a black marker' do
      black_player = new_game.instance_variable_get(:@black_player)
      expect(black_player.color).to eq('Black')
    end

    it 'creates an array object for the board' do
      board = new_game.instance_variable_get(:@board)
      expect(board.grid).to be_an_instance_of(Array)
    end
  end

  describe '#play_game' do
    # Public Script Method -> No test necessary, but all methods inside should
    # be tested.
  end


end
