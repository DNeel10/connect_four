# frozen_string_literal: true

require_relative 'board'

class Player
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def player_turn(board)
    loop do
      user_input = gets.chomp.to_i - 1
      return board.drop_marker(user_input, color) if board.open_space?(user_input)

      puts "This column is full. Please select another column\n"
    end
  end
end
