# frozen_string_literal: true

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(7) { Array.new(6, nil) }
  end

  def drop_marker(column, color)
    return make_valid_move(column, color) if open_space?(column)
  end

  def make_valid_move(column, color, grid = @grid)
    grid[column].each_with_index do |cell, index|
      next unless cell.nil?

      grid[column][index] = color
      break
    end
    grid
  end

  def open_space?(column, grid = @grid)
    grid[column]&.any?(&:nil?)
  end
end
