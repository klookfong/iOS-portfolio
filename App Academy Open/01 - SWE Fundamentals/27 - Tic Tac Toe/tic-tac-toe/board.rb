class Board
    attr_reader :board
    def initialize(s)
        # get an empty board
        @board = Array.new(s) { Array.new(s,"_") }
    end
    def valid?(pos)
        row = pos[0]
        col = pos[1]
        return false if row >= @board.length || col >= @board[0].length
        return false if row < 0 || col < 0
        true
    end
    def empty?(pos)
        return false if !self.valid?(pos)
        @board[pos[0]][pos[1]] == "_"
    end
    def place_mark(pos, mark)
        if !empty?(pos) || !valid?(pos)
            raise "Invalid position!"
            return
        end
        @board[pos[0]][pos[1]] = mark
    end
    def print
        @board.each { |row| p row }
    end
    def win_row?(mark)
        @board.any? { |row| row.all?{ |c| c==mark } } 
    end
    def win_col?(mark)
        flag = false
        @board[0].each_with_index do |el, i|
            flag = true if @board.all? { |row| row[i] == mark }
        end
        flag
    end
    def win_diagonal?(mark)
        # win either left or right diagonal
        left = (0...@board.length).all? do |i|
            pos = [i,i]
            @board[pos[0]][pos[1]] == mark
        end
        right = (0...@board.length).all? do |i|
            row = i
            col = @board.length - 1 - i
            @board[row][col] == mark
        end
        right || left
    end
    def win?(mark)
        return true if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
        false
    end
    def empty_positions?
        @board.any? { |row| row.any? { |c| c=="_" } } 
    end
    def legal_positions
        pos = []
        @board.each_with_index do |row, r|
            row.each_with_index do |col, c|
                pos << [r,c] if valid?([r,c]) && empty?([r,c])
            end
        end
        pos
    end
end

# # -----TESTING-----
# b = Board.new(10)
# b.place_mark([2, 0], :O)
# b.place_mark([1, 1], :O)
# b.place_mark([0, 2], :O)
# # b.place_mark([1, 1], :O)
# b.print
# p b.win_col?(:O)
# p b.win_row?(:O)
# p b.win_diagonal?(:O)
# p b.win?(:O)
# p b.empty_positions?