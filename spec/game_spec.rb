# frozen_string_literal: true

require './lib/game'
require './lib/player'
require './lib/board'
require './lib/win_checker'

describe Game do
  describe '#turn_loop' do
    context 'the game is ongoing' do
      subject(:game_turn) { described_class.new }
      let(:player) { instance_double(Player, color: 'R') }

      before do
        allow(game_turn).to receive(:puts)
      end

      it 'sends player_turn to the each player' do
        board = game_turn.instance_variable_get(:@board)
        players = game_turn.instance_variable_get(:@players)
        players.each do |player|
          expect(player).to receive(:player_turn).with(board)
        end
        game_turn.turn_loop(board)
      end
    end

    context 'the game is won by the first player' do
      subject(:game_winner) { described_class.new }

      before do
        allow(game_winner).to receive(:puts)
        players = game_winner.instance_variable_get(:@players)
        players.each do |player|
          allow(player).to receive(:player_turn)
        end
        allow(game_winner).to receive(:game_won?).and_return(true)
      end

      it 'returns the winner if the game is won by the first player' do
        players = game_winner.instance_variable_get(:@players)
        player = players[0]
        expect { game_winner.turn_loop }.to change { game_winner.instance_variable_get(:@winner) }.to(player)
      end
    end

    context 'the game is won by the second player' do
      subject(:game_winner) { described_class.new }

      before do
        allow(game_winner).to receive(:puts)
        players = game_winner.instance_variable_get(:@players)
        players.each do |player|
          allow(player).to receive(:player_turn)
        end
        allow(game_winner).to receive(:game_won?).and_return(false, true)
      end

      it 'returns the winner if the game is won by the first player' do
        players = game_winner.instance_variable_get(:@players)
        player = players[1]
        expect { game_winner.turn_loop }.to change { game_winner.instance_variable_get(:@winner) }.to(player)
      end
    end
  end

  describe '#game_won?' do
    subject(:game_over) { described_class.new }
    let(:win_checker) { instance_double(WinChecker) }

    it 'sends check wins to the winchecker' do
      win = game_over.instance_variable_get(:@win_checker)
      game_board = game_over.instance_variable_get(:@board)
      expect(win).to receive(:check_wins).with(game_board).once
      game_over.game_won?
    end
  end
end
