require_relative 'board'

class WinChecker
  attr_reader :board

  def initialize
  end

  def check_wins(board)
    check_vertical_wins(board)
    check_horizontal_wins(board)
  end

  def check_vertical_wins(board)
    board.grid.each do |col|
      col.each_cons(4) do |first, second, third, fourth|
        next if first.nil?
        return true if first == second && first == third && first == fourth 
      end
    end
    false          
  end

  def check_horizontal_wins(board)
    board.grid.each_with_index do |col, cindex|
      col.each_with_index do |row, rindex|
        next if row.nil?
        return true if row == board.grid[cindex + 1][rindex] &&
          row == board.grid[cindex + 2][rindex] &&
          row == board.grid[cindex + 3][rindex]
      end
    end
    false
  end

  def check_diagonal_wins(board)
  end

end
