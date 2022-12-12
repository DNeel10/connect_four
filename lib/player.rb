# frozen_string_literal: true

require_relative 'board'

class Player
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def player_turn(board)
    puts 'Please input a column to drop your marker'

    user_input = gets.chomp.to_i
    board.drop_marker(user_input, color)
  end
end
