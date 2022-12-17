require_relative 'board'

class WinChecker
  attr_reader :board

  def initialize
  end

  def check_wins(board)
    return true if check_vertical_wins(board)
    return true if check_horizontal_wins(board)
    return true if check_diagonal_wins(board)
  end

  def check_vertical_wins(board)
    board.grid.each do |col|
      col.each_cons(4) do |first, second, third, fourth|
        next if first.nil? || second.nil? || third.nil? || fourth.nil?
        return true if first == second && first == third && first == fourth 
      end
    end
    false
  end

  def check_horizontal_wins(board)
    board.grid.each_with_index do |col, cindex|
      col.each_with_index do |row, rindex|
        next if row.nil?
        next if cindex > 3
        return true if row == board.grid[cindex + 1][rindex] &&
                       row == board.grid[cindex + 2][rindex] &&
                       row == board.grid[cindex + 3][rindex]
      end
    end
    false
  end

  def check_diagonal_wins(board)
    return check_up_right(board) if check_up_right(board)

    return check_down_right(board) if check_down_right(board)

    return check_up_left(board) if check_up_left(board)

    return check_down_left(board) if check_down_left(board)

    false
  end

  def check_up_right(board)
    board.grid.each_with_index do |col, cindex|
      col.each_with_index do |row, rindex|
        next if row.nil?
        next if cindex > 3 || rindex > 2
        return true if board.grid[cindex][rindex] == board.grid[cindex + 1][rindex + 1] &&
                       board.grid[cindex][rindex] == board.grid[cindex + 2][rindex + 2] &&
                       board.grid[cindex][rindex] == board.grid[cindex + 3][rindex + 3]
      end
    end
    false
  end

  def check_down_right(board)
    board.grid.each_with_index do |col, cindex|
      col.each_with_index do |row, rindex|
        next if row.nil?
        next if cindex > 3 || rindex < 3
        return true if board.grid[cindex][rindex] == board.grid[cindex + 1][rindex - 1] &&
                       board.grid[cindex][rindex] == board.grid[cindex + 2][rindex - 2] &&
                       board.grid[cindex][rindex] == board.grid[cindex + 3][rindex - 3]
      end
    end
    false
  end

  def check_up_left(board)
    board.grid.each_with_index do |col, cindex|
      col.each_with_index do |row, rindex|
        next if row.nil?
        next if cindex < 3 || rindex > 2
        return true if board.grid[cindex][rindex] == board.grid[cindex - 1][rindex + 1] &&
                       board.grid[cindex][rindex] == board.grid[cindex - 2][rindex + 2] &&
                       board.grid[cindex][rindex] == board.grid[cindex - 3][rindex + 3]
      end
    end
    false
  end 

  def check_down_left(board)
    board.grid.each_with_index do |col, cindex|
      col.each_with_index do |row, rindex|
        next if row.nil?
        next if cindex < 3 || rindex < 3
        return true if board.grid[cindex][rindex] == board.grid[cindex - 1][rindex - 1] &&
                       board.grid[cindex][rindex] == board.grid[cindex - 2][rindex - 2] &&
                       board.grid[cindex][rindex] == board.grid[cindex - 3][rindex - 3]
      end
    end
    false
  end 
end
