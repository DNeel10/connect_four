# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require_relative 'win_checker'
require_relative 'display'

class Game
  include Display
  attr_reader :players, :board, :win_checker, :winner

  def initialize
    @players = [Player.new('R'), Player.new('B')]
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
      puts "#{player.color} player, please input a column to drop your marker"

      player.player_turn(board)
      display_game_board
      return @winner = player if game_won?
    end
  end

  def game_won?
    win_checker.check_wins(board)
  end
end
