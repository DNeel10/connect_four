# frozen_string_literal: true

class Player
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def player_turn(board)
    user_input = gets.chomp.to_i
    board.drop_marker(user_input, color)
  end
end
