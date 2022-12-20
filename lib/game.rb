# frozen_string_literal: true

require_relative 'player'
require_relative 'board'
require_relative 'win_checker'
require_relative 'display'
require_relative 'colorable_string'

class Game
  using ColorableString
  include Display

  attr_reader :players, :board, :win_checker, :winner

  MARKER = "\u23FA"

  def initialize
    @players = [Player.new(MARKER.encode('utf-8').fg_color(:red)), Player.new(MARKER.encode.fg_color(:black))]
    @board = Board.new
    @win_checker = WinChecker.new
    @winner = nil
    @tie = nil
  end

  def play_game
    puts introduction
    display_game_board
    turn_loop until @winner || @tie
    display_win_message if @winner
    display_tie_message if @tie
  end

  def turn_loop(board = @board)
    players.each do |player|
      puts "#{player.color} player, please input a column to drop your marker"

      player.player_turn(board)
      display_game_board
      return @winner = player if game_won?
      return @tie = 'Tie' if game_tie?
    end
  end

  def game_won?
    win_checker.check_wins(board)
  end

  def game_tie?
    win_checker.check_ties(board)
  end
end
