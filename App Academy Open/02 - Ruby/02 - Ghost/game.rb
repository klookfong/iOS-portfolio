require_relative("words")
require_relative("player")

class Game
    # CONSTANTS
    MAX_LOSSES = "GHOST".length
    ALPHABET = "abcdefghijklmnopqrstuvwxyz".split("")


    # INITIALIZATION
    attr_accessor :fragment, :players, :dictionary, :losses, :losers
    def initialize(*players)
        @fragment = ""
        @dictionary = []
        $words.each { |word| @dictionary << word }
        @players = players
        @losers = []
        @losses = Hash.new(0)
    end


    # PLAYERS
    def current_player
        @players.first
    end

    def next_player
        @players.rotate!
    end

    def player_lost
        @losers << @players.shift
    end

    def winner
        return @players[0] if @players.length == 1
        false
    end

    def remaining_players
        @players.length
    end


    # DICTIONARY FUNCTIONALITY
    def is_word?(frag)
        @dictionary.include?(frag)
    end

    def valid_char?(char)
        return false if ALPHABET.include?(char) == false
        new_frag = @fragment + char
        @dictionary.any? { |word| word.start_with?(new_frag) }
    end

    
    # GAME FUNCTIONALITY
    def guess
        puts "#{self.current_player.name}'s turn"
        letter = nil
        while letter == nil
            ltr = self.current_player.guess(@fragment)
            if self.valid_char?(ltr) 
                letter = ltr
            else
                self.current_player.invalid_guess(ltr)
            end
        end
        @fragment += letter
        puts "#{self.current_player.name}'has added #{letter}"
    end

    def play_round
        @fragment = ""
        self.all_players
        while !self.is_word?(@fragment)
            self.guess
            self.word_found if self.is_word?(@fragment)
            self.next_player
        end
    end

    def play
        until self.winner != false
            system("clear")
            self.play_round
        end
        puts "#{self.winner.name} has won the game!"
    end

    
    # UPDATING UI
    def word_found
        curr = @players.first.name
        @losses[curr] += 1  
        puts "#{curr} has found the word #{@fragment}"
        puts "#{curr} has recieved the letter #{"GHOST"[@losses[curr]]}"
        if @losses[curr] == MAX_LOSSES - 1
            puts "#{curr} has been eliminated" 
            self.player_lost
        end
    end

    def all_players
        puts "ALL PLAYERS:"
        @players.each { |p| puts "#{p.name}: #{"GHOST"[0..@losses[p.name]]}" }
    end


end

if $PROGRAM_NAME == __FILE__
    game = Game.new(
      Player.new("Gizmo"), 
      Player.new("Breakfast"), 
    #   Player.new("Toby"),
    #   Player.new("Leonardo")
      )
    game.play
end


