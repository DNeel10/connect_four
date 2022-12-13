# frozen_string_literal: true

require './lib/game'
require './lib/player'
require './lib/board'
require './lib/win_checker'

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

  describe '#turn_loop' do
    context 'when no winner has been found' do
      subject(:game_loop) { described_class.new }

      before do
        allow(game_loop).to receive(:game_won?).and_return(false)
      end

      it 'sends player_turn to player_one' do
        player_one = game_loop.instance_variable_get(:@red_player)
        game_board = game_loop.instance_variable_get(:@board)
        allow(player_one).to receive(:gets).with(4)
        expect(player_one).to receive(:player_turn).with(game_board)
        game_loop.turn_loop
      end

      it 'sends player_turn to player_two' do
        player_two = game_loop.instance_variable_get(:@black_player)
        game_board = game_loop.instance_variable_get(:@board)
        allow(player_two).to receive(:gets).with(4)
        expect(player_two).to receive(:player_turn).with(game_board)
        game_loop.turn_loop
      end
    end

    context 'when a winner has been found BEFORE player one makes a move' do
      subject(:game_loop) { described_class.new }

      before do
        allow(game_loop).to receive(:game_won?).and_return(true)
      end

      it 'stops the loop before player one receives his turn' do
        player_one = game_loop.instance_variable_get(:@red_player)
        expect(player_one).not_to receive(:player_turn)
        game_loop.turn_loop
      end
    end

    context 'when a winner has been found AFTER player one makes a move' do
      subject(:game_loop) { described_class.new }

      before do
        allow(game_loop).to receive(:game_won?).and_return(false, true)
      end

      it 'stops the loop before player two receives his turn' do
        player_two = game_loop.instance_variable_get(:@black_player)
        expect(player_two).not_to receive(:player_turn)
        game_loop.turn_loop
      end
    end
  end

  describe '#game_won?' do
    subject(:game_over) {described_class.new }
    let(:win_checker) { instance_double(WinChecker) }

    it 'sends check wins to the winchecker' do
      win = game_over.instance_variable_get(:@win_checker)
      game_board = game_over.instance_variable_get(:@board)
      expect(win).to receive(:check_wins).with(game_board).once
      game_over.game_won?
    end
  end
end
