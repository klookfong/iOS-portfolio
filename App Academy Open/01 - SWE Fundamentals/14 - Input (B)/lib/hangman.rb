class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word 
    DICTIONARY.sample
  end
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) { |i| "_" }
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end
  def guess_word
    @guess_word
  end
  def attempted_chars
    @attempted_chars
  end
  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indexes = []
    @secret_word.each_char.with_index { |c, i| indexes << i if char == c }
    indexes
  end

  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }
  end

  def try_guess(char)
    if self.already_attempted?(char)
      puts "that has already been attempted"
      return false
    end
    @attempted_chars << char
    @remaining_incorrect_guesses -= 1 if !@secret_word.include?(char)
    i = self.get_matching_indices(char)
    self.fill_indices(char, i)
    return true
  end

  def ask_user_for_guess
    puts "Enter a char:"
    guess = gets.chomp
    result = self.try_guess(guess)
    result
  end

  def win?
    if @guess_word.join != @secret_word
      return false
    end
    puts "WIN"
    true
  end

  def lose?
    return false if @remaining_incorrect_guesses > 0
    puts "LOSE"
    true
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    end
    false
  end
end
