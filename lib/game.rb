# frozen_string_literal: true

class Game
  attr_reader :players, :red_player, :black_player, :board

  def initialize(red_player = Player.new('Red'), black_player = Player.new('Black'))
    @red_player = red_player
    @black_player = black_player
    @players = [red_player, black_player]
    @board = Board.new
  end

  def play_game
    # players take turns placing piece
    # # red places marker in a column
    # # black places marker in a column
    # end the game if game_over?
  end

  def turn_loop
    players.each do |player|
      player.player_turn(board) unless game_won?
    end
  end

  def game_won?
  end

end
