require_relative "board"
require_relative "card"

class Game
    def initialize(size)
        @board = Board.new(size)
        @size = size
        self.play
        @game_over = false
    end
    def play
        last = nil
        until @game_over == true
            @board.render
            # get row and column
            res = false
            until res
                puts "enter a row"
                row = gets.chomp
                if row == "cheat"
                    self.cheat 
                    break
                else
                    row = row.to_i
                end
                until valid_index(row)
                    puts "enter a valid row"
                    row = gets.chomp.to_i
                end

                puts "enter a column"
                col = gets.chomp.to_i
                until valid_index(col)
                    puts "enter a valid column"
                    col = gets.chomp.to_i
                end

                if last != nil
                    
                    res = @board.guess(row,col, last[0], last[1]) 
                    last = nil
                    
                else
                    res = @board.guess(row,col) 
                    last = []
                    last << row
                    last << col
                    
                end
            end
            @game_over = @board.won?
        end
    end
    def valid_index(idx)
        idx <= @board.length && idx >= 0
    end

    def cheat
        @board.cheat
        @board.render
        @board.uncheat
    end
end

g = Game.new(4)