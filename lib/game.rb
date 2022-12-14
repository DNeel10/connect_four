# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require_relative 'win_checker'
require_relative 'display'

class Game
  include Display
  attr_reader :players, :red_player, :black_player, :board, :win_checker

  def initialize(red_player = Player.new('R'), black_player = Player.new('B'))
    @red_player = red_player
    @black_player = black_player
    @players = [red_player, black_player]
    @board = Board.new
    @win_checker = WinChecker.new
    @winner = nil
  end

  def play_game
    puts introduction
    display_game_board
    turn_loop until @winner
    display_win_message
  end

  def turn_loop(board = @board)
    players.each do |player|
      player.player_turn(board)
      display_game_board
      return @winner = player if game_won?
    end
  end

  def game_won?
    win_checker.check_wins(board)
  end
end

game = Game.new
game.play_game
