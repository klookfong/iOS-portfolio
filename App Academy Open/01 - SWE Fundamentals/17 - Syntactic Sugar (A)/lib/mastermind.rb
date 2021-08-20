require_relative "code"

class Mastermind
    def initialize(len)
        @secret_code = Code.random(len)
    end

    def print_matches(code)
        puts @secret_code.num_exact_matches(code)
        puts @secret_code.num_near_matches(code)
    end

    def ask_user_for_guess
        puts "Enter a code"
        guess=gets.chomp
        guess_code = Code.from_string(guess)
        self.print_matches(guess_code)
        guess_code == @secret_code
    end
end
