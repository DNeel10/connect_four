

class WinChecker
  attr_reader :board

  def initialize
  end

  def check_wins(board)
    check_vertical_wins(board)
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
end
