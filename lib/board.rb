class Board
  LETTER_TO_NUMBER = { 1 => 'A', 2 => 'B', 3 => 'C', 4 => 'D', 5 => 'E', 6 => 'F', 7 => 'G', 8 => 'H', 9 => 'I', 10 => 'J' }

  def initialize
    @board = create_board
  end

  def create_board
    cols, rows = 12, 11
    board = Array.new(rows) { Array.new(cols) }

    rows.times do |row|
      cols.times do |col|
        if col == 0 || col == 11
          board[row][col] = "|"
          board[row][col] = "|\n" if col == 11
          board[row][col] = " " if row == 10
        elsif row == 10
          board[row][col] = "#{LETTER_TO_NUMBER[col]} "
          board[row][col] = "#{LETTER_TO_NUMBER[col]}" if col == 10
        else
          board[row][col] = "  "
          board[row][col] = " " if col == 10
        end
      end
    end

    board
  end

  def update_board
    cols, rows = 12, 11
    printed_board = ""

    rows.times do |row|
      cols.times do |col|
        printed_board << @board[row][col]
      end
    end

    printed_board
  end
end
