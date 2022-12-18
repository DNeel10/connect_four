
module Display

  def display_win_message(winner = @winner)
    puts "Congratulations #{winner.color} player! You have won!"
  end

  def introduction
    <<-HEREDOC
    Welcome to Connect 4!

    Rules:
    1. Players will alternate turns dropping markers into the 7 x 6 board
      - Markers will always fall to the lowest open spot in the selected column.
    2. When a player gets 4 markers in a row either horizontally, vertically, or diagonally, he/she wins
    3. Player one will use the red markers, Player 2 will use the black markers.

    Player one (Red) will go first!

    HEREDOC
  end

  def display_game_board(board = @board.grid)
    grid = board.flatten.map { |val| val.nil? ? ' ' : val }

    puts ''
    puts '|  1  |  2  |  3  |  4  |  5  |  6  |  7  |'
    puts "|  #{grid[5]}  |  #{grid[11]}  |  #{grid[17]}  |  #{grid[23]}  |  #{grid[29]}  |  #{grid[35]}  |  #{grid[41]}  |"
    puts '|-----+-----+-----+-----+-----+-----+-----|'
    puts "|  #{grid[4]}  |  #{grid[10]}  |  #{grid[16]}  |  #{grid[22]}  |  #{grid[28]}  |  #{grid[34]}  |  #{grid[40]}  |"
    puts '|-----+-----+-----+-----+-----+-----+-----|'
    puts "|  #{grid[3]}  |  #{grid[9]}  |  #{grid[15]}  |  #{grid[21]}  |  #{grid[27]}  |  #{grid[33]}  |  #{grid[39]}  |"
    puts '|-----+-----+-----+-----+-----+-----+-----|'
    puts "|  #{grid[2]}  |  #{grid[8]}  |  #{grid[14]}  |  #{grid[20]}  |  #{grid[26]}  |  #{grid[32]}  |  #{grid[38]}  |"
    puts '|-----+-----+-----+-----+-----+-----+-----|'
    puts "|  #{grid[1]}  |  #{grid[7]}  |  #{grid[13]}  |  #{grid[19]}  |  #{grid[25]}  |  #{grid[31]}  |  #{grid[37]}  |"
    puts '|-----+-----+-----+-----+-----+-----+-----|'
    puts "|  #{grid[0]}  |  #{grid[6]}  |  #{grid[12]}  |  #{grid[18]}  |  #{grid[24]}  |  #{grid[30]}  |  #{grid[36]}  |"
    puts '|-----+-----+-----+-----+-----+-----+-----|'
    puts ''
  end
end