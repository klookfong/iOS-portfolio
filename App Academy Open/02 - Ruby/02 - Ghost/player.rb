
class Player
    attr_accessor :name
    def initialize(name)
        @name = name
    end

    def invalid_guess(ltr)
        puts "#{ltr} is not a valid letter"
        puts "you must guess a letter from a...z"
    end

    def guess(frag)
        puts "fragment: #{frag}\nplease put your guess"
        guess = gets.chomp
        guess.downcase
    end

    def name
        @name
    end

end