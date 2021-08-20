require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size/2
    end

    def start_game
        @board.place_random_ships
        puts @board.size/4
        @board.print
    end

    def lose?
        print "you lose" if @remaining_misses <= 0 
        @remaining_misses <= 0 
    end

    def win? 
        print "you win" if @board.num_ships == 0 
        return true if @board.num_ships == 0
        false
    end

    def game_over?
        return true if win? || lose?
        false
    end

    def turn
        move = @player.get_move
        res = @board.attack(move)
        @remaining_misses -= 1 if !res
        @board.print
        print @remaining_misses

    end
end
