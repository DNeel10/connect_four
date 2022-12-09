# frozen_string_literal: true

class Game
  def initialize(red_player = Player.new('Red'), black_player = Player.new('Black'))
    @red_player = red_player
    @black_player = black_player
    @board = Board.new
  end

  def play_game
    # players take turns placing piece
    # # red places marker in a column
    # # black places marker in a column
    # end the game if game_over?
  end
end
