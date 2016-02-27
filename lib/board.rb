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

  def check_winner(piece)
    cols, rows = 12, 11
    diagonal_check, vertical_check= 0, 0

    cols.times do |col|
      rows.times do |row|
        if @board[row][col].include?(piece)
          # Check vertical winner
          vertical_check += 1
          return true if vertical_check == 4

          # Check positive right diagonal winner
          begin
            if @board[row][col].strip == @board[row + 1][col + 1].strip &&
                @board[row][col].strip == @board[row + 2][col + 2].strip &&
                @board[row][col].strip == @board[row + 3][col + 3].strip
              return true
            end
          rescue
          end

          # Check negative left diagonal winner
          begin
            if @board[row][col].strip == @board[row - 1][col - 1].strip &&
                @board[row][col].strip == @board[row - 2][col - 2].strip &&
                @board[row][col].strip == @board[row - 3][col - 3].strip
              return true
            end
          rescue
          end

          # Check positive left diagonal winner
          begin
            if @board[row][col].strip == @board[row + 1][col - 1].strip &&
                @board[row][col].strip == @board[row + 2][col - 2].strip &&
                @board[row][col].strip == @board[row + 3][col - 3].strip
              return true
            end
          rescue
          end

          # Check negative right diagonal winner
          begin
            if @board[row][col].strip == @board[row - 1][col + 1].strip &&
                @board[row][col].strip == @board[row - 2][col + 2].strip &&
                @board[row][col].strip == @board[row - 3][col + 3].strip
              return true
            end
          rescue
          end

          next
        end

        # Check horizontal winner
        return true if @board[row].join.gsub(/\s+/, "").include?("#{piece}#{piece}#{piece}#{piece}")
        vertical_check = 0
      end
    end
    false
  end

  def print_board
    cols, rows = 12, 11
    printed_board = ""

    rows.times do |row|
      cols.times do |col|
        printed_board << @board[row][col]
      end
    end

    printed_board
  end

  def column_full?(letter)
    return true if @board[0][LETTER_TO_NUMBER.key(letter.upcase)].include?("X") || @board[0][LETTER_TO_NUMBER.key(letter.upcase)].include?("O")
  end

  def board_full?
    cols, rows = 12, 11

    10.times do |col|
      return false unless column_full?(LETTER_TO_NUMBER[col + 1])
    end
    true
  end

  def update_board(letter, piece)
    cols, rows = 12, 11

    rows.times do |row|
      cols.times do |col|
        if (col == LETTER_TO_NUMBER.key(letter.upcase)) && @board[10 - row][col] == "  "
          return @board[10 - row][col] = "#{piece} "
        elsif (col == LETTER_TO_NUMBER.key(letter.upcase)) && @board[10 - row][col] == " "
          return @board[10 - row][col] = "#{piece}"
        end
      end
    end
  end
end
