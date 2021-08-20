require_relative "human"
require_relative "board"
require_relative "computer"

class Game
    attr_reader :board, :current, :players
    def initialize(s, hash)
        @board = Board.new(s)
        @players = []
        hash.keys.each do |k|
            @players << HumanPlayer.new(k) if hash[k] == false
            @players << Computer.new(k) if hash[k] == true
        end
        @current = @players[0]
    end
    def switch_turn
        @current = @players.rotate!.first
    end
    def play
        while @board.empty_positions?
            puts "-----------------"
            @board.print
            pos = @current.get_position(@board.legal_positions)
            m = @current.mark
            @board.place_mark(pos, m)
            if @board.win?(m)
                puts "You have won the game!"
                return 
            end
            self.switch_turn
        end
        puts "It is a draw"
    end
end

players = {X: false, Y: true, Z: false}
g = Game.new(4,players)
p g.players
g.play

