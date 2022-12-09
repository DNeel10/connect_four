# frozen_string_literal: true

require_relative 'cell'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(6) { Array.new(7, nil) }
  end

  def drop_marker(column, color)
    return make_valid_move(column, color) unless full?(column)

    puts 'This column is full, please select another column'
  end

  def make_valid_move(column, color, grid = @grid)
    grid[column].each_with_index do |cell, index|
      next unless cell.nil?

      grid[column][index] = color
      break
    end
    grid
  end

  def full?(column, grid = @grid)
    grid[column].none?(&:nil?)
  end
end
